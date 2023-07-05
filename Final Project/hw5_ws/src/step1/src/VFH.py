#!/usr/bin/python3

import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
from nav_msgs.msg import Odometry
import tf
import math
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from matplotlib.colors import TwoSlopeNorm
import numpy as np
from step1.srv import GetVFHData, GetVFHDataResponse

class VFH():

    def __init__(self):

        rospy.init_node('VFH', anonymous=False)
        self.cmd_vel = rospy.Publisher('/cmd_vel', Twist, queue_size=5)
        self.VFH_service = rospy.Service('vfh_data', GetVFHData, self.path_planning)
        rospy.loginfo(f"service is created")

        # This varibales are input and is going tobe changed 
        # the sevice inputs varibales are goal_x, goal_y and threshold
        self.goal_x = 13
        self.goal_y = 7
        self.threshold = 2.5

        # some varibales related to window and constants of VFH algorithm
        self.alpha = 5                      # angle of each sector
        self.n = 72                         # number of sectors
        self.a = 1                          # <a> parameter in a-bd formula
        self.b = 0.25                       # <b> parameter in a-bd formula
        self.d_max = self.a/self.b          # maximum distance that a-bd is not zero
        self.ws = math.sqrt(2)*self.d_max   # window size (ws = sqrt(2)*dmax)
        self.l = 2                          # l parameter in smoothing formula
        self.s_max = 16                     # boundary for defining wide or narrow valley

        # varibale for saving laser sacn
        self.laser_scan = None              

        # some varibales containing results of VFH algorithm at each step
        self.smooth_hist = []
        self.desired_angle = []
        self.all_valleys = []
        self.goal_angle  = 0
        self.sectors_in_threshold = []

        # some varibales of plot
        self.fig = plt.figure()
        self.fig.set_figheight(self.fig.get_figheight() * 1.5)
        self.axes = [self.fig.add_subplot(211), self.fig.add_subplot(212)]
        self.plots = []
        self.vertical_axlines = []
        self.horizontal_axlines = []
        self.flag = False

    # 1) Define some methods as our tools

    def get_laser_scan(self):
        '''
        This method subscribe scan topic and wait for messages if it.
        if a message is arrived we get the laser scan.
        '''
        self.laser_scan = rospy.wait_for_message("/scan", LaserScan)

    def get_robot_pose(self):
        '''
        get x and y coordinate of position of the robot
        get the yaw angle of robot in world. 
        We call it, heading of the robot.
        '''
        # waiting for the most recent message from topic /odom
        msg = rospy.wait_for_message("/odom" , Odometry)
        
        orientation = msg.pose.pose.orientation
        position = msg.pose.pose.position

        # convert quaternion to odom
        roll, pitch, yaw = tf.transformations.euler_from_quaternion((
            orientation.x ,orientation.y ,orientation.z ,orientation.w
        )) 
        
        return position.x, position.y, yaw
    

    # 2) create polar histogram
    def create_histogram(self):
       '''
       This method get laser scan as its input and then 
       use the related formula for computing h_k:
       1) mij = cij * (a-b dij)
       2) hk = Sigma (mij) for mij in sector k
       '''
       histogram = []
       self.get_laser_scan()
       
       for i in range(self.n):
           
           h_k = 0

           for j in range(5*i, 5*(i+1)):
               d = self.laser_scan.ranges[j]
               # if d = inf then 0*inf=nan so we assign 1000 instead of inf
               if d==math.inf:
                   d=10000
               # we should check if the obstacle is inside square window or not
               cij = 0
               if abs(d*math.cos(math.radians(j))) <=(self.ws/2) and abs(d*math.sin(math.radians(j))) <=(self.ws/2):
                   cij = 1 - (d/self.ws)

               mij = (cij**2)*(self.a - (self.b * d))
               h_k += mij
           
           histogram.append(h_k)
    
       return histogram
    
    # 3) smoothing histogram
    def get_smooth_hist(self, histogram):
        '''
        This method get histogram as an input and smooth it.
        the formula for smoothing is:
        h_prim_k = (h_(k-2) + 2*h_(k-1) + 2*h_(k) + 2*h_(k+1) + h_(k+2))/ (2*2+1)
        '''
        h = histogram
        smooth_histogram = []
        for i in range(self.n):
            h_prim_k = (h[(i-2)%self.n] + 2*h[(i-1)%self.n] + 2*h[i] + 2*h[(i+1)%self.n] + h[(i+2)%self.n])/5
            smooth_histogram.append(h_prim_k)
        
        return smooth_histogram

    # 4) find valleys
    def find_valleys(self ,smooth_histogram):
        # first we should find all sector numbers 
        # wich their h_k is less than threshold
        self.sectors_in_threshold = []
        sector_number = 0
        self.all_valleys = []
        for h_k in smooth_histogram:
            if h_k < self.threshold:
                self.sectors_in_threshold.append(sector_number)
                self.all_valleys.append(h_k)
            else:
                self.all_valleys.append(0)
            sector_number += 1

        # Then we should sperate the acceptable sectors into valleys
        # a series of consequent sector number make a valley
        valleys = []
        valley = []
        for sector_number in self.sectors_in_threshold:
            if not valley or sector_number == valley[-1] + 1:
                valley.append(sector_number)
            else:
                valleys.append(valley)
                valley = [sector_number]    
        if valley:
            valleys.append(valley)

        # now we should consider if 0 exists in first valley and 359 exists in
        # last valley, these valleys are not seperate and we should merge them
        if len(valleys) != 0 and 0 in valleys[0] and (self.n-1) in valleys[len(valleys)-1]:
            valleys[len(valleys)-1] = valleys[len(valleys)-1] + valleys[0]
            valleys.pop(0)

        return valleys

    # 5) find the target sector which the robot should reach it
    def find_target_sector(self):

        robot_x, robot_y, yaw = self.get_robot_pose()
        angle_to_goal = math.atan2(self.goal_y - robot_y, self.goal_x - robot_x)

        target_angle = math.degrees(angle_to_goal - yaw)
        if target_angle <0:
            target_angle += 360

        target_sector = round(target_angle / self.alpha) 

        return target_sector, target_angle
        
    # 6)find desired angle for rotation of robot
    def get_desired_angle(self, valleys, targetsector, target_angle):
        edge_points = []
        #rospy.loginfo(f"P_a : {valleys} ")
        for valley in valleys:
            if targetsector in valley:
                # if target sector is inside one of the valleys we can go straight toward it
                desired_theta = target_angle
                return desired_theta
            else:
                # if its not in a valley we should find nearest valley
                # so here we should save edges of each valley
                edge_points.append(valley[0])
                edge_points.append(valley[len(valley)-1])

        # we wanna find nearest edge to target sector
        my_ruler = 0
        closest_edge = 0
        end_of_valley = False
        while(True):
            my_ruler += 1
            left = targetsector - my_ruler 
            right = targetsector + my_ruler 
            if left >= 0 and left in edge_points:
                closest_edge = left
                end_of_valley = True
                break
            elif left<0 and self.n+left in edge_points:
                closest_edge = self.n+left
                end_of_valley = True
                break
            elif right in edge_points:
                closest_edge = right
                break

        # also according to closest edge we can find its corresponding valley
        best_valley_index = int(edge_points.index(closest_edge)/2)
        best_valley = valleys[best_valley_index]
        kd = 0
        if len(best_valley) <= self.s_max:
            # narrow valley
            kd = best_valley[int(len(best_valley)/2)]
            
        else:
            # wide valley
            if end_of_valley:
                new_valley = best_valley[-self.s_max:]
                kd = new_valley[int(len(new_valley)/2)]
            else:
                new_valley = best_valley[:self.s_max]
                kd = new_valley[int(len(new_valley)/2)]

        desired_theta = kd*self.alpha + self.alpha/2
        
        return desired_theta
        
    # 6)find desired angle for rotation of robot
    def get_desired_angle2(self, valleys, targetsector, target_angle):
        edge_points = []
        #rospy.loginfo(f"P_a : {valleys} ")
        for valley in valleys:
            if targetsector in valley:
                # if target sector is inside one of the valleys we can go straight toward it
                desired_theta = target_angle
                return desired_theta
            else:
                # if its not in a valley we should find nearest valley
                # so here we should save edges of each valley
                edge_points.append(valley[0])
                edge_points.append(valley[len(valley)-1])

        # we wanna find nearest edge to target sector
        my_ruler = 0
        closest_edge = 0
        end_of_valley = False
        while(True):
            my_ruler += 1
            left = targetsector - my_ruler 
            right = targetsector + my_ruler 
            if left >= 0 and left in edge_points:
                closest_edge = left
                end_of_valley = True
                break
            elif left<0 and self.n+left in edge_points:
                closest_edge = self.n+left
                end_of_valley = True
                break
            elif right in edge_points:
                closest_edge = right
                break

        kn = closest_edge
        kf = kn
        # also according to closest edge we can find its corresponding valley
        best_valley_index = int(edge_points.index(closest_edge)/2)
        best_valley = valleys[best_valley_index]
        kd = 0
        if end_of_valley:
            for i in range(1, len(best_valley)-1):
                if (best_valley[-i-1]*self.alpha <90 or best_valley[-i-1]*self.alpha > 270) and i<self.s_max:
                    kf=kn-i
                else:
                    break
        else:
            for i in range(1, len(best_valley)-1):
                if (best_valley[i]*self.alpha <90 or best_valley[i]*self.alpha > 270) and i<self.s_max:
                    kf=kn+i
                else:
                    break
        
        desired_theta = (round((kf+kn)/2)%self.n)*self.alpha
        return desired_theta



    def path_planning(self, goal_details):

        self.goal_x, self.goal_y, self.threshold = goal_details.goal_x, goal_details.goal_y, goal_details.threshold
        #rospy.loginfo(f"server : {[self.goal_x, self.goal_y, self.threshold]} ")
        result = GetVFHDataResponse() 

        #1) create histogram
        hist = self.create_histogram()

        #2) smooth hist
        self.smooth_hist = self.get_smooth_hist(hist)
        
        #3) find valleys
        valleys = self.find_valleys(self.smooth_hist)
        if len(valleys) == 0:
            result.desired_angle = 0
            result.h_prim_c = 1000
            return result
        
        #4) find target sector
        target_sector, target_angle = self.find_target_sector()

        #5) get desired angle
        self.desired_angle = self.get_desired_angle(valleys, target_sector, target_angle)

        #6) create the response of client
        result.desired_angle = self.desired_angle
        #current_sector_to_move = int(self.desired_angle/self.alpha)
        #result.h_prim_c = self.smooth_hist[current_sector_to_move]
        result.h_prim_c = max(max(self.smooth_hist[0:7]), max(self.smooth_hist[65:72]))
        return result
    
    def draw_hist(self, i):
        if self.smooth_hist and not self.flag:
            bins = [x * 5 for x in range(1, int(360 / self.alpha) + 1)]
            for ax, data in zip(self.axes, [self.smooth_hist, self.all_valleys]):
                ax.cla()
                self.plots.append(ax.bar(bins, height=data, width=-self.alpha, align='edge', edgecolor='white'))
                ax.set_xticks([0, 90, 180, 270, 360])
                ax.set_xticklabels(['0°', '90°', '180°', '270°', '360°'])
                ax.set_yticks(sorted(list(ax.get_yticks()) + [self.threshold]))
                ax.set_xlabel('angle(degree)')
                ax.set_ylabel('h_prim_k')
                self.horizontal_axlines.append(ax.axhline(y=self.threshold, color='r', linestyle='--', linewidth=1, label='Threshold'))
                self.vertical_axlines.append(ax.axvline(x=self.desired_angle, color='k', linestyle='--', linewidth=1, label='desired angle'))
                #self.vertical_axlines.append(ax.axvline(x=self.goal_angle, color='g', linestyle='--', linewidth=1, label='goal angle'))
                ax.legend()
                ax.set_title('smooth polar histogram' if ax == self.axes[0] else 'all valleys')
            self.fig.canvas.draw()
            self.fig.canvas.flush_events()
            self.flag = True

        elif self.flag:
            for plot, data in zip(self.plots, [self.smooth_hist, self.all_valleys]):
                for i, bar in enumerate(plot):
                    bar.set_height(data[i])
            for axvline, axhline in zip(self.vertical_axlines, self.horizontal_axlines):
                axvline.set_xdata(self.desired_angle)
                axhline.set_ydata(self.threshold)

if __name__ == '__main__':
       
    vfh = VFH()
    anim = FuncAnimation(vfh.fig, vfh.draw_hist, cache_frame_data=False)
    plt.show(block= True)
    rospy.spin()
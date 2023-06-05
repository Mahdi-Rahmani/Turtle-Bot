# Project 3 
In this project, we want to design a system for our robot with the help of ROS and the control topics that we have learned, which can guide the robot on the desired path or take it to a desired destination. Then we analyze the designed system and evaluate the correctness of its performance. 
Before starting this project, please watch the hands-on videos at links below: 
- Hands-on 1: [PID controller basics](https://drive.google.com/file/d/11eF90FgoxCr46JZfEldzN170AZjDnvi_/view?usp=sharing) also accessible on [youtube](https://youtu.be/etBqCg_aOMY)
- Hands-on 2: [Wall follower with PID](https://drive.google.com/file/d/1Py4_9PD7srGbPZveV7A7JpNc6RZqdbxB/view?usp=sharing) 

## Theory part 
We should answer to some questions about topics below: 

1- Inverse kinematics of a manipulator robot
 
2- Find the Eulerian rotation sequence 
 
3- Find the transformation matrix of object to end effector 

4- Find linear and angular velocity of robot 

5- Find bicycle model of tricycle robot 
 
you can find the answers to these questions at [theory report.](https://github.com/Mahdi-Rahmani/Turtle-Bot/blob/main/Project3/Report/Theory%20part%20report.pdf) 
 
## Simulation part 
### Step1 Part1 
In this section, we want to move the robot from one point to another using the PID controller. The starting point of the robot is at the coordinates (0,0) and the destination of the robot is at the coordinates (10,0). The robot must move from the starting point to the destination point and stop when it reaches the destination. This is done once with P controller, once with PD and once with PID and report the results. 
For this part, we will create a package called step1part1. Then we need to define two nodes in the src folder. One node is responsible for controlling and the other node is for displaying the points where the robot moves in the RViz simulator. You can see this package in [step1part1](https://github.com/Mahdi-Rahmani/Turtle-Bot/tree/main/Project3/hw3_ws/src/step1part1).  
You can see the result of this section in the following video:
<div align="center">

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/Ec9f06ln8WE/0.jpg)](https://www.youtube.com/watch?v=Ec9f06ln8WE)

</div>

Also you can see the result of this each controller in the following images:
P controller    |  PD controller   | PID controller  |
:-------------------------:|:-------------------------:|:-------------------------:|
![](https://github.com/Mahdi-Rahmani/Turtle-Bot/blob/main/Project3/Results_img/step1part1_P.png)  |  ![](https://github.com/Mahdi-Rahmani/Turtle-Bot/blob/main/Project3/Results_img/step1part1_PD.png)  |  ![](https://github.com/Mahdi-Rahmani/Turtle-Bot/blob/main/Project3/Results_img/step1part1_PID.png)  | 
![](https://github.com/Mahdi-Rahmani/Turtle-Bot/blob/main/Project3/Results_img/step1part1_P_angle_err.png)  |  ![](https://github.com/Mahdi-Rahmani/Turtle-Bot/blob/main/Project3/Results_img/step1part1_PD_angle_err.png)  |  ![](https://github.com/Mahdi-Rahmani/Turtle-Bot/blob/main/Project3/Results_img/step1part1_PID_angle_err.png)  |

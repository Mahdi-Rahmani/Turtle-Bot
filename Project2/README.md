# Project Two 
The purpose of this exercise is to review some of the concepts taught in the classroom, as well as learning to work with the robot in gazebo and RViz simulation environments, to move the robot using the keyboard and code, as well as the ability to work with the Lidar sensor. 
Before starting this project, please watch the hands-on videos at links below.
- Hands-on 1: [Gazebo basic](https://drive.google.com/file/d/1rWE0WdvKNgM2sK1XIuUHH5B50wCP3WC8/view?usp=sharing)
- Hands-on 2: [Sensors and movement](https://drive.google.com/file/d/13fCOPm1p-Z-ehmGzzQ1gc_fbumucxQNu/view?usp=sharing)
- Hands-on 3: [Services And Launch File](https://drive.google.com/file/d/1HkHeqMSq6UoxTyULIXZwH4WKSH8GvCjH/view?usp=sharing)

## Theory part 
We should answer to some questions about topics below: 

1- Calculating Degree Of Freedom(DOF) with Grubler formula 
 
2- Determine the C-space of a given robot 
 
3- Differences between holonomic and non-holonomic robots 
 
you can find the answers to these questions at [theory report.](https://github.com/Mahdi-Rahmani/Turtle-Bot/blob/main/Project2/Report/Theory%20part%20report.pdf) 
 
## Simulation part 
### Step1 
In this step, we will get to know the services and move the robot in Gazebo. At the beginning, we need a custom service called GetNextDestination. This service should receive the current position of the robot and return the next destination. Format of this message is something like this:
```
float64 current_x
float64 current_y
---
float64 next_x
float64 next_y
``` 
First We should create a work space for whole project. Then we should download some packages by below command in src folder of work space. These packages provide us this oportunity to work with turtlebot and run it in gazebo and RViz.
```
git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone -b indigo https://github.com/turtlebot/turtlebot_interactions.git
```
Then we create a another package with the name of "get_destination". we do other works related to this step in this package.

After all, you can run this step by going to the work space directory and run commands below. 

NOTE : for each linear speed you should write your desired value in front of linear_speed:=....
```
. devel/setup.bash
export TURTLEBOT3_MODEL=waffle
roslaunch get_destination get_destination.launch linear_speed:=0.2
```
you can see below videos for each linear velocity: 

- linear_velocity = 0.2 :
 
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/Vge8t7cS6bw/0.jpg)](https://www.youtube.com/watch?v=Vge8t7cS6bw) 
 
- linear_velocity = 0.4 : 

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/Plg1lNNvKcA/0.jpg)](https://www.youtube.com/watch?v=Plg1lNNvKcA) 
 
- linear_velocity = 0.8 : 

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/1C8rHII4zZw/0.jpg)](https://www.youtube.com/watch?v=1C8rHII4zZw) 


# Robotics projects 
This repository contains my robotics projects on Turtle-bot and some other materials of this course like slides. This course is offered at AmirKabir University Of Tehran. We use ROS software tool and gazebo simulator for our projects. I try to explain every thing step by step and in details and if you are persian, you can take alook to my reports for each project. 

## Installing process 
We used ROS Noetic version in this course. The recommended ubuntu version for that is 20.04 so if you don't have this version of OS on your PC then you can use virtual machine instead. I use VMware desktop hypervisor and install that ubuntu version as a VM. Hardware that I allocate to my VM is mentioned below: 
- Allocated hard disk space: 40 GB 
- RAM: 8 GB 
- Number of processors: 2 
- Number of cores per processor: 3 

After preparing the operating system environment, we can install ROS. you can visit the [link](http://wiki.ros.org/noetic/Installation/Ubuntu) and proceed according to that but I mentioned the codes that I ran in terminal: 
- Setup your sources.list 

``` 
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' 
``` 

- Set up your keys 

``` 
sudo apt install curl # if you haven't already installed curl 
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
``` 

- Installation 
``` 
sudo apt update 
sudo apt install ros-noetic-desktop-full 
``` 

- Environment setup 
``` 
source /opt/ros/noetic/setup.bash 
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc 
source ~/.bashrc 
``` 

- Dependencies for building packages 
``` 
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential 
```

- Initialize rosdep 
```
sudo rosdep init 
rosdep update 
```
 
Now ROS Noetic is installed on your system. Also I recommend install Visual Studio Code with some additional good extensions. You can install VScode with below command: 
``` 
sudo snap install --classic code 
``` 
Then open VSCode and install below extensions:
- python extension from Microsoft
- ROS extension from Microsoft
- CMake extension from twxs 
 
## Projects 
### Project 1 
The purpose of this exercise is to familiarize yourself with ROS server side programming. In this exercise, we want to learn about server-side programming, creating nodes and topics, as well as publishing/subscribing messages by topic using a simple scenario. 





# SLAM with Ouster lidar and Cartographer


This repository contains package, that integrates Ouster lidar (https://ouster.com/) with Cartographer (https://google-cartographer-ros.readthedocs.io/en/latest/) for realtime and
offline/online SLAM. This repository is mainly to speed up the your process of getting into calibration of Cartographer for Ouster lidar.
## Installation

Requires operating system with __ros melodic__ (Ubuntu 18 with ros-melodic).

Further steps are run in the console:
1. Install cartographer packages or build them directly in your directory.
    * sudo apt install ros-melodic-cartographer-ros
    * sudo apt install ros-melodic-cartographer-ros-msgs
    * sudo apt install ros-melodic-cartographer-rviz
2. Create a workspace directory
    * source /opt/ros/melodic/setup.bash -> your path to ROS
    * mkdir -p oslam_ws/src  
    * cd oslam_ws
    * git clone git@github.com:Miro001/Ouster-cartographer.git src
    * cd src  
    * git submodule update --init --recursive
    * cd ..
    * catkin_make
3. Launch ouster package and cartographer in a package. (check [slam_launch.sh](./slam_launch.sh))
    * source devel/setup.bash -> source current enviroment
    * Here is the magic! You just have to setup three paths
      * BAGPATH = is the path to example bagfile (or your own *.bag)
      * CONFIGPATH = is the  ouster lidar configuration json (provided with example bagfiles *.json, for your own scan it is generated .ros/...)
      * CARTOCONF  = is the path of the configuration files  of the cartographer ... (YOURPATH/oslam_ws/src/ouster_slam/)
    ``` 
    roslaunch ouster_slam os_slam.launch\
                             udp_hostname:=127.0.0.1\
                             replay:=true\
                             bag_filename:=${BAGPATH}\
                             metadata:=${CONFIGPATH}\
                             carto_conf:=${CARTOCONF}
    ```
                            

## Additional info
* The whole thing required just minor tweeking of ouster_example + remap in the launch file, some path configs...
* If you have solid PC, try tune OS1_64

## Contribution
* Any simplification or improvement is more than WELCOME.
* Please submit your updates to os_slam.launch to simplify it
* Any configuration for specific sensor (os1-16, os1-64...) can be added as *.lua to config directory
* Visualization improvements
* The goal is to find optimal solutions (lua configs) for ouster lidar for indoor and outdoor mapping

## Sample Data

* Sample sensor output usable with the provided ROS code is available
  [here](https://data.ouster.io/sample-data-1.13)
  

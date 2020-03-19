# SLAM with Ouster lidar and Cartographer


This repository contains package, that integrates Ouster lidar (https://ouster.com/) with Cartographer (https://google-cartographer-ros.readthedocs.io/en/latest/) for realtime and
offline/online SLAM. This repository is mainly to speed up the your process of getting into calibration of Cartographer for Ouster lidar.
## Installation

Requires operating system with __ros melodic__ (Ubuntu 18 with ros-melodic).

Further steps:
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
3. Launch ouster package and cartographer in a package.
    * source devel/setup.bash -> source current enviroment

    * roslaunch ouster_slam os_slam.launch *\*\
                             udp_hostname:=127.0.0.1 *\*\
                             replay:=true *\*\
                             bag_filename:=${BAGPATH}*\*\
                             metadata:=${CONFIGPATH}*\*\
                             carto_conf:=${CARTOCONF}

## Additional info
* The whole thign required just minor tweeking of ouster_example + remap in the launch file
* If you have solid PC, try tune OS1_64

## Contribution

## Sample Data

* Sample sensor output usable with the provided ROS code is available
  [here](https://data.ouster.io/sample-data-1.13)

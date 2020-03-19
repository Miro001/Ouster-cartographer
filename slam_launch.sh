#!/bin/bash
source ../devel/setup.bash

BAGPATH='/media/miro/DataStore/bags/OS1-16_city1.bag' #own path
CONFIGPATH='/media/miro/DataStore/bags/sample_config_file_16.json' #own path

CARTOCONF='/home/miro/Documents/ros/github_ws/src/ouster_slam/' #own path

roslaunch ouster_slam os_slam.launch \
                             udp_hostname:=127.0.0.1 \
                             replay:=true \
                             bag_filename:=${BAGPATH}\
                             metadata:=${CONFIGPATH}\
                             carto_conf:=${CARTOCONF}
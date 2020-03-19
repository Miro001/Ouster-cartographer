#!/bin/bash
source ../devel/setup.bash

BAGPATH='/media/miro/DataStore/bags/OS1-16_city1.bag'
CONFIGPATH='/media/miro/DataStore/bags/sample_config_file_16.json'

roslaunch ouster_slam os_slam.launch \
                             udp_hostname:=127.0.0.1 \
                             replay:=true \
                             bag_filename:=${BAGPATH}\
                             metadata:=${CONFIGPATH}

rosservice call /finish_trajectory 0
rosservice call /write_state "{filename: '${BAGPATH}.pbstream', include_unfinished_submaps: 'true'}"

roslaunch ouster_slam assets_writer_my_robot.launch \
   bag_filenames:=${BAGPATH} \
   pose_graph_filename:=${BAGPATH}.pbstream

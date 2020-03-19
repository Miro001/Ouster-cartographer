#!/bin/bash
source ../devel/setup.bash

BAGPATH='.../OS1-16_city1.bag' #own path
CONFIGPATH='.../sample_config_file_16.json' #own path

CARTOCONF='.../src/ouster_slam/' #own path

roslaunch ouster_slam os_slam.launch \
                             udp_hostname:=127.0.0.1 \
                             replay:=true \
                             bag_filename:=${BAGPATH}\
                             metadata:=${CONFIGPATH}\
                             carto_conf:=${CARTOCONF}
#!/bin/bash

source /catkin_ws/devel/setup.bash

roscore & \
sleep 5
roslaunch mongodb_store mongodb_store.launch db_path:=/opt/ros/mongodb_store & \
sleep 10
rosrun topological_utils insert_map.py /catkin_ws/map.tmap map map

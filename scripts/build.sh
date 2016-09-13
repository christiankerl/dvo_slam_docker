#!/bin/bash

set -e

source /opt/ros/$ROS_DISTRO/setup.bash

WD=$PWD
WS=$WD/ws/
WS_SRC=$WS/src/

mkdir -p $WS_SRC

cd $WS_SRC
catkin_init_workspace 

cd $WS
catkin_make

source $WS/devel/setup.bash

cd $WS_SRC 
git clone -b jade-devel https://github.com/tum-vision/dvo_slam.git

mkdir $WS_SRC/dvo_slam/dvo_benchmark/output/

cd $WS
apt-get update && rosdep update && rosdep install -y -i dvo_core dvo_ros dvo_slam dvo_benchmark

G2O_ROOT=/opt/ros/$ROS_DISTRO/ catkin_make -DCMAKE_BUILD_TYPE=Release

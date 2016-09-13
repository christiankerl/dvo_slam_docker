#!/bin/bash

set -e

source /opt/ros/$ROS_DISTRO/setup.bash
source /root/ws/devel/setup.bash

exec "$@"

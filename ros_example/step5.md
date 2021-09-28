`roscore`{{execute T1}}#
`source /opt/ros/noetic/setup.bash`{{execute T2}}
`export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:~/src/`{{execute T2}}
`rosrun publisher main.py`{{execute T2}}
`source /opt/ros/noetic/setup.bash`{{execute T3}}
`export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:~/src/`{{execute T3}}
`rosrun subscriber main.py`{{execute T3}}
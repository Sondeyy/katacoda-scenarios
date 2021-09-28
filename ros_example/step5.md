Startup roscore. 
`roscore`{{execute T1}}

Start up a new terminal, source ROS, add our packages to PATH and run the publisher. 
`echo Hello, world!`{{execute T2}}
`source /opt/ros/noetic/setup.bash`{{execute T2}}
`export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:~/src/`{{execute T2}}
`rosrun publisher main.py`{{execute T2}}

Start up a new terminal, source ROS, add our packages to PATH and run the subscriber. 
`echo Hello, world!`{{execute T3}}
`source /opt/ros/noetic/setup.bash`{{execute T3}}
`export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:~/src/`{{execute T3}}
`rosrun subscriber main.py`{{execute T3}}
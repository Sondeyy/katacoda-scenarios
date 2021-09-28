Startup roscore, the backend server of ROS.
`roscore`{{execute T1}}

Start up a new terminal, source ROS, add our packages to PATH. 
`echo Hello, world!`{{execute T2}}
`source /opt/ros/noetic/setup.bash`{{execute T2}}
`export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:~/src/`{{execute T2}}

Run the publisher. It logs all messages it sends to the terminal. 
`rosrun publisher main.py`{{execute T2}}

Start up a new terminal, source ROS, add our packages to PATH.
`echo Hello, world!`{{execute T3}}
`source /opt/ros/noetic/setup.bash`{{execute T3}}
`export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:~/src/`{{execute T3}}

Run the subscriber. It logs all messages it receives to the terminal. 
`rosrun subscriber main.py`{{execute T3}}

Now you can see, how all sent messages are received from the subscriber. The number after `[INFO]` is the timestamp.  
`sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'`{{execute}}
`curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -`{{execute}}
`sudo apt update`{{execute}}
`sudo apt install ros-noetic-ros-base`{{execute}}
`source /opt/ros/noetic/setup.bash`{{execute}}
`sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential`{{execute}}
`sudo rosdep init`{{execute}}
`rosdep update`{{execute}}
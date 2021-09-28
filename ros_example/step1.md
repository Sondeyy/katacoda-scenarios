Set up Ubuntu to accept packages from packages.ros.org.
`sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'`{{execute}}

Add keys for apt. 
`curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -`{{execute}}

Update Package index. 
`sudo apt update`{{execute}}

Install ROS-Base. Enter 'y', when asked for it. 
`sudo apt install ros-noetic-ros-base`{{execute}}

Source ROS to make commands known to the active terminal.
`source /opt/ros/noetic/setup.bash`{{execute}}

Install Dependencies for building packages with python. Enter 'y', when asked for it.
`sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential`{{execute}}

Initialize and update rosdep.
`sudo rosdep init`{{execute}}
`rosdep update`{{execute}}

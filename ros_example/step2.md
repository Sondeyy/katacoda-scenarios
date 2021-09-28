Create src folder and switch into it. 
`mkdir ~/src`{{execute}} 
`cd ~/src`{{execute}} 

Create one publisher and one subscriber package. Both depend on *std_msgs* and *rospy*, since they will be written in Python and use the *String* standard message type to communicate with each other. 
`roscreate-pkg publisher std_msgs rospy`{{execute}} 
`roscreate-pkg subscriber std_msgs rospy`{{execute}} 

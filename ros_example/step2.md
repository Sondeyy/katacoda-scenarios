Create src folder.
`mkdir ~/src`{{execute}}

Switch into it. 
`cd ~/src`{{execute}} 

Create one publisher and one subscriber package. Both depend on *std_msgs* and *rospy*, since they will be written in Python and use the *String* standard message type to communicate with each other. First the publisher.
`roscreate-pkg publisher std_msgs rospy`{{execute}}

Now the subscriber.
`roscreate-pkg subscriber std_msgs rospy`{{execute}} 

The following image shows the concept of publishers, subscribers and topics.

![ROS message system](./assets/ros_msg_system.jpg)

It does not matter how many nodes publish or subscribe to a topic. The topic exists even if there are no subscribers. As described above, a topic always depends on a specific message type. We will use *String* for our example, other examples from the *std_msgs* package are *Time* or *Bool*. It is also possible to create your own message types depending on your application.

The general principle is comparable to MQTT or Kafka. The main difference between MQTT and ROS is that MQTT is used to communicate between multiple devices and ROS is used to communicate between multiple parts of one device. Moreover, ROS provides additional functionality, which could either be an unnecessary overhead or a helpful tool.

![MQQT message system](./assets/mqqt_structure.png)

Let's continue to creating a simple publisher!

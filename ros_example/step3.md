Create the main python script and open it in the editor. \
`touch publisher/src/main.py`{{execute}} 
`src/publisher/src/main.py`{{open}} 

Copy the following content to main.py: 
<pre class="file" data-target="clipboard">
#!/usr/bin/env python3
import rospy
from std_msgs.msg import String

def publisher():
    pub = rospy.Publisher('hello', String, queue_size=10)
    rospy.init_node('publisher', anonymous=True)
    rate = rospy.Rate(5)
    i = 0
    while not rospy.is_shutdown():
        hello_str = f"hello world {i}"
        i += 1
        rospy.loginfo(f"I sent: {hello_str}")
        pub.publish(hello_str)
        rate.sleep()

if __name__ == '__main__':
    try:
        publisher()
    except rospy.ROSInterruptException:
        pass
</pre>

This script creates an Publisher object, which will pubslish to the topic called *hello*. 
It initializes the node with the name *publisher*. The parameter *anonymous* appends a random number to the name to make it unique. Node names always have to be unique, but if you don't care, where the message came from, you may use an anonymous, unique name. 
The message type will be *String* from the standard messages. The message will also be logged to the terminal. It simply consists of "hello world" and an integer, which increses each cycle. 
It will then publish messages with 5Hz, unti it gets shutdown.

By defining the parameter *queue_size*, we make the communication asynchronous. If we publish faster, than the messages can be send and there are more than 10 messages waiting, it will drop old messages. 

Finally, make the script executable.
`chmod 777 publisher/src/main.py`{{execute}}

Let's move on to the subscriber!

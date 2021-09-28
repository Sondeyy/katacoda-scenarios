Create the main python script and open it in the editor. \
`touch publisher/src/main.py`{{execute}} 
`src/publisher/src/main.py`{{open}} 

Copy the following content to main.py: 
<pre class="file" data-target="clipboard">
#!/usr/bin/env python3
import rospy
from std_msgs.msg import String

def talker():
    pub = rospy.Publisher('hello', String, queue_size=10)
    rospy.init_node('talker', anonymous=True)
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
        talker()
    except rospy.ROSInterruptException:
        pass
</pre>
This script creates an Publisher object, which will pubslish to the topic called *hello*. The message type will be *String* from the standard messages.
It will then publish messages with 5Hz.

Make the script executable.
`chmod 777 publisher/src/main.py`{{execute}}

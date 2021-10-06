Create the main python script and open it in the editor. \
`touch subscriber/src/main.py`{{execute}} 
`src/subscriber/src/main.py`{{open}} 

Copy the following content to main.py: 
<pre class="file" data-target="clipboard">
#!/usr/bin/env python3
import rospy
from std_msgs.msg import String

def callback(data):
    rospy.loginfo(f"I heard: {data.data}")
    
def subscriber():

    rospy.init_node('subscriber', anonymous=True)

    rospy.Subscriber("hello", String, callback)

    rospy.spin()

if __name__ == '__main__':
    subscriber()
</pre>

This script creates a Subscriber object, which subscribes to the *hello* topic with *String* message type. 
It is also anonymous. 

Everytime a message is received, it will call *callback* and pass data to it. The *callback* function just logs the incoming data to the terminal. 

The *spin* method just continues the listening process, until somebody shuts it down. 

Make the script executable.
`chmod 777 subscriber/src/main.py`{{execute}}

Now let's test our nodes!

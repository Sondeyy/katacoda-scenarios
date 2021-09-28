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
    
def listener():

    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber("chatter", String, callback)

    rospy.spin()

if __name__ == '__main__':
    listener()
</pre>

Make the script executable.
`chmod 777 subscriber/src/main.py`{{execute}}

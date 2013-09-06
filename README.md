aV

The indicator gui seems like it will solve most of the problems with
running  ROS as user 'ros'.
However, users connecting via ssh will need a command line tool to
achieve similar results.
For this we are looking at building on the work done for the PR2s
'robot' command line tool.

'robot claim'
This command allows the user to gain control of the robot.
Functionally, it warns the user if another user has control of the robot
and it sends an
email if the user steals control of the robot.

Do users need to claim the robot to use it?
Should multiple users be able to claim the robot at the same time?
Should we overlord the claim command to support specifying the user
upstart should start ROS as?
Should it warn/offer to restart ROS as the claimed user if it is running
as another user?

So one option would be for ROS to be started by the user that claimed
the robot and return startup
to the 'ros' user after release but another approach would be to make
robot claims non-exclusive
or leave that open as an option for the future.

'robot autostart'
If this is the case perhaps a new command 'robot autostart' could
provide an interface.
Examples
----
robot autostart enable        Enable Upstart script used to start ROS as
system user, implies --system
robot autostart disable       Disable Upstart script used to start ROS
as system user, implies --system
robot autostart --user turtlebot enable    Enable Upstart script used to
start ROS as user 'turtlebot'
robot autostart --system enable    Enable Upstart script used to start
ROS as system user

Alternate names could include 'robot bootup'

'robot release'
Releases control of the robot
Do users want to be notified when the robot becomes available?
Should this be logged somewhere similar to wtmp used for the linux
command `last`?
Are usage logs a useful feature?

'robot watch'
Watch the robot and notify (via email?) when the robot becomes available.
Should this be able to notify when the robot is claimed and released?

'robot start'
Initially this will run 'sudo initctl start ros'
In the future we should probably look at moving towards using polkit
instead of sudo

'robot stop'
Like start, this is an alias for 'sudo initctl stop ros'

'robot users'
Shows user associated with the robot. Specifically it will show the user
who has claimed that robot,
users logged into the robot, users watching the robot (may not be logged
in), and users with active
background processes.

'robot plist'
I am unsure exactly what this command does or should do.
Is it an alias for 'ps -ef' or 'rosnode list'? What is the use case?

'robot status;
Display information about the state of the robot, include which user ROS
is running as.


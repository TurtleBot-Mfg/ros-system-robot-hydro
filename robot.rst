=========
 robot
=========

------------------------------------------
management tool for control of robot state
------------------------------------------

:Author: code@iheartengineering.com
:Date:   2013-02-09
:Copyright: BSD
:Version: 0.1
:Manual section: 1
:Manual group: Robotics Commands

.. TODO: authors and author with name <email>

SYNOPSIS
========

robot `command` [ `options` `...` ]

DESCRIPTION
===========

The 'robot' tool helps manage robot operations such as startup and shutdown.

COMMAND OVERVIEW
================

robot claim [ `options` `...` ]
  Take control of the robot.

robot release [ `options` `...` ]
  Release control of the robot. 

robot autostart [ enable | disable ] [ `options` `...` ]
  This command will enable/disable the upstart scripts for the robot.

robot watch [ `options` `...` ]
  Request notification when the robot is claimed or released.

robot start [ `options` `...` ]
  Start the robot. This is equivalent to initctl start ros.

robot stop [ `options` `...` ]
  Stop the robot, an alias for 'sudo initctl stop ros'.

robot users
  List the users of the robot.

robot plist
  Provide a list of robot processes.

robot id
  Identify the robot

robot tips
  Provides useful tips for running your robot.

COMMAND REFERENCE
=================
robot claim [ `options` `...` ]
-------------------------------
Options:

 -h, --help                     Display command usage information.
 -m <message>, --message=<message>  The message to display to other users to notify them of what you are doing with the robot.
 -m MESSAGE, --message=MESSAGE  The message to display to other users to notify
                                them of what you are doing with the robot.
 --email=EMAIL                  Email address for notifications.
 -u USER, --username=USER       Use a different username when claiming the robot.
 -f, --force                    Don't warn if you are claiming from another user.

The claim command allows you to take control of the robot. The username and environment can be manually set or the robot can be configured to start as the ROS system user with the default environment.  If autostart is enabled and the robot has been claimed, the robot will start ROS as the user that claimed the robot.

robot release [ `options` `...` ]
---------------------------------
Options:

 -h, --help                     Display command usage information.

Releasing the robot will implicitly stop ROS and if autostart is enabled it will cause the robot to start as the ROS system user.


OPTIONS
=======

--config=<file>         Read configuration settings from <file>, if it exists.
--version, -V           Show this program's version number and exit.
--help, -h              Show this help message and exit.

And a lot more standard docutils options.

PROBLEMS
========

1. linux man page howto advises to use the man macro package,
   UCB uses the newer doc macros.

SEE ALSO
========

* `docutils <http://docutils.sourceforge.net>`__
* `linux man page howto <http://tldp.org/HOWTO/Man-Page/>`__
* ``man man`` and ``man 7 man``

BUGS
====

* Format options are included as they are required, only the simplest
  options are supported, and no complex things should be used in man pages.
* tables:

  - no header allowed
  - always have a border
  - cell alignment is always top/left.

* images are not supported.

Discussion is still open.

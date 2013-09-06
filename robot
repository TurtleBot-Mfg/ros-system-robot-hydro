#!/usr/bin/python
# Software License Agreement (BSD License)
#
# Copyright (c) 2013, I Heart Engineering
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the following
#    disclaimer in the documentation and/or other materials provided
#    with the distribution.
#  * Neither the name of I Heart Engineering nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# -*- coding: utf-8 -*-
"""
management tool for control of robot state

The 'robot' tool helps manage robot operations such as startup and shutdown.
"""

import os
import sys
import subprocess
import re
import yaml
import argparse

def cmd_claim(argv):
    """claim the robot"""
    argv = argv[2:]
    parser = argparse.ArgumentParser(prog='robot claim',epilog='Robot Management Tool')
    parser.add_argument('-v', '--verbose', help='Provide detailed information', action='store_true')
    args = parser.parse_args(argv)
    global verbose_mode
    verbose_mode = args.verbose

    print "Attempting to claim robot"

def cmd_love(argv):
    """What time is love?"""
    p = subprocess.Popen(['fortune', 'love'], stdout=subprocess.PIPE)
    (out, err) = p.communicate()
    print """
          |  \ \ | |/ /
          |  |\ `' ' /
          |  ;'      \      / ,
          | ;    _,   |    / / ,
          | |   (  `-.;_,-' '-' ,
          | `,   `-._       _,-'_
          |,-`.    `.)    ,<_,-'_,
         ,'    `.   /   ,'  `;-' _,
        ;        `./   /`,    \-'
        |         /   |  ;\   |\\
        |        ;_,._|_,  `, ' \\
        |        \    \ `       `,
        `      __ `    \         ;,
         \   ,'  `      \,       ;;
          \_(            ;,      ;;
          |  \           `;,     ;;
          |  |`.          `;;,   ;'
          |  |  `-.        ;;;;,;' FL
          |  |    |`-.._  ,;;;;;'
          |  |    |   | ``';;;'
"""
    print out
    sys.exit(os.EX_OK)

def cmd_usage():
    """Usage"""
    print """\
Robot Management Tool
------------------------------------------------------------
Usage: robot <command> [options] [args]

Common Commands:
\trobot claim\t\tClaim robot
\trobot release\t\tRelease robot

Use 'robot <command> -h' for more information about a command."""
    sys.exit(os.EX_USAGE)

if __name__ == '__main__':
    global script_dir
    script_dir = os.path.abspath(os.path.dirname(sys.argv[0]))

    if len(sys.argv) == 1:
        cmd_usage()

    else:
        if (sys.argv[1] == '--version' or sys.argv[1] == 'version'):
            version = "0.0.1"
            print "Robot management command version %s"%version
            sys.exit(os.EX_OK)
        if (sys.argv[1] == 'claim'):
            cmd_claim(sys.argv)
        elif (sys.argv[1] == 'release'):
            cmd_release(sys.argv)
        elif (sys.argv[1] == 'love'):
            cmd_love(sys.argv)
        else:
            cmd_usage()

__version__ = '0.0.1'
"""
:Authors:
    - Me
    - Myself
    - I
"""

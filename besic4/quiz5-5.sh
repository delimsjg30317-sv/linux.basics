#!/bin/bash
gpasswd -a testuser4 mygroup
grep "mygroup" /etc/group

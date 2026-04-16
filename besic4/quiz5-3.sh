#!/bin/bash
userdel testuser2
grep "testuser2" /etc/passwd || echo "User testuser2 not found"

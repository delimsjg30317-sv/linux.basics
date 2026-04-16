#!/bin/bash
groupdel mygroup2
grep "mygroup2" /etc/group || echo "Group mygroup2 successfully deleted."

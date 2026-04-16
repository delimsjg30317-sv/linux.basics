#!/bin/bash
groupmod --new-name newgroup oldgroup
grep "newgroup" /etc/group

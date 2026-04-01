#!/bin/sh
touch multiLine.txt
echo "Line 1\n Line2\n Line 3\n Line4\n Line 5\n Line6" > multiLine.txt
head -3 multiLine.txt

#!/bin/sh

file_count=0
folder_count=0
for item in *
do
		if [ -f "$item" ]
		then
			file_count=$((file_count+1))
		fi
		if [ -d "$item" ]
		then
			folder_count=$((folder_count+1))
		fi
done

echo "파일 수: $file_count"
echo "디렉토리 수: $folder_count"

exit 0

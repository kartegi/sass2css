#!/bin/bash

read -p "Enter path to sass file: " SASS_PATH
read -p "Enter path to store css file: " CSS_STORE

if [ -f ${SASS_PATH/#~/$HOME} ]; then
	while inotifywait -e modify ${SASS_PATH/#~/$HOME}; do 
		sass ${SASS_PATH/#~/$HOME} ${CSS_STORE/#~/$HOME};
	done
else
	echo "Incorrect path"
fi

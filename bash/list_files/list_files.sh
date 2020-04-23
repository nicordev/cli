#!/bin/bash

# Show files in the current folder and its subfolders beginning with 'Dockerfile_'

for filePath in */Dockerfile_*; do
	echo $filePath
done
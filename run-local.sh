#!/bin/sh

docker rm -f svn-for-students
docker run -d -p 3690:3690 --name svn-for-students ashushunov/svn-for-testers
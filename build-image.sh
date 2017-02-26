#!/bin/sh

# build image
docker build -t ashushunov/svn-for-testers .

# publish image
docker push ashushunov/svn-for-testers
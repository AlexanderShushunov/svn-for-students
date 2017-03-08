#!/usr/bin/env bash

docker rm -f svn-for-students
docker run -d -p 3690:3690 --name svn-for-students ashushunov/svn-for-testers

echo "=========admin=============="
echo "co | root folder"
svn co svn://localhost  ./wc-admin --username admin --password admin
cd wc-admin

echo "log | root folder"
svn log

cd Name1_Surname1
echo "log | Name1_Surname1 folder"
svn log

echo "add + commit | Name1_Surname1 folder"
echo "bla-bla" > file.txt
svn add file.txt
svn commit -m "add file.txt"
svn update
svn log

cd ../task
echo "log | task folder"
svn log

cd ../..
rm -rf wc-admin

echo "=========Name1_Surname1=============="
echo "co | Name1_Surname1 folder"
svn co svn://localhost/Name1_Surname1  ./wc-Name1_Surname1 --username Name1_Surname1 --password Name1_Surname1
cd wc-Name1_Surname1

echo "log | Name1_Surname1 folder"
svn log

echo "add + commit | Name1_Surname1 folder"
echo "bla-bla" > other-file.txt
svn add other-file.txt
svn commit -m "add other-file.txt"
svn update
svn log

cd ../
rm -rf wc-Name1_Surname1

echo "co | task folder"
svn co svn://localhost/task  ./wc-task --username Name1_Surname1 --password Name1_Surname1
cd wc-task
echo "log | task folder"
svn log

cd ../
rm -rf wc-task

echo "=========Name3_Surname3=============="
echo "co | Name1_Surname1 folder"
svn co svn://localhost/Name1_Surname1  ./wc-Name1_Surname1 --username Name3_Surname3 --password Name3_Surname3


docker rm -f svn-for-students
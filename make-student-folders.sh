#!/bin/ash

cd /var/svn
mkdir wc
cd wc
svn co file:///var/svn/repo  ./ --username admin --password admin

while read line
do
   mkdir $line
   svn add $line
done < /var/svn/student-list

svn commit -m "Create folder for each student"

mkdir task
cp /var/svn/student-list ./task/student-list.txt
cp /var/svn/task.txt ./task/task.txt
svn add task

svn commit -m "Add folder with task"./ru
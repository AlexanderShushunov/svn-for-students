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

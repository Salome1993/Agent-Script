#!/bin/bash
#Description: Bulding docker images
#Author: hope6950@gmail.com

echo "what would you like your workspace to be called? please enter your folder name"
read folder

echo "what is your base image? please choose between: 
centos
ubuntu
debian
alpine"
read b_image

echo "what version do you want?"
read tag

echo "what is your user name?"
read uname

echo "what commands do you want to run?"
read command1
read command2
read command3

echo "what port do you want to open"
read port

echo "what file do you want to copy?"
read file

echo "what path are you coping your file into?"
read path

echo "are you willing to run a command in your container?"
read cmd 

mkdir $folder && cd $folder && touch Dockerfile 

echo "FROM $b_image:$tag" > Dockerfile 
echo "MAINTAINER $uname" >> Dockerfile
echo "EXPOSE $port" >> Dockerfile
echo "COPY ./$file $path" >> Dockerfile 
echo "CMD $cmd" >> Dockerfile 
if [ -n $command1 ]
then
echo "RUN $command1" >> Dockerfile 
fi 

if [ -n $command2 ]
then
echo "RUN $command2" >> Dockerfile 
fi 

if [ -n $command3 ]
then
echo "RUN $command3" >> Dockerfile 
fi 

docker build -t $uname-$b_image .
docker images
if [ $? -eq 0 ]
then
echo "the image is created successfully"
rm -f Dockerfile 
echo $?
cd -
rm -rf $folder 
echo $?
exit 1
fi

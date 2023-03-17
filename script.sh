#!/bin/bash

if [ $1 ]
then
	echo "params 1: $1"
fi
echo "Please enter your secret code:"
read -s pass;
sleep 0.3;
echo "$pass"
echo "params 2: $2"

#!/bin/bash

cppProjectDir=~/"codingHub/cpp/projects"

read -p "Enter the project Folder Name: " folderName

mkdir -p "$cppProjectDir/$folderName"

cd $cppProjectDir/$folderName || exit

mkdir src assets docs vendor misc
mkdir ./assets/images ./assets/fonts ./assets/soundTracks ./assets/misc

cd ./src || exit

touch main.cpp app.cpp

mkdir hashingAlgo blockchainAlgo uiLayer utils

echo "Folder Structure Created Successfully."
cd $cppProjectDir/$folderName

echo "Current Directory: " 

pwd

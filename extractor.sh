#!/bin/bash

cd ~/Downloads
lastDownloaded=$(ls -t | head -n 1)
echo "Last file downloaded: $lastDownloaded"
echo -n "Do you want to install it? type [y] or [n]: "
read verify

# Error handling section

if [[ -z $verify ]]; then
   echo "Error: Input field can not be blank."
   exit 1
fi

# Continues if the user types "y"
if [[ $verify == y ]]; then 
case $lastDownloaded in
	
   *.deb)
   echo "Extracting .deb package..."
   sudo dpkg -i $lastDownloaded
   ;;

   *.tar.xz)
   echo "Extracting .tar.xz..."
   tar -xf $lastDownloaded
   ;;

   *.tar.gz)
   echo "Extracting .tar.gz package..."
   tar -xzf $lastDownloaded
   ;;

   *.zip)
   echo "Extracting .zip package..."
   unzip $lastDownloaded
   ;;

   *.rpm)
   echo "Extracting .rpm package..."
   rpm -i $lastDownloaded
   ;;

   *)
   echo "Error: File type not supported or not found."
   echo "Supported: .deb, .zip, .tar.xz, .tar.gz, .rpm"
   exit 1
   ;;

esac
else
   echo "Exit sucessfully."
fi

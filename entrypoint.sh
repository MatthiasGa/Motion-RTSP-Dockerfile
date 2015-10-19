#!bin/bash

# if config (share folder) empty, copy config back to 
if [ ! "$(ls -A /usr/local/etc/motion)" ]; then
  # Empty
  cp -R /init/motion/* /usr/local/etc/motion
fi

# if no param, start motion
if [ ! $1 ]; then
  echo "Starting motion ..."
  motion
fi
if [ $1 ];then
  $1
fi

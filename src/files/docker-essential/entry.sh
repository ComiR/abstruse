#!/bin/bash

VNC_STORE_PWD_FILE=~/.vnc/passwd
if [ ! -e "${VNC_STORE_PWD_FILE}" -o -n "${VNC_PASSWORD}" ]; then
  mkdir -vp ~/.vnc
  x11vnc -storepasswd ${VNC_PASSWORD:-abstruse} ${VNC_STORE_PWD_FILE}
fi

export CHROME=${CHROME:-/opt/google/chrome/google-chrome}
export DISPLAY=:99

{
  sudo /etc/init.d/xvfb start && sleep 3
  sudo /etc/init.d/fluxbox start
  sudo /etc/init.d/x11vnc start
  sudo /etc/init.d/ssh start
} &> /dev/null

/bin/bash


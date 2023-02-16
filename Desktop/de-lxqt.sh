#!/bin/bash

#Get the necessary components
apt-get update
apt-mark hold udisks2
apt-get install lxqt qterminal -y
apt-get install tigervnc-standalone-server dbus-x11 -y
apt-get --fix-broken install
apt-get clean

#Setup the necessary files
mkdir -p ~/.vnc
echo "#!/bin/bash
export PULSE_SERVER=127.0.0.1
xrdb $HOME/.Xresources
startlxqt" > ~/.vnc/xstartup
echo "vncserver -geometry 1600x900 -name remote-desktop :1" > /usr/local/bin/vnc-start
echo "vncserver -kill :1" > /usr/local/bin/vnc-stop
clear
chmod +x ~/.vnc/xstartup
chmod +x /usr/local/bin/vnc-start
chmod +x /usr/local/bin/vnc-stop

echo " "
echo "Installing browser,.."
echo " "
apt install firefox-esr -y
clear
echo " "
echo "Vnc Server address will run at 127.0.0.1:5901"
echo " "
echo "Start Vnc Server, run vnc-start"
echo " "
echo "Stop Vnc Server, run vnc-stop"
echo " "

rm de-lxqt.sh

vnc-start

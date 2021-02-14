Assumptions That you - Have a Raspberry Pi and you can install on it the latest Jessie image.
( Hint, see https://www.raspberrypi.org/documentation/installation/installing-images/) - 
Know how to navigate Linux on your Raspberry pi to make file permission changes. - 
Have various Tasmota based lights or switches with lights, and that you know how to flash the devices with Tasmota firmware. 
(Hint,see https://github.com/tasmota/tasmotizer)

Architecture
1.1. Raspberry Pi Apache with cgi-bin installed to permit bash shell scripts to be executed from a web page.

1.2. Tasmota Devices A range of Tasmota devices with different operating systems including Sonoff switches running Sonoff-Tasmota 6.7.1 
by Theo Arends Witty Cloud running Tasmota 8.5.1 by Theo Arends

1.3. Software HTML pages served from Apache Bash Script environment- This is included within the Raspian jessie image BootStrap CDN - 
no installation required Javascript CDN - no installation required

Installation
2.1. Install Apache2 and cgi on the Raspberry Pi. Installation of Apache2 is well documented for Raspberry Pi so I won't cover it here. 
After setting up Apache2 and, install cgi is to execute as follows: cd /etc/apache2/mods-enabled sudo ln -sT ../mods-available/cgi.load cgi.load 
(Note that the root directory for cgi-bin is /usr/lib/cgi-bin and scripts must be owned and executable by the apache2 daemon owner , usually www-data.

2.2. Install bash scripts and html files

The first step is to install jq which parses json data from the Tasmota devices sudo apt-get install jq

Next, create a directory - e.g. light under /usr/lib/cgi-bin. CD to this directory and clone this repository using git (sudo apt-get install git-core ,if not already installed) 
sudo git clone https://github.com/scanos/Xmas-Lights-Control-Centre.git Next, move the files WITHIN THE SUB DIRECTORY Xmas-Lights-Control-Centre/lights_single_Witty/
to your new directory - Set the permissions as shown below:

pi@pi92c5:/usr/lib/cgi-bin/light
-rwxr-xr-x 1 www-data www-data 2547 Feb 14 14:40 lights.html
-rwxr-xr-x 1 www-data www-data 1830 Feb 14 13:59 lights.sh
-rwxr-xr-x 1 www-data www-data  167 Feb 14 11:13 lights1.html
-rwxr-xr-x 1 www-data www-data   66 Feb 14 13:54 lights_array
-rwxr-xr-x 1 www-data www-data 1063 Feb 14 13:42 lights_change.sh
-rwxr-xr-x 1 www-data www-data  966 Feb 13 12:30 lights_toggle.sh

Find the ip addresses and description of your Tasmota devices (You can find this from your router page) and replace the following line 
in lights_array with your specific details. Use nano to edit the file......sudo nano lights_array. 
Note the format is - description1 ipaddress1 POWERNUM with a space between each entry, 
also avoid spaces in the descriptor fields e.g.bell_tower 192.168.1.239 POWER5 small_tower 192.168.1.239 POWER6

2.3. Configure the Witty Cloud
![Configuring Witty](witty_config.png)




After this, you should be able to access the application from a web browser. For example, the host name of my Raspberry Pi is http://pi92c5/cgi-bin/lights/lights.sh 
You should replace pi92c5 with the host name or IP address of your Raspberry Pi.

# Xmas-Lights-Control-Centre
This is a system which controls Tasmota based smart lights, sonoffs, Witty Cloud etc through a single web page. The app sits on a Raspberry Pi on the same LAN as all the sensors which it controls. The app reads the status of the tasmota devices and permits them to be switched on and off from a web page.
1. Architecture
1.1. Raspberry Pi
  Apache with cgi-bin installed to permit bash shell scripts to be executed from a web page.
1.2. Tasmota Devices
  A range of Tasmota devices were used with different operating systems including 
  Sonoff switches running Sonoff-Tasmota 6.7.1 by Theo Arends
  Witty Cloud running Tasmota 8.5.1 by Theo Arends
 1.3. Software
   Bash Script - This is included within the Raspian jessie image.
   BootStrap CDN - no installation required
   Javascript CDN - no installation required
 2. Installation
 
 2.1. Install Apache2 and cgi on the Raspberry Pi. 
 Installation of Apache2 is well documented for Raspberry Pi so I won't cover it here. After setting up Apache2 and, all that is required to install cgi is to execute the   following two statements:
  cd /etc/apache2/mods-enabled 
  sudo ln -sT ../mods-available/cgi.load cgi.load
  (Note that the root directory for cgi-bin is /usr/lib/cgi-bin and scripts must be owned and executable by the apache2 daemon owner , usually www-data.

  2.2. Install scripts and html files in /usr/lib/cgi-bin
 -rwxr-xr-x 1 www-data www-data  1248 Dec  8 14:58 xmas_lights.html
-rwxr-xr-x 1 www-data www-data  2905 Dec  8 15:15 xmas_lights.sh
-rwxr-xr-x 1 www-data www-data   147 Dec  8 14:54 xmas_lights1.html
-rwxr-xr-x 1 www-data www-data   819 Dec  8 14:48 xmas_lights_change.sh

Find the ip addresses and description of your Tasmota devices (You can find this from 
  lights_array=(kitchen_ceiling_lights 192.168.1.237 bedroom_lights 192.168.1.241 hall_lights 192.168.1.242 hall_ceiling_lights 192.168.1.65 kitchen_lights 192.168.1.233)






# Xmas-Lights-Control-Centre

Christmas lights can be set up on a Tasmota based device and controlled indivually from a web page on a per device based. This is done using a menu based system to set timers or console based rules. However, when you get to say five or more devices then it becomes difficult to manage which is what inspired me to write a system with a single web page to control all devices as a single entity. I know that use Google Home would simplify this but I have done this before using GBridge.IO and OpenHab but it was quite complex. This will be reviewed in the next release.

This is a system which controls Tasmota based smart lights, sonoffs, Witty Cloud etc through a single web page. The app sits on a Raspberry Pi on the same LAN as all the sensors which it controls. The app reads the status of all the tasmota devices and permits them to be switched on and off, as a group or individually, from a web page.

This is a very low cost simple installation which requires a minimal equipment set, basically a Raspberry Pi and sonoff devices. No external gateways, sensor or add ons are required.  For example, the Sonoff switches were less than 6 pounds, the Witty Cloud devices circa 3 pounds each and the Raspberry Pi less than 20 pounds.

Assumptions
That you 
        - Have a Raspberry Pi and you can install on it the latest Jessie image.( Hint, see https://www.raspberrypi.org/documentation/installation/installing-images/)
        - Know how to navigate Linux on your Raspberry pi to make file permission changes.
        - Have various Tasmota based lights or switches with lights, and that you know how to flash the devices with Tasmota firmware. (Hint,see https://github.com/tasmota/tasmotizer)   

1. Architecture

1.1. Raspberry Pi
  Apache with cgi-bin installed to permit bash shell scripts to be executed from a web page.

1.2. Tasmota Devices
  A range of Tasmota devices with different operating systems including 
  Sonoff switches running Sonoff-Tasmota 6.7.1 by Theo Arends
  Witty Cloud running Tasmota 8.5.1 by Theo Arends
 
 1.3. Software
   HTML pages served from Apache
   Bash Script environment- This is included within the Raspian jessie image
   BootStrap CDN - no installation required
   Javascript CDN - no installation required
 
 2. Installation
 
 2.1. Install Apache2 and cgi on the Raspberry Pi. 
 Installation of Apache2 is well documented for Raspberry Pi so I won't cover it here. After setting up Apache2 and, install cgi is to execute as follows:
  cd /etc/apache2/mods-enabled 
  sudo ln -sT ../mods-available/cgi.load cgi.load
  (Note that the root directory for cgi-bin is /usr/lib/cgi-bin and scripts must be owned and executable by the apache2 daemon owner , usually www-data.

  2.2. Install bash scripts and html files
  
  The first step is to install jq which parses json data from the Tasmota devices
  sudo apt-get install jq

  Next, clone this repository using git (sudo apt-get install git-core ,if not already installed) 
  sudo git clone https://github.com/scanos/Xmas-Lights-Control-Centre.git
  Next, move the files to /usr/lib/cgi-bin. Set the permissions as shown below:
  
pi@pi92c5:/usr/lib/cgi-bin $ ls -l xm*
-rwxr-xr-x 1 www-data www-data 1248 Dec  8 14:58 xmas_lights.html
-rwxr-xr-x 1 www-data www-data 2162 Dec  9 11:29 xmas_lights.sh
-rwxr-xr-x 1 www-data www-data  147 Dec  8 14:54 xmas_lights1.html
-rwxr-xr-x 1 www-data www-data  154 Dec  9 11:23 xmas_lights_array
-rwxr-xr-x 1 www-data www-data  703 Dec  8 21:19 xmas_lights_change.sh
-rwxr-xr-x 1 www-data www-data 1137 Dec  9 11:26 xmas_lights_toggle.sh

Find the ip addresses and description of your Tasmota devices (You can find this from your router page) and replace the following line in xmas_lights_array with your specific details. Use nano to edit the file......sudo nano xmas_lights_array. Note the format  is - description1 ipaddress1 description2 ipaddress2 .....etc i.e. a space between each entry, also avoid spaces in the descriptor fields
 kitchen_ceiling_lights 192.168.1.237 bedroom_lights 192.168.1.241 hall_lights 192.168.1.242 hall_ceiling_lights 192.168.1.65 kitchen_lights 192.168.1.233
After this, you should be able to access the application from a web browser. For example, the host name of my Raspberry Pi is http://pi92c5/cgi-bin/xmas_lights.sh
You should replace pi92c5 with the host name or IP address of your Raspberry Pi.





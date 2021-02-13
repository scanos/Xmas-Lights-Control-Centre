#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><head><title>Xmas Lights</title>"
echo "<meta http-equiv='refresh' content=\"3; URL='lights.sh'\" />"
echo "</head>"
echo "<body>"

toggle=${QUERY_STRING#*toggle=}
toggle=${toggle%%&*}
toggle=${toggle//+/ }
canel=${QUERY_STRING#*canel=}
canel=${canel%%&*}
canel=${canel//+/ }




#IFS=' ' read -r -a array <<< "$canel"
#canel=${array[0]}
#canel=POWER4 POWER4

echo "<p> Please Wait...................||${toggle}||$canel||"





curl -s http://${toggle}/cm?cmnd=${canel}%20toggle > /dev/null

#http://pi92c5/cgi-bin/lights_change.sh?toggle=192.168.1.239canel=POWER4

#function function1(ipaddress,description,state) {
#  alert("You are going to switch " + state + " the " + description);
#location.replace("lights_change.sh?toggle=" + ipaddress + "&canel=" + channel);

##curl -X GET --proto-default http "http://192.168.1.239"/cm?cmnd=Power5%20Off


#           test_status=$(curl -X GET --proto-default http "http://${toggle}/cm?cmnd=status%209"| jq '.Status.Power')
#           if [ $test_status -gt 0 ]
#                then
                
#			 curl -s http://${toggle}/cm?cmnd=Power%20Off > /dev/null
#
#                else 
# 			 curl -s http://${toggle}/cm?cmnd=Power%20On > /dev/null
#
#           fi
#           }


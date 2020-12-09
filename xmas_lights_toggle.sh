#!/bin/bash

echo "Content-type: text/html"
echo ""
echo "<html><head><title>Xmas Lights</title>"
echo "</head>"
echo "<body>"

echo "<meta http-equiv='refresh' content=\"0; URL='xmas_lights.sh'\" />"
echo "</head>"
echo "<body>"

echo "<p> Please Wait...................won't be a minute"
lights_array=$(cat xmas_lights_array)
lights_array=($lights_array)


           function test_status {
               test_status=$(curl -X GET --proto-default http "http://${1}/cm?cmnd=status%209"| jq '.Status.Power')
	       if [ $test_status -gt 0 ]
		then
                curl -s http://${1}/cm?cmnd=Power%20Off > /dev/null
                else
              	curl -s http://${1}/cm?cmnd=Power%20On > /dev/null
		fi
           }


#lights_array=(kitchen_ceiling_lights 192.168.1.237 bedroom_lights 192.168.1.241 hall_lights 192.168.1.242 hall_ceiling_lights 192.168.1.65 kitchen_lights 192.168.1.233)



count=0
while [ $count -lt ${#lights_array[@]} ]
do
    ipaddress=${lights_array[$count+1]}
    description=${lights_array[$count]}
    display_lights $ipaddress $description
    count=$(( $count + 2 ))
    test_status $ipaddress
done





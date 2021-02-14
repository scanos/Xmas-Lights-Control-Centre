#!/bin/bash

echo "Content-type: text/html"
echo ""
echo "<html><head><title>Castle Lights</title>"
cat  lights.html

echo "</head>"
echo "<body>"

lights_array=$(cat lights_array)
lights_array=($lights_array)
#cat lights_array

echo "<div class='container'><div class='jumbotron'><h1>Smart Light Control System</h1>      
<p>A simple low cost system which permits all your LEDS to be controlled from a single web page Version 1</p>
</div>"

echo "<table>"

           function display_lights {


test_status=$(curl -X GET --proto-default http "http://${1}/cm?cmnd=STATE")
#strip all speechmarks to make  substring manipulation easier
test_status=${test_status//\"/}
SUB="${3}:OFF"

if [[ "$test_status" == *"$SUB"* ]];
then
	echo "<tr><td><a href=http://${1}>$2</a></td><td>"
	testoutput=$(cat lights1.html)
	testoutput=${testoutput/ipaddress/$1}
	testoutput=${testoutput/description/$2}
	testoutput=${testoutput/channnel/$3}
	testoutput=${testoutput/state/OFF}
	echo $testoutput
	echo "</td></tr>"
else 
	echo "<tr><td><a href=http://${1}>$2</a></td><td>"
               #doesn't display button if no connection made to the host
	if [[ ${#test_status} -ge 1 ]]; then
		testoutput=$(cat lights1.html)
		testoutput=${testoutput/ipaddress/$1}
		testoutput=${testoutput/description/$2}
		testoutput=${testoutput/channnel/$3}
		testoutput=${testoutput/state/ON}
		testoutput=${testoutput/ox\"/ox\" checked }
	fi
	echo $testoutput
	echo "</td></tr>"
fi
           }



count=0
while [ $count -lt ${#lights_array[@]} ]
do
    ipaddress=${lights_array[$count+1]}
    description=${lights_array[$count]}
    channel=${lights_array[$count+2]}
    display_lights $ipaddress $description $channel
    count=$(( $count + 3 ))

#echo "<li>ipaddress is $ipaddress description is $description channel is  $channel"
done

echo "</table>"





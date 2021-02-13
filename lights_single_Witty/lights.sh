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
    <p>A simple low cost system which permits all your LEDS to be controlled from a single web page</p>
</div>"

echo "<table>"

           function display_lights {

#the json substitution  didnt work as it did for other scripts so did work around.
#test_status=$(curl -X GET --proto-default http "http://${1}/cm?cmnd=STATE"| jq '.${3} ')
test_status=$(curl -X GET --proto-default http "http://${1}/cm?cmnd=STATE")
#strip all speechmarks to make  substring manipulation easier
test_status=${test_status//\"/}
#echo $test_status

SUB="${3}:OFF"

#echo "SUB $SUB"
if [[ "$test_status" == *"$SUB"* ]]; then
  #test_status="OFF"


#echo " test_status $test_status 1 is ||$1|| 2 is ||$2|| 3 is ||$3||"


           #if [ $test_status -gt 0 ]
           #     then
echo "<tr><td><a href=http://${1}>$2</a></td><td>"


testoutput=$(cat lights1.html)
testoutput=${testoutput/ipaddress/$1}
testoutput=${testoutput/description/$2}
testoutput=${testoutput/channnel/$3}
testoutput=${testoutput/state/OFF}
#testoutput=${testoutput/ox\"/ox\" checked }

echo $testoutput
echo "</td></tr>"
                else 
echo "<tr><td><a href=http://${1}>$2</a></td><td>"

testoutput=$(cat lights1.html)
testoutput=${testoutput/ipaddress/$1}
testoutput=${testoutput/description/$2}
testoutput=${testoutput/channnel/$3}
testoutput=${testoutput/state/ON}
testoutput=${testoutput/ox\"/ox\" checked }

echo $testoutput
echo "</td></tr>"
 
           fi
           }


           function test_status {
               test_status=$(curl -X GET --proto-default http "http://${1}/cm?cmnd=status%209"| jq '.Status.Power')
	       if [ $test_status -gt 0 ]
		then
                                #echo "<p>test_status ${1}"
                curl -s http://${1}/cm?cmnd=Power%20Off > /dev/null
                else
                                #echo "<p>test_status ${1}"
              	curl -s http://${1}/cm?cmnd=Power%20On > /dev/null
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

echo "<li>ipaddress is $ipaddress description is $description channel is  $channel"
done

echo "</table>"

echo "<p><form action='lights_toggle.sh' method='POST'>"
echo "<input type='hidden' name='toggle' value='1'>"
echo "<input type='submit' value='Toggle All Lights'></form>"



echo "<p><a href=xmas_lights_nmap.sh>Turn off all lights</a>"



echo "</body></html>"




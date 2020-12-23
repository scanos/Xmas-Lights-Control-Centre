#!/bin/bash

echo "Content-type: text/html"
echo ""
echo "<html><head><title>Xmas Lights</title>"
cat  xmas_lights.html

echo "</head>"
echo "<body>"

lights_array=$(cat xmas_lights_array)
lights_array=($lights_array)
echo "<div class='container'><div class='jumbotron'><h1>Smart Christmas Light Control System</h1>      
    <p>A simple low cost system which permits all your Christmas Tree lights to be controlled from a single web page</p>
</div>"

echo "<table>"

           function display_lights {
           test_status=$(curl -X GET --proto-default http "http://${1}/cm?cmnd=status%209"| jq '.Status.Power')
           if [ $test_status -gt 0 ]
                then
echo "<tr><td><a href=http://${1}>$2</a></td><td>"
testoutput=$(cat xmas_lights1.html)
testoutput=${testoutput/ipaddress/$1}
testoutput=${testoutput/description/$2}
testoutput=${testoutput/state/OFF}
testoutput=${testoutput/ox\"/ox\" checked }

echo $testoutput
echo "</td></tr>"
                else 
echo "<tr><td><a href=http://${1}>$2</a></td><td>"

testoutput=$(cat xmas_lights1.html)
testoutput=${testoutput/ipaddress/$1}
testoutput=${testoutput/description/$2}
testoutput=${testoutput/state/ON}

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
    display_lights $ipaddress $description
    count=$(( $count + 2 ))


done

echo "</table>"

echo "<p><form action='xmas_lights_toggle.sh' method='POST'>"
echo "<input type='hidden' name='toggle' value='1'>"
echo "<input type='submit' value='Toggle All Lights'></form>"



echo "<p><a href=xmas_lights_nmap.sh>Turn off all lights</a>"



echo "</body></html>"




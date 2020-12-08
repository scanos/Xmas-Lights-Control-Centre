#!/bin/bash
#toggle=${QUERY_STRING#*toggle=}
read POST_STRING
toggle=${POST_STRING#*toggle=}
toggle=${toggle%%&*}
toggle=${toggle//+/ }
#toggle=$(read POST_STRING)
#toggle=${toggle/toggle\=/}


echo "Content-type: text/html"
echo ""
echo "<html><head><title>Xmas Lights</title>"
cat  xmas_lights.html

echo "</head>"
echo "<body>"


echo "<div class='container'><div class='jumbotron'><h1 class=\"text-danger\">Smart Christmas Light Control System</h1>      
    <p>Bootstrap is the most popular HTML, CSS, and JS framework for developing responsive, mobile-first projects on the web.</p>
  </div>
  <p class=\"text-danger\">This is some text.</p>  
<p class='text-white bg-dark'>.text-white</p>
<p class='text-warning'>.text-warning</p>    
  <p>This is another text.</p>      
</div>"
echo "<p class='text-danger'>This is some text.</p>"



echo "<table>"
#Xmas Lights query string ${POST_STRING} toggle $toggle <br>"

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
#echo "<p> $1 $2"
echo "<tr><td><a href=http://${1}>$2</a></td><td>"

testoutput=$(cat xmas_lights1.html)
#testoutput=${testoutput/potter/$1}
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


lights_array=(kitchen_ceiling_lights 192.168.1.237 bedroom_lights 192.168.1.241 hall_lights 192.168.1.242 hall_ceiling_lights 192.168.1.65 kitchen_lights 192.168.1.233)


count=0
while [ $count -lt ${#lights_array[@]} ]
do
    ipaddress=${lights_array[$count+1]}
    description=${lights_array[$count]}
    display_lights $ipaddress $description
    count=$(( $count + 2 ))

	if [ $toggle -gt 0 ]
	then
		test_status $ipaddress
	fi



done

echo "</table>"
echo "<form action='/cgi-bin/xmas_lights.sh' method='POST'>"
echo "<input type='hidden' name='toggle' value='1'>"
echo "<input type='submit' Toggle Light value='Toggle Lights'></form>"

echo "</body></html>"




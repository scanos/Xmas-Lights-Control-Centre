#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><head><title>Xmas Lights</title>"
#cat  xmas_lights.html
echo "<meta http-equiv='refresh' content=\"0; URL='xmas_lights.sh'\" />"
echo "</head>"
echo "<body>"

echo "<p> Please Wait...................won't be a minute'"
toggle=${QUERY_STRING#*toggle=}
#read POST_STRING
#toggle=${POST_STRING#*toggle=}
toggle=${toggle%%&*}
toggle=${toggle//+/ }


           test_status=$(curl -X GET --proto-default http "http://${toggle}/cm?cmnd=status%209"| jq '.Status.Power')
           if [ $test_status -gt 0 ]
                then
                
 curl -s http://${toggle}/cm?cmnd=Power%20Off > /dev/null

                else 
 curl -s http://${toggle}/cm?cmnd=Power%20On > /dev/null

           fi
           }

echo "1 $1 toggle $toggle " >> test_lights_change

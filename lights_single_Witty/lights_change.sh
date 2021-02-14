#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><head><title>Xmas Lights</title>"
echo "<meta http-equiv='refresh' content=\"0; URL='lights.sh'\" />"
echo "</head>"
echo "<body>"

toggle=${QUERY_STRING#*toggle=}
toggle=${toggle%%&*}
toggle=${toggle//+/ }
canel=${QUERY_STRING#*canel=}
canel=${canel%%&*}
canel=${canel//+/ }

xtimer=${QUERY_STRING#*xtimer=}
xtimer=${xtimer%%&*}
xtimer=${xtimer//+/ }


echo "<p> Please Wait................... starting in $xtimer seconds"
#toggle device using curl
# tried timeout ${xtimer} but doesnt work on my pi

date1=$(date +%s)

#Use this arithmetic to determine elapsed time since defining date1
$(( $(date +%s) - $date1 ))

#While loop using timer
while ! [ $(( $(date +%s) - $date1 )) -gt $xtimer ]; do
    #Terminal timer -n won't append new line, so the echo will replace itself. 
    ##There is also some date formatting to achieve: HH:MM:SS.
    echo -ne "$(date -u --date @$(( $(date +%s) - $date1 )) +%H:%M:%S)\r" > /dev/null
done 

curl -s http://${toggle}/cm?cmnd=${canel}%20toggle > /dev/null




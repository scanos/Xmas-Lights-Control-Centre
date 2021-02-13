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

echo "<p> Please Wait..................."
#toggle device using curl
curl -s http://${toggle}/cm?cmnd=${canel}%20toggle > /dev/null




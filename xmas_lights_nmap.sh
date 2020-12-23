#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><head><title>turned off</title>"

echo "<meta http-equiv='Refresh' content='5; url=${HTTP_REFERER}' /></head>"
echo "<body>"
nmap -sP 192.168.1.0/24 > nmap.txt
sleep 20


while read line
do

	if [[ "$line" =~ .*"smartlight".* ]]; 
		then
		ipaddress=$(IFS=" " read -ra ADDR <<< "${line}"; echo ${ADDR[5]})
		hostname=$(IFS=" " read -ra ADDR <<< "${line}"; echo ${ADDR[4]})
		ipaddress=${ipaddress/(/}
		ipaddress=${ipaddress/)/}
		echo "<p>$ipaddress $hostname switched off"
		curl -s http://${ipaddress}/cm?cmnd=Power%20Off > /dev/null

	fi

done < <(cat nmap.txt)

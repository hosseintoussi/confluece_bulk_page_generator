#!/bin/bash
color='\e[0;34m'
NC='\e[0m'

echo  -e "${color} hello, $USER. This is a Page populator for Confluence ${NC}"
date=$(date +"%m-%d-%Y")
url="http://localhost:8090/rest/api/content/"
user="admin"
pass="admin"
number=10

echo -e ${color} $url ${NC}
echo "$user"

for (( c=1; c<=$number; c++ ))
do
   
   saeed="\"title\":\"page$c\""
   echo -e ${color} $c {NC}

   curl -u $user:$pass \
   -X POST \
   -H 'Content-Type: application/json' \
   -d'{"type":"page",'$saeed',"space":{"key":"ds"},"body":{"storage":{"value":"<p><ac:structured-macro ac:name=\"loremipsum\"/></p>","representation":"storage"}}}' "$url" \
   | python -mjson.tool >> $date.log

 echo -e ${color} $c Created ${NC}

done

echo -e ${color} Done!! ${NC}



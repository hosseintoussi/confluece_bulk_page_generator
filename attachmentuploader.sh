#!/bin/bash
color='\e[0;34m'
NC='\e[0m'

echo  -e "${color} Confluence content creator${NC}"

url=$(grep -Po '<(baseurl>)\K.*?(?=</\1)' config.xml)
user=$(grep -Po '<(user>)\K.*?(?=</\1)' config.xml)
pass=$(grep -Po '<(pass>)\K.*?(?=</\1)' config.xml)
number=$(grep -Po '<(totalOf>)\K.*?(?=</\1)' config.xml)
location=$(grep -Po '<(location>)\K.*?(?=</\1)' config.xml)
spaceKey=$(grep -Po '<(spaceKey>)\K.*?(?=</\1)' config.xml)
startFrom=$(grep -Po '<(startFrom>)\K.*?(?=</\1)' config.xml)
namePrefix=$(grep -Po '<(namePrefix>)\K.*?(?=</\1)' config.xml)
date=$(date +"%m-%d-%Y")

echo -e ${color} $url ${NC}
echo "$user"


for (( c=1; c<=$number; c++ ))
do
    file = $location/$c
   title="\"title\":\"$namePrefix$c\""
   space="\"space\":{\"key\":\"$spaceKey\"}"
   echo "$file"
   echo -e ${color} $c {NC}

   curl -v -S -u $user:$pass \
   -X POST \
   -H "X-Atlassian-Token: no-check" \
   -F "file=@$file" \
   -F "comment=this is my file" \
   "http://localhost:8090/rest/api/content/557060/child/attachment" \
   | python -mjson.tool >> $date.log

 echo -e ${color} $c attached ${NC}

done

echo -e ${color} Done!! ${NC}



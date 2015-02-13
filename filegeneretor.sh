	#!/bin/bash
	color='\e[0;34m'
	NC='\e[0m'

	echo  -e "${color} Confluence content creator${NC}"
	number=$(grep -Po '<(totalOf>)\K.*?(?=</\1)' config.xml)
	location=$(grep -Po '<(location>)\K.*?(?=</\1)' config.xml)
	startFrom=$(grep -Po '<(startFrom>)\K.*?(?=</\1)' config.xml)
	 
	for (( c=1; c<=$number; c++ ))
	do
	   
	   echo -e ${color} $c {NC}
	   touch $location/$c
	   cat lorem.txt >> $location/$c

	 echo -e ${color} $c Created ${NC}

	done

	echo -e ${color} Done!! ${NC}



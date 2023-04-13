function youareuseless {
	if [ $# = 1 ]; then
		for i in {1..$1}
        	do  
                	echo $i / $1
                	osascript -e 'display notification "you are useless"'
                	say "you are useless"
        	done
	elif [ $# = 0 ]; then
		osascript -e 'display notification "you are useless"'
                say "you are useless"
	else
		say "Rentre les bons arguments abruti"
	fi
}

# exemple d'utilisation
# youareuseless 1 3

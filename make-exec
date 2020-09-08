#! /bin/bash

# author: woodj

# This script makes all the bash scripts in a diretory executable 
# We use it to make the scripts to make each mapfile script in the cgi-bin executable
# Once a script has executable permissions the Apache server will recongise it 

# First we find all of the files that contain the bash she-bang
SCRIPTS=($(grep -rl '^#! /bin/sh' .)) 

for SCRIPT in "${SCRIPTS[@]}"
do
	echo "Making ${SCRIPT} executable"
	# Must be executable by all for the cgi-bin to access it.
	chmod a+x $SCRIPT
done 



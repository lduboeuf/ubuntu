#!/bin/bash

#################################################
## update_webapps.sh                           ##
#################################################

### This script automaticaly update webapps as 
### soon as the Oliver Grawert's 
### alternate-webapp-container is up to date

# VARIABLES
#################################################



# FUNCTIONS
#################################################

function is_launchpad_available {

    # Check if the connexion to Launchpad.net  
    # could be established

    msg_connexion_established="""
    Connexion établie sur Launchpad.net...
    """
    msg_connexion_failed="""
    Connexion impossible vers Launchpad.net.\n
    Vérifiez votre connexion...
    """


    if ping -q -w 1 -c 1 launchpad.inet > /dev/null ; then

    	echo -e ${msg_connexion_established}
    	return 0

    else

        echo -e ${msg_connexion_failed}
        return 1

    fi
}

if function is_actual_revno { 

    # Return the actual revno from Oliver 
    # Grawert's alternate-webapp-container branch

    eval $(\
    	bzr \
    	version-info \
    	lp:~ogra/junk/alternate-webapp-container \
    	| grep "revno" \
    	| sed 's/\:\ /=/'\
    )

    return $revno

}
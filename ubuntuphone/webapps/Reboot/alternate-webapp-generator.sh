#!/bin/bash

#################################################
###                                           ###
### ALTERNATE WEBAPP GENERATOR                ###
### FOR UBUNTUPHONE                           ###
###                                           ###
#################################################

## AUTHOR : Winael
## DATE : 2015-03-29
## EMAIL : vinzjobard@gmail.com

## DESCRIPTION ##
#################

# A generator to create webapps for ubuntuphne 
# based on Oliver Grawert's 
# alternate-webbapp-container

## REVISION ##
##############

# 2015-03-29 : Creation of the script. It create 
#              the webapp using the config.cfg
#              linked to the script

## TODO ##
##########

# - A menu to generate a config.cfg per webapps

## CONFIGURATION ##
###################

source config.cfg

## PROGRAM ##
#############

# clone of the bzr branch of ogra's 
# alternate-webapp-container in the rep $appname

bzr branch \
    lp:~ogra/junk/alternate-webapp-container \
    $app_name

# save files qml/Main.qml, config.js, app.desktop
# and manifest.json for quick restore

mkdir -p $app_name/backup/

for file in $app_name/qml/Main.qml \
            $app_name/config.js \
            $app_name/manifest.json \
            $app_name/app.desktop

do cp $file $app_name/backup/

done

# copy the config.cfg file into the $app_name directory

cp config.cfg $app_name/


# Edit the value of applicationName at the top of
# qml/Main.qml to match your application name to 
# work around https://launchpad.net/bugs/1435778

sed -i \
    's/applicationName:.*$/'applicationName:\ \""$app_name.$namespace"\"'/' \
    $app_name/qml/Main.qml

# Edit config.js to add webappName, webappUrl,
# webappUrlPattern and webappUA similar to how
# you would use them as commandline options to 
# webapp-container.

cat << EOF > $app_name/config.js
var webappName = "$app_name.$namespace"
var webappUrl = "$app_url"
var webappUrlPattern = "https?://*$(echo $app_url | awk -F. '{print $2}')*"
var webappUA = "$app_UA"
EOF

# Edit app.desktop and manifest.json to your 
# liking.

## app.desktop

sed -i \
    's/Name=.*$/'Name="$app_title"'/' \
    $app_name/app.desktop

## manifest.json

### description

sed -i \
    's/\"description\":.*$/'\"description\":\ \""$app_description"\",'/' \
    $app_name/manifest.json

### hook 1 name

sed -i \
    's/google-plus/'"$app_name"'/g' \
    $app_name/manifest.json

### maintainer

sed -i \
    's/\"maintainer\":.*$/'\"maintainer\":\ \""$maintainer_name\ \<$maintainer_email\>"\",'/' \
    $app_name/manifest.json

### name

sed -i \
    's/\"name\":.*$/'\"name\":\ \""$app_name.$namespace"\",'/' \
    $app_name/manifest.json

### title

sed -i \
    's/\"title\":.*$/'\"title\":\ \""$app_title"\",'/' \
    $app_name/manifest.json

### version

sed -i \
    's/\"version\":.*$/'\"version\":\ \""$app_version"\"'/' \
    $app_name/manifest.json

# Replace icon.png with your own icon.

cp $icon_path $app_name/icon.png

# Build the webapp

cd $app_name

click build -I backup* .

cd ..

# Push the click to your device via adb

adb push $app_name/${app_name}.${namespace}_${app_version}_all.click Downloads

# Install the app

adb shell pkcon install-local --allow-untrusted Downloads/${app_name}.${namespace}_${app_version}_all.click




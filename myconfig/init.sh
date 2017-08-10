#!/bin/bash

ONTOPVOLUME=/data

# adapt this to a configuration option on the java interpreter
chmod 777 $ONTOPVOLUME
cd /var/lib/tomcat7
ln -s $ONTOPVOLUME .aduna
cd /usr/share/tomcat7
ln -s $ONTOPVOLUME .aduna

mkdir -p $ONTOPVOLUME/openrdf-sesame
mkdir -p $ONTOPVOLUME/openrdf-workbench

chown -R tomcat7:tomcat7 $ONTOPVOLUME

for file in $ONTOPVOLUME/lib
do
  if [[ -f $file ]] && [[ "$file" == *"jar"* ]] ; then
  # make the jdbc driver globably available for all webapps
    echo ${file##*/}
    cd /usr/share/tomcat7/lib
    ln -s /data/${file##*/}
  fi
done

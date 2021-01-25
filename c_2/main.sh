#!/bin/bash

# Source json util function
source utils.sh
# source aws metadata generation functions
source metadata.sh

OLDIFS=$IFS
# AWS instance metadata root url
url="http://169.254.169.254/latest/meta-data/"
# initialize empty json
json_str={}
# generate metadata in json
_get_instance_meta_data $url


echo "######################################################"
echo "AWS : Instance Meta Data JSON"
echo "######################################################"
# Print JSON Data interactive
echo $json_str | jq

echo "######################################################"
echo "You can query information for specific key"
echo "Please input key to fetch value for"
echo "######################################################"
# user request for key value to fetch
i=0
while [ $i -eq 0 ] ; do
    echo "Please input key to fetch value for"    
    echo "######################################################"
    read key_to_fetch
    echo "########################"
    echo "Fetched Value :"
    echo $json_str | jq --arg key $key_to_fetch '.[$key]'
done

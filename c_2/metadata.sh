#!/bin/bash
json_escape () {
    printf '%s' "$1" | python -c 'import json,sys; print(json.dumps(sys.stdin.read()))'
}

function _add_data_json(){

	key=$1
	api_value=$2
	str_type=$3
	if [[ ${key} =~ "/" ]]; then
           IFS="/"
           i=1
           arg_list=""
           jq_action_str="."
           for k in $key
           do
               arg_list="$arg_list --arg key${i} ${k} "
               jq_action_str="$jq_action_str[\$key${i}]"
               i=$((i+1))
           done
           IFS=$OLDIFS

	   escaped_value=$(json_escape ${api_value})
	   if [ "${str_type}" == "json" ]; then
              arg_list="$arg_list--argjson value ${escaped_value}"
   	   else
	      arg_list="$arg_list--arg value ${escaped_value}"
	   fi

           jq_action_str="$jq_action_str=\$value"
           command="jq ${arg_list} $jq_action_str"
           json_str=`echo $json_str | ${command}`
        else
           json_str=`echo $json_str | jq --arg key "${key}" --arg value "${api_value}" '.[$key] += $value'`
        fi


}

function _get_instance_meta_data(){

	api_list=`curl -s ${1}`
	for api_key in ${api_list}
	do
		if [[ "${api_key}" == */ ]]; then
			# Recursive call if has child elements, i.e if ends with /
			_get_instance_meta_data "${1}${api_key}"
		elif [[ "${1}" == *public-keys/ ]];then
			# public key api works bit different
			# handle it here
			# api_key : 0=metadata, actual call 0/openssh-key
			api_key=`echo ${api_key} | cut -d '=' -f1`
			api_key="${api_key}/openssh-key"
		
			# call instance meta data apihere
                        api_value=`curl -s "${1}${api_key}"`
			key=`echo ${1}${api_key} | sed -e "s|$url||"`
                        _add_data_json ${key} ${api_value} ""

		elif [[ "${1}" =~ "metrics" ]];then
			break
		else
			# call instance meta data apihere
			api_value=`curl -s "${1}${api_key}"`
			key=`echo ${1}${api_key} | sed -e "s|$url||"`
			_add_data_json ${key} ${api_value} "json"
		fi
	done
}

OLDIFS=$IFS
url="http://169.254.169.254/latest/meta-data/"
json_str={}
_get_instance_meta_data $url


echo "######################################################"
echo "AWS : Instance Meta Data JSON"
echo "######################################################"
echo $json_str | jq

echo "######################################################"
echo "You can query information for specific key"
echo "Please input key to fetch value for"
echo "######################################################"

read key_to_fetch
echo "########################"
echo "Fetched Value :"
echo $json_str | jq --arg key $key_to_fetch '.[$key]'

function _get_instance_meta_data(){
        # CURL AWS instance meta-data url
	api_list=`curl -s ${1}`
	#Iterate over enpoints
	for api_key in ${api_list}
	do
		# Check if endpoint has child endpoints
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
			# add key value to json string
                        _add_data_json ${key} ${api_value} ""
		# Metrics endpoint returns xml data, skip metrics data
		elif [[ "${1}" =~ "metrics" ]];then
			break
		else
			# call instance meta data apihere
			api_value=`curl -s "${1}${api_key}"`
			# endpoint value without root url
			key=`echo ${1}${api_key} | sed -e "s|$url||"`
			# Add value to json
			_add_data_json ${key} ${api_value} "json"
		fi
	done
}

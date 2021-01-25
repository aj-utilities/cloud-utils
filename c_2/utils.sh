#Function to escape JSON String
json_escape () {
    printf '%s' "$1" | python -c 'import json,sys; print(json.dumps(sys.stdin.read()))'
}

# Function to add data to json
# Arguments
# 1 key : JSON key to be added, allows nested keys separated by /, example : a/b/c
# 2 value : JSON value to be added against the key passed
# 3 str_type : allows json value to be added
function _add_data_json(){

	key=$1
	api_value=$2
	str_type=$3

	# Check if nested key separated by /
	if [[ ${key} =~ "/" ]]; then
           IFS="/"
           i=1
           arg_list=""
           jq_action_str="."
	   # Iterate over nested keys
           for k in $key
           do
	       # Generate argument list for JQ command   
               arg_list="$arg_list --arg key${i} ${k} "
	       # Generate JQ expression to add nested object
               jq_action_str="$jq_action_str[\$key${i}]"
               i=$((i+1))
           done
           IFS=$OLDIFS
	   # Escape String
	   escaped_value=$(json_escape ${api_value})
	   # Add String or JSON value
	   if [ "${str_type}" == "json" ]; then
              arg_list="$arg_list--argjson value ${escaped_value}"
      	   else
	      arg_list="$arg_list--arg value ${escaped_value}"
	   fi

           jq_action_str="$jq_action_str=\$value"
	   # JQ command to execute
           command="jq ${arg_list} $jq_action_str"
	   # Keep adding json object to existing string
           json_str=`echo $json_str | ${command}`
        else
	   # Keep adding json object to existing string
           json_str=`echo $json_str | jq --arg key "${key}" --arg value "${api_value}" '.[$key] += $value'`
        fi


}

import sys
import json
import argparse

# this function takes 2 inputs
# argument 1 - valid JSON string
# argument 2 - JSON key to fetch value for
# Nested Keys are allowed, but / should be used as separator, eg: a/b/c
# json is parsed and value for key passed are fetched
# returns value for key if found, if key does not exist returns string KEY_NOT_FOUND
def fetch_json_value(json_string,key):
    try:
        json_string = json.loads(json_string)
        print "JSON :"
        print(json.dumps(json_string, indent=4, sort_keys=False))
        print "KEY : ",key
    except ValueError as e:
	return "INVALID_JSON_STRING"


    key_arr = key.split('/');
    json_value = json_string
    i=0
    while i < len(key_arr):
        try:
            json_value = json_value[key_arr[i]];
            i=i+1;
        except KeyError:
            return "KEY_NOT_FOUND"
    return json_value

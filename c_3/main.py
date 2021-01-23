# Main caller file

#Importing argument parser module to mandate arguments
import argparse
import utils

try:
    # Parse Arguments
    
    parser = argparse.ArgumentParser(description='JSON key fetch function')
    mandatoryArgs = parser.add_argument_group('Arguments Required')
    
    # mandatory argument -j (json string)
    mandatoryArgs.add_argument('-j', '--json', help='Json String', required=True, dest='json_string')
    
    # mandatory argument -k (key or nested key to fetch value for)
    mandatoryArgs.add_argument('-k', '--key', help='Key to fetch', required=True, dest='key')
    args = parser.parse_args()
    
    # function call to fetch value from json_string for key passed
    value=utils.fetch_json_value(args.json_string, args.key)
    print "Output : ", value

except KeyboardInterrupt:
    print('User has exited the program')

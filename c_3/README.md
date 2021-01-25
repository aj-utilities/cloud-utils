## JSON Key Fetch

This utility allows to fetch value for single or nested keys from JSON object.


### Dependencies
- python should be installed.
- jq should be installed.

### Usage:
- Clone or Download Scripts. 
- Execute python main.py -h to see usage

```
main.py [-h] -j JSON_STRING -k KEY

JSON key fetch function

optional arguments:
  -h, --help            show this help message and exit

Arguments Required:
  -j JSON_STRING, --json JSON_STRING
                        Json String
  -k KEY, --key KEY     Key to fetch

```

### Examples:

- EXAMPLE 1: valid JSON and valid KEY
```
$ python main.py -j '{"a":{"b":{"c":"d"}}}' -k a/b/c
JSON :
{
    "a": {
        "b": {
            "c": "d"
        }
    }
}
KEY :  a/b/c
Output :  d
```

- EXAMPLE 2: valid JSON and invalid KEY
```
$ python main.py -j '{"x":{"y":{"z":"a"}}}' -k p    
JSON :
{
    "x": {
        "y": {
            "z": "a"
        }
    }
}

KEY :  p
Output :  KEY_NOT_FOUND
```

- EXAMPLE 3: invalid JSON
```
$ python main.py -j '{"x":{"y":"z":"a"}}}' -k p
Output :  INVALID_JSON_STRING
```


### Known Issues
- When value of key is JSON, output format is unicode - this can be enhanced
```
[ec2-user@ip-172-31-7-113 c_3]$ python main.py -j '{"x":{"y":{"z":"a"}}}' -k x
JSON :
{
    "x": {
        "y": {
            "z": "a"
        }
    }
}
KEY :  x
Output :  {u'y': {u'z': u'a'}}
```

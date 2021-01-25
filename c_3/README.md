## JSON Key Fetch

This utility allows to fetch value for single or nested keys from JSON object.

### Usage:
- Clone or Download Scripts. 
- Execute main.py -h to see usage

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

- EXAMPLE 1: valid JSON and valid KEY<br />
```
$ python main.py -j '{"a":{"b":{"c":"d"}}}' -k a/b/c
<br />
JSON :
{
    "a": {
        "b": {
            "c": "d"
        }
    }
}
<br />
KEY :  a/b/c
<br />
Output :  d
<br /><br /><br />
```

- EXAMPLE 2: valid JSON and invalid KEY <br />
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
<br />
KEY :  p
<br />
Output :  KEY_NOT_FOUND
<br /><br /><br />
```

- EXAMPLE 3: invalid JSON<br />
```
$ python main.py -j '{"x":{"y":"z":"a"}}}' -k p
<br />
Output :  INVALID_JSON_STRING
<br /><br /><br />

$ python main.py -j '{"x":"y","z":"a"}' -k z
<br />
JSON :
{
    "x": "y", 
    "z": "a"
}
<br />
KEY :  z
<br />
Output :  a
```

JSON Key Fetch


Usage: main.py [-h] -j JSON_STRING -k KEY

JSON key fetch function

optional arguments:
  -h, --help            show this help message and exit

Arguments Required:
  -j JSON_STRING, --json JSON_STRING
                        Json String
  -k KEY, --key KEY     Key to fetch


Usage Examples:

EXAMPLE 1:<br />
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

EXAMPLE 2:<br />
$ python main.py -j '{"x":{"y":{"z":"a"}}}' -k x/y/z 
JSON :
{
    "x": {
        "y": {
            "z": "a"
        }
    }
}
<br />
KEY :  x/y/z
<br />
Output :  a
<br /><br /><br />

EXAMPLE 3:<br />
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

EXAMPLE 4:<br />
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


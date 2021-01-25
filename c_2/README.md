AWS instance metadata - JSON util
<br/><br/><br/>

This utility, queries ec2 instance metadata and generates JSON. <br/>
It allows to query key from JSON interactively. <br/>

<br/>

Example : <br/>

######################################################
AWS : Instance Meta Data JSON
######################################################
{
  "ami-id": "ami-01720b5f421cf0179",
  "ami-launch-index": "0",
  "ami-manifest-path": "(unknown)",
  "block-device-mapping": {
    "ami": "/dev/xvda",
    "root": "/dev/xvda"
  },
  "events": {
    "maintenance": {
      "history": "[]",
      "scheduled": "[]"
    }
  },
  "hostname": "ip-172-31-7-113.eu-west-1.compute.internal",
  "identity-credentials": {
    "ec2": {
      "info": "\"{\"",
      "security-credentials": {
        "ec2-instance": "\"{\""
      }
    }
  },
  "instance-action": "none",
  "instance-id": "i-02ade877538e41934",
  "instance-life-cycle": "on-demand",
  "instance-type": "t2.micro",
  "local-hostname": "ip-172-31-7-113.eu-west-1.compute.internal",
  "local-ipv4": "172.31.7.113",
  "mac": "02:bb:01:c6:d1:af",
  "network": {
    "interfaces": {
      "macs": {
        "02:bb:01:c6:d1:af": {
          "device-number": "0",
          "interface-id": "eni-02c9a11784436cc96",
          "ipv4-associations": {
            "3.249.118.21": "172.31.7.113"
          },
          "local-hostname": "ip-172-31-7-113.eu-west-1.compute.internal",
          "local-ipv4s": "172.31.7.113",
          "mac": "02:bb:01:c6:d1:af",
          "owner-id": "667276242867",
          "public-hostname": "ec2-3-249-118-21.eu-west-1.compute.amazonaws.com",
          "public-ipv4s": "3.249.118.21",
          "security-group-ids": "sg-02aa288b0c6e7374b",
          "security-groups": "launch-wizard-2",
          "subnet-id": "subnet-2a3d004c",
          "subnet-ipv4-cidr-block": "172.31.0.0/20",
          "vpc-id": "vpc-930fcfea",
          "vpc-ipv4-cidr-block": "172.31.0.0/16",
          "vpc-ipv4-cidr-blocks": "172.31.0.0/16"
        }
      }
    }
  },
  "placement": {
    "availability-zone": "eu-west-1a",
    "availability-zone-id": "euw1-az1",
    "region": "eu-west-1"
  },
  "profile": "default-hvm",
  "public-hostname": "ec2-3-249-118-21.eu-west-1.compute.amazonaws.com",
  "public-ipv4": "3.249.118.21",
  "public-keys": {
    "0": {
      "openssh-key": "\"ssh-rsa\""
    }
  },
  "reservation-id": "r-0e7a2e336caaec466",
  "security-groups": "launch-wizard-2",
  "services": {
    "domain": "amazonaws.com",
    "partition": "aws"
  }
}
######################################################
You can query information for specific key
Please input key to fetch value for
######################################################
Please input key to fetch value for
######################################################
profile
########################
Fetched Value :
"default-hvm"
Please input key to fetch value for
######################################################
services
########################
Fetched Value :
{
  "domain": "amazonaws.com",
  "partition": "aws"
}
Please input key to fetch value for
######################################################

#!/opt/local/bin/bash
SCRIPT_PATH=$(dirname $(greadlink -f $0))

# Ensure that the env vars have been set:
ERROR=""

if [ -z $KBASE_SESSION ] 
  then
    echo "KBASE_SESSION (token) environment variable not set"
    ERROR="yes"
fi

if [ -z $SAUCE_USERNAME ] 
  then
    echo "SAUCE_USERNAME environment variable not set"
    ERROR="yes"
fi

if [ -z $SAUCE_ACCESS_KEY ] 
  then
    echo "SAUCE_ACCESS_KEY environment variable not set"
    ERROR="yes"
fi

if [ $ERROR ]
  then
    echo "Errors found, not running tests: $ERROR"
    exit 1
fi


export KBASE_SESSION=VRYX2RS4T3CFWMZSXK3FQ6R3MBJNDWQE
export SAUCE_USERNAME=eapearson
export SAUCE_ACCESS_KEY=070e4128-36ea-4cb0-ae54-8ded7d2c352e
#SC=$SCRIPT_PATH/../../../sc-4.4.7-osx/bin/sc
#echo "Starting the sauce connect server ... $SC"
#daemon --name=sauce_connect -- $SC -d sauce-connect.pid
grunt webdriver:sauce
#daemon --stop --name=sauce_connect
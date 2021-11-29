#!/bin/bash

# write the commands to run the test below

mkdir -p tests/outputs/

for FILE in xsl/**.xsl
    do echo "Testing $FILE ..."
    xsltproc $FILE tests/test-file.xml > tests/outputs/$FILE.output.txt
    if [ $? -eq 0 ]
        then
        echo "The test on $FILE ran ok"
        exit 0
        else
        echo "The script failed on $FILE" >&2
        exit 1
    fi
done
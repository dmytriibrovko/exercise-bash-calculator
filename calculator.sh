#!/bin/bash

# include files
source  ./plus.sh
source  ./multiply.sh
source  ./split.sh
source  ./minus.sh

if [ $# -eq 0 ]; then
    echo "No arguments"
    exit 123
elif [[ $1 == *[A-Za-z]* ]]; then
    echo "Use only numbers and basic arithmetic"
    exit 123
elif [[ $1 == *"+"* ]]; then
    . plus.sh $1
elif [[ $1 == *"-"* ]]; then
    . minus.sh $1
elif [[ $1 == *"*"* ]]; then
    . multiply.sh $1
elif [[ $1 == *"/"* ]]; then
    . division.sh $1
else
    echo "Use basic arithmetic operations such as : - + * /"
    exit 123
fi

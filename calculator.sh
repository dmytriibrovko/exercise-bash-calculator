#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No arguments"
    exit 123
elif [[ $1 == *[A-Za-z]* ]]; then
    echo "Use only numbers and basic arithmetic"
    exit 123
elif [[ $1 == *"+"* ]]; then
     source  ./plus.sh
     plus $1
elif [[ $1 == *"-"* ]]; then
     source  ./minus.sh
     minus $1
elif [[ $1 == *"*"* ]]; then
     source  ./multiply.sh
     multiply $1
elif [[ $1 == *"/"* ]]; then
     source  ./division.sh
     division $1
else
    echo "Use basic arithmetic operations such as : - + * /"
    exit 123
fi


#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No arguments"
    exit 123
elif [[ $1 =~ (^[0-9]*[.]?[0-9]+)([-+\/\*])([0-9]*[.]?[0-9]+$) ]]; then
     if [[ $1 =~ (^[0-9]*[.]?[0-9]+)([+])([0-9]*[.]?[0-9]+$) ]]; then
       source  ./plus.sh
       plus $1
     elif [[ $1 =~ (^[0-9]*[.]?[0-9]+)([-])([0-9]*[.]?[0-9]+$) ]]; then
       source  ./minus.sh
       minus $1
     elif [[ $1 =~ (^[0-9]*[.]?[0-9]+)([*])([0-9]*[.]?[0-9]+$) ]]; then
       source  ./multiply.sh
       multiply $1
     elif [[ $1 =~ (^[0-9]*[.]?[0-9]+)([/])([0-9]*[.]?[0-9]+$) ]]; then
       source  ./division.sh
       division $1
     else
       echo "Please double-check the equation"
       exit 123
     fi
else
    echo "Use only numbers and basic arithmetic operations such as : - + * /."
    echo "The calculator calculates only linear single-complex equation"
    exit 123
fi

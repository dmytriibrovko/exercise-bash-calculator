#!/bin/bash

first_num=`echo "$1" | cut -f1 -d*`
second_num=`echo "$1" | cut -f2 -d*`
if [[ $1  == *"."* ]]; then
   if [[ $first_num == *"."* ]]; then
      first_num_dat_first=`echo "$first_num" | cut -f1 -d.`
      first_num_dat_second=`echo "$first_num" |cut -f2 -d.`
      first_num_dat=`echo -n $first_num_dat_second |wc -c`
      first_num_power=$((($first_num_dat_first*10**($first_num_dat))+$first_num_dat_second))
      if [[ $second_num == *"."* ]]; then
         second_num_dat_first=`echo "$second_num" | cut -f1 -d.`
         second_num_dat_second=`echo "$second_num" |cut -f2 -d.`
         second_num_dat=`echo -n $second_num_dat_second |wc -c`
         if [[ $first_num_dat -ge $second_num_dat ]]; then
            second_num_power=$((($second_num_dat_first*10**($first_num_dat))+$second_num_dat_second*10**($first_num_dat-$second_num_dat)))
            printf %.4f "$((10**(4-$first_num_dat) * $second_num_power*$first_num_power))e-$((4+$first_num_dat))"
            echo " "
            exit 0
         else
            first_num_power=$((($first_num_dat_first*10**($second_num_dat))+$first_num_dat_second*10**($second_num_dat-$first_num_dat)))
            second_num_power=$((($second_num_dat_first*10**($second_num_dat))+$second_num_dat_second))
            result=$(($first_num_power*$second_num_power))
            printf %.4f "$((10**(4-$second_num_dat) * $second_num_power*$first_num_power))e-$((4+$second_num_dat))"
            echo " "
            exit 0
         fi
      else
        result=$(($second_num*10**$first_num_dat))
        printf %.4f "$((10**(4-$first_num_dat) * $result*$first_num_power))e-$((4+$first_num_dat))"
        exit 0
      fi
   else
      second_num_dat_first=`echo "$second_num" | cut -f1 -d.`
      second_num_dat_second=`echo "$second_num" |cut -f2 -d.`
      second_num_dat=`echo -n $second_num_dat_second |wc -c`
      second_num_power=$((($second_num_dat_first*10**($second_num_dat))+$second_num_dat_second))
      result=$(($first_num*10**$second_num_dat))
      printf %.4f "$((10**(4-$second_num_dat) * $result*$second_num_power))e-$((4+$second_num_dat))"
      echo " "
      exit 0
   fi
else
   let result=$(expr $1)
   echo $result
   exit 0
fi


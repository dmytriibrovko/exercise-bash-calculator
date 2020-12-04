#!/bin/bash

first_num=`echo "$1" | cut -f1 -d-`
second_num=`echo "$1" | cut -f2 -d-`
if [[ $1  == *"."* ]]; then
   if [[ $first_num == *"."* ]]; then
      first_num_dat_first=`echo "$first_num" | cut -f1 -d.`
      first_num_dat_second=`echo "$first_num" |cut -f2 -d.`
      first_num_dat=`echo -n $first_num_dat_second |wc -c`
      first_num_dat_plase=`echo -n $first_num_dat_first |wc -c`
      first_num_power=$((($first_num_dat_first*10**($first_num_dat))+$first_num_dat_second))
      #x.x-x.x
      if [[ $second_num == *"."* ]]; then
         second_num_dat_first=`echo "$second_num" | cut -f1 -d.`
         second_num_dat_second=`echo "$second_num" |cut -f2 -d.`
         second_num_dat=`echo -n $second_num_dat_second |wc -c`
         #xx.x-x.x or x.x-x.x
         if [[ $first_num_dat -ge $second_num_dat ]]; then
            first_num_power=$((($first_num_dat_first*10**($first_num_dat))+$first_num_dat_second))
            second_num_power=$((($second_num_dat_first*10**($first_num_dat))+$second_num_dat_second))
            result=$(($first_num_power-$second_num_power))
            result_quantity=`echo -n $result | wc -c`
            dat_plase=$result_quantity-$first_num_dat
            dat=$(seq 1 $(($dat_plase)) | tr -dc \\n | tr \\n "."; echo;)
            result_dat=`echo "$result" |sed "s/^\($dat\)/\1./"`
            if [[ $result_dat == .* ]]; then
               echo "0$result_dat"
               exit 0
            elif [[ $result_dat == -.* ]]; then
                 echo "$result_dat" |sed "s/-/-0/"
            else 
               echo "$result_dat"
               exit 0
            fi
         #x.x-x
         else
            first_num_power=$((($first_num_dat_first*10**($second_num_dat))+$first_num_dat_second))
            second_num_power=$((($second_num_dat_first*10**($second_num_dat))+$second_num_dat_second))
            result=$(($first_num_power-$second_num_power))
            result_quantity=`echo -n $result | wc -c`
            dat_plase=$result_quantity-$second_num_dat
            dat=$(seq 1 $(($dat_plase)) | tr -dc \\n | tr \\n "."; echo;)
            result_dat=`echo "$result" |sed "s/^\($dat\)/\1./"`
            if [[ $result_dat == .* ]]; then
               echo "0$result_dat"
               exit 0
            elif [[ $result_dat == -.* ]]; then
                 echo "$result_dat" |sed "s/-/-0/"
            else
               echo "$result_dat"
               exit 0
            fi
         fi
      #x-x.x
      else
         result=$(($first_num_power-($second_num*10**($first_num_dat))))
         result_quantity=`echo -n $result | wc -c`
         dat_plase=$result_quantity-$first_num_dat
         dat=$(seq 1 $(($dat_plase)) | tr -dc \\n | tr \\n "."; echo;)
         result_dat=`echo "$result" |sed "s/^\($dat\)/\1./"`
         if [[ $result_dat == .* ]]; then
             echo "0$result_dat"
             exit 0
         elif [[ $result_dat == -.* ]]; then
             echo "$result_dat" |sed "s/-/-0/"
         else
             echo "$result_dat"
             exit 0
         fi
      fi
   else
      second_num_dat_first=`echo "$second_num" | cut -f1 -d.`
      second_num_dat_second=`echo "$second_num" |cut -f2 -d.`
      second_num_dat=`echo -n $second_num_dat_second |wc -c`
      second_num_power=$((($second_num_dat_first*10**($second_num_dat))+$second_num_dat_second))
      result=$((($first_num*10**($second_num_dat))-$second_num_power))
      result_quantity=`echo -n $result | wc -c`
      dat_plase=$result_quantity-$second_num_dat
      dat=$(seq 1 $(($dat_plase)) | tr -dc \\n | tr \\n "."; echo;)
      result_dat=`echo "$result" |sed "s/^\($dat\)/\1./"`
      if [[ $result_dat == .* ]]; then
         echo "0$result_dat"
         exit 0
      elif [[ $result_dat == -.* ]]; then
         echo "$result_dat" |sed "s/-/-0/"
      else
         echo "$result_dat"
         exit 0
      fi
   fi
#x-x
else
   let result=$(expr $1)
   echo $result
   exit 0
fi

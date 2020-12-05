#!/bin/bash

function minus()
{
first_num=`echo "$1" | cut -f1 -d-`
second_num=`echo "$1" | cut -f2 -d-`
if [[ $1  == *"."* ]]; then
   if [[ $first_num == *"."* ]]; then
      first_num_dat_first=`echo "$first_num" | cut -f1 -d.`
      first_num_dat_second=`echo "$first_num" |cut -f2 -d.`
      first_num_dat=`echo -n $first_num_dat_second |wc -c`
      first_num_dat_plase=`echo -n $first_num_dat_first |wc -c`
      first_num_power=$((($first_num_dat_first*10**($first_num_dat))+$first_num_dat_second))
      #Float the first and second numbers
      if [[ $second_num == *"."* ]]; then
         second_num_dat_first=`echo "$second_num" | cut -f1 -d.`
         second_num_dat_second=`echo "$second_num" |cut -f2 -d.`
         second_num_dat=`echo -n $second_num_dat_second |wc -c`
         #Define by what degree to multiply
         if [[ $first_num_dat -ge $second_num_dat ]]; then
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
         #In the second number of more characters after the point
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
      #Float the first number only
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
   #Float point the second number only
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
#Both numbers integers
else
   let result=$(expr $1)
   echo $result
   exit 0
fi
}

#!/bin/bash

A=$3
M=$2
D=$1

while [ 0 ];
do

        if [ $M = 1 -o $M = 01 -o $M = 10 ]; then M=0; break; fi

        if [ $M = 2 -o $M = 02 -o $M = 3 -o $M = 03 -o $M = 11 ]; then M=3; break; fi

        if [ $M = 4 -o $M = 04 -o $M = 7 -o $M = 07 ]; then M=6; break; fi

        if [ $M = 5 -o $M = 05 ]; then M=1; break; fi
        
	if [ $M = 6 -o $M = 06 ]; then M=4; break; fi

        if [ $M = 8 -o $M = 08 ]; then M=2; break; fi

        if [ $M = 9 -o $M = 09 -o $M = 12 ]; then M=5; break; fi

done

SDM=$(($D + $M + 4))

if [ $SDM -gt 6 ]
then

        MMD7=$((($SDM/7) * 7))
        SDM=$(($SDM - $MMD7))

fi

DUDA=$(echo $A | cut -c 3-4)
MMD28=$((($DUDA / 28) * 28  | bc))
DUDA=$(($DUDA - $MMD28  | bc))

#while [ 0 ];
#do

#        if [ $DUDA -eq 1 ]; then DUDA=$(($DUDA - 1)); break; fi

#        if [ $DUDA -gt 1 -a $DUDA -lt 4 ]; then DUDA=$(($DUDA - 2)); break; fi

#        if [ $DUDA -gt 3 -a $DUDA -lt 7 ]; then DUDA=$(($DUDA - 4)); break; fi

#        if [ $DUDA -gt 6 -a $DUDA -lt 14 ]; then DUDA=$(($DUDA - 7)); break; fi

#        if [ $DUDA -gt 13 -a $DUDA -lt 28 ]; then DUDA=$(($DUDA - 14)); break; fi

#        if [ $DUDA -gt 27 -a $DUDA -lt 56 ]; then DUDA=$(($DUDA - 28)); break; fi

#        if [ $DUDA -gt 56 ]; then DUDA=$(($DUDA / 28)); break; fi

#done

ADPQ=$(($A / 4))

if [ $A -eq 2012 -o $A -eq 2016 -a $2 -eq 1 -o $2 -eq 01 -o $2 -eq 2 -o $2 -eq 02 ]
then
       N=$(($ADPQ + $DUDA - 1))
else
       N=$(($ADPQ + $DUDA))
fi

N=$(($N + $SDM))

if [ $N -gt 6 ]
then
        MMD7=$((($N/7) * 7))
        N=$(($N - $MMD7))
fi

while [ 0 ];
do

        if [ $N -eq 1 ]; then W="Domingo"; break; fi

        if [ $N -eq 2 ]; then W="Segunda"; break; fi

        if [ $N -eq 3 ]; then W="Terca"; break; fi

        if [ $N -eq 4 ]; then W="Quarta"; break; fi

        if [ $N -eq 5 ]; then W="Quinta"; break; fi

        if [ $N -eq 6 ]; then W="Sexta"; break; fi

        if [ $N -eq 0 -o $N -eq 7 ]; then W="Sabado"; break; fi

done

echo $W

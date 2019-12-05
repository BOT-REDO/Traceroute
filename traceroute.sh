# Traceroute

  GNU nano 2.7.4       Fichier : script.balbasry2.sh                 

#!/bin/bash
site=www.umontpellier.fr
TTL=0
res=0
repet=0

while [ $TTL -le 30 ]
do
TTL=$((TTL + 1 ))
n=0

if echo "$res" | grep '*' > /dev/null
then
        echo "$(($TTL - 1)) : Erreur "
fi

for mode in '-U' '-U -p 22' '-U -p 40' '-I' '-T -p 22' '-T -p 443' '$
do
res=$(traceroute $mode -A -N 3 -q 2 -w 2 -n $site -m $TTL -f $TTL | $


        if [ $(echo $res | cut -d " " -f 2) == $repet ]
        then
                        exit
        fi
        if echo "$res" | grep '*' > /dev/null
        then
                let n++
        else
        echo "$mode : $res"
        repet=$(echo $res | cut -d " " -f 2)
        break
        fi
done
done


#!/bin/sh
#LETTERS=(A B C D E F G H I J K L M N O P Q R S T)
LETTERS=(a b c d e f g h i j k l m n o p q r s t)
SKILLS=(st le wi dx to ch ap ma pe)
RACES=(Human Troll "High Elf" "Gray Elf" "Dark Elf" Dwarf Gnome Hurthling Orc Drakeling)
PROFFS=(Fighter Paladin Ranger Thief Assassin Wizard Priest Bard Monk Healer Weaponsmith Archer Merchant Farmer Mindcrafter Barbarian Druid Necromancer Elementalist Beastfighter)
for ((I=0; I<=19; I++))
do
  #echo -n "${PROFFS[${I}]}: "
  TOTAL=`grep "${PROFFS[${I}]}" /home/pyllyukko/projektit/pcgen/helpers/class_attributes.txt | sed 's/^.*\([+-] *[0-9]*\)$/\1/;s/ //g'`  
  LINE=`grep "${PROFFS[${I}]}" /home/pyllyukko/projektit/pcgen/helpers/class_attributes.txt | sed 's/^[^0-9+-]*//'`
  ST=`echo "${LINE}" | awk '{print $1}'`
  LE=`echo "${LINE}" | awk '{print $2}'`
  WI=`echo "${LINE}" | awk '{print $3}'`
  DX=`echo "${LINE}" | awk '{print $4}'`
  TO=`echo "${LINE}" | awk '{print $5}'`
  CH=`echo "${LINE}" | awk '{print $6}'`
  AP=`echo "${LINE}" | awk '{print $7}'`
  MA=`echo "${LINE}" | awk '{print $8}'`
  PE=`echo "${LINE}" | awk '{print $9}'`
  #echo -n "${PROFFS[${I}]} "
  echo -n "{${ST#+} ${LE#+} ${WI#+} ${DX#+} ${TO#+} ${CH#+} ${AP#+} ${MA#+} ${PE#+}"
  [ "x${TOTAL:0:1}" = "x+" ] && {
    #echo -n "${LETTERS[${I}]} ${TOTAL#+} "
    echo " ${TOTAL#+}}"
  } || {
    #echo -n "${LETTERS[${I}]} ${TOTAL} "
    echo " ${TOTAL}}"
  }
done
exit 0

for ((I=0; I<=$[${#RACES[*]}-1]; I++))
do
  #echo "${I}: ${LETTERS[${I}]} ${RACES[${I}]}"
  TOTAL=`grep "${RACES[${I}]}" /home/pyllyukko/projektit/pcgen/helpers/race_attributes.txt | sed 's/^.*\([+-] *[0-9]*\)$/\1/;s/ //g'`
  LINE=`grep "${RACES[${I}]}" /home/pyllyukko/projektit/pcgen/helpers/race_attributes.txt | sed 's/^[^0-9]*//'`
  ST=`echo "${LINE}" | awk '{print $1}'`
  LE=`echo "${LINE}" | awk '{print $2}'`
  WI=`echo "${LINE}" | awk '{print $3}'`
  DX=`echo "${LINE}" | awk '{print $4}'`
  TO=`echo "${LINE}" | awk '{print $5}'`
  CH=`echo "${LINE}" | awk '{print $6}'`
  AP=`echo "${LINE}" | awk '{print $7}'`
  MA=`echo "${LINE}" | awk '{print $8}'`
  PE=`echo "${LINE}" | awk '{print $9}'`
  #echo "${LINE}"
  #echo -n "${RACES[${I}]}: "
  #echo -n "${RACES[${I}]}: st: $ST le: $LE wi: $WI dx: $DX to: $TO ch: $CH ap: $AP ma: $MA pe: $PE"
  echo -n "{$ST $LE $WI $DX $TO $CH $AP $MA $PE"
  [ "x${TOTAL:0:1}" = "x+" ] && {
    #echo "${TOTAL:0:1} ${TOTAL#+}"
    
    #echo -n "${LETTERS[${I}]} ${TOTAL#+} "
    echo " ${TOTAL#+}}"
  } || {
    true
    #echo "${I}: ${LETTERS[${I}]} ${RACES[${I}]} ${TOTAL}"
    #echo -n "${LETTERS[${I}]} ${RACES[${I}]} ${TOTAL}"

    #echo -n "${LETTERS[${I}]} ${TOTAL} "
    echo " ${TOTAL}}"
  }
  #echo
done
echo
exit 0
for ((I=0; I<=19; I++))
do
  TOTAL=`grep "${PROFFS[${I}]}" /home/pyllyukko/projektit/pcgen/helpers/class_attributes.txt | sed 's/^.*\([+-] *[0-9]*\)$/\1/;s/ //g'`  
  #echo -n "${PROFFS[${I}]} "
  [ "x${TOTAL:0:1}" = "x+" ] && {
    echo -n "${LETTERS[${I}]} ${TOTAL#+} "
  } || {
    echo -n "${LETTERS[${I}]} ${TOTAL} "
  }
done
echo
#echo "${#RACES[*]}"
#!/bin/sh
FILE="./questions2.html"
LINES=`wc -l ${FILE} | awk '{print $1}'`
#for I in `seq 1 1`
#for I in `seq 38 38`
for I in `seq 1 51`
do
  #echo -e "QUESTION: ${I}"
  #echo "  if {\$numero==${I}} {"
  for J in `seq 1 4`
  do
    STRENGTH=0
    LEARNING=0
    WILLPOWER=0
    DEXTERITY=0
    TOUGHNESS=0
    CHARISMA=0
    APPEARANCE=0
    MANA=0
    PERCEPTION=0
    #LINE=`grep '^<b>' ${FILE} | sed -n $[${I}*${J}]p`
    LINE=`grep '^<b>' ${FILE} | sed -n $[${I}*4-4+${J}]p`
    LINE=`echo "${LINE}" | sed 's/<.>//g;s/<..>//g;s/<...>//g;s/,//g'`
    WORDS=`echo "${LINE}" | wc --words`
    #echo "${LINE}"
    case ${J} in
      1)
        #Q="A"
	Q="a"
      ;;
      2)
        #Q="B"
	Q="b"
      ;;
      3)
        #Q="C"
	Q="c"
      ;;
      4)
        #Q="D"
	Q="d"
      ;;
    esac
    for K in `seq 1 $[${WORDS}/2]`
    do
      ATTR=`echo "${LINE}" | awk --assign=e=$[${K}*2-1] '{print $e}'`
      CHANGE=`echo "${LINE}" | awk --assign=e=$[${K}*2] '{print $e}'`
      #echo "->${#CHANGE}<-"
      [ ${#CHANGE} -gt 2 ] && CHANGE=`echo "${CHANGE}" | head --bytes=2`
      #echo "${J}: ${ATTR} ${CHANGE}"
      case ${ATTR} in
        "St")
	  STRENGTH=$[${CHANGE}]
	;;
	"Le")
	  LEARNING=$[${CHANGE}]
	;;
	"Wi")
	  WILLPOWER=$[${CHANGE}]
	;;
	"Dx")
	  DEXTERITY=$[${CHANGE}]
	;;
	"To")
	  TOUGHNESS=$[${CHANGE}]
	;;
	"Ch")
	  CHARISMA=$[${CHANGE}]
	;;
	"Ap")
	  APPEARANCE=$[${CHANGE}]
	;;
	"Ma")
	  MANA=$[${CHANGE}]
	;;
	"Pe")
	  PERCEPTION=$[${CHANGE}]
	;;      
        *)
          #echo -e "ERROR!" 1>&2
	  true
	;;	  
      esac
    done
    #echo "  ANSWER: ${Q}"
    #[ ${STRENGTH} -ne 0 ] && echo "    strength: ${STRENGTH}"
    #[ ${LEARNING} -ne 0 ] && echo "    learning: ${LEARNING}"
    #[ ${WILLPOWER} -ne 0 ] && echo "    willpower: ${WILLPOWER}"
    #[ ${DEXTERITY} -ne 0 ] && echo "    dexterity: ${DEXTERITY}"
    #[ ${TOUGHNESS} -ne 0 ] && echo "    toughness: ${TOUGHNESS}"
    #[ ${CHARISMA} -ne 0 ] && echo "    charisma: ${CHARISMA}"
    #[ ${APPEARANCE} -ne 0 ] && echo "    appearance: ${APPEARANCE}"
    #[ ${MANA} -ne 0 ] && echo "    mana: ${MANA}"
    #[ ${PERCEPTION} -ne 0 ] && echo "    perception: ${PERCEPTION}"
    
    #[ ${STRENGTH} -ne 0 ] && echo "    set strength(${Q}) ${STRENGTH}"
    #[ ${LEARNING} -ne 0 ] && echo "    set learning(${Q}) ${LEARNING}"
    #[ ${WILLPOWER} -ne 0 ] && echo "    set willpower(${Q}) ${WILLPOWER}"
    #[ ${DEXTERITY} -ne 0 ] && echo "    set dexterity(${Q}) ${DEXTERITY}"
    #[ ${TOUGHNESS} -ne 0 ] && echo "    set toughness(${Q}) ${TOUGHNESS}"
    #[ ${CHARISMA} -ne 0 ] && echo "    set charisma(${Q}) ${CHARISMA}"
    #[ ${APPEARANCE} -ne 0 ] && echo "    set appearance(${Q}) ${APPEARANCE}"
    #[ ${MANA} -ne 0 ] && echo "    set mana(${Q}) ${MANA}"
    #[ ${PERCEPTION} -ne 0 ] && echo "    set perception(${Q}) ${PERCEPTION}"
    echo -n "${STRENGTH} ${LEARNING} ${WILLPOWER} ${DEXTERITY} ${TOUGHNESS} ${CHARISMA} ${APPEARANCE} ${MANA} ${PERCEPTION} "
  done
  #echo "  }"
done
echo
exit 0
TESTI=-1




TESTI=`expr ${TESTI} + 2`
echo ${TESTI}
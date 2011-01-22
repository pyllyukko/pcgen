#!/bin/sh
################################################################################
#
# adom_helper - v0.1 - by pyllyukko (pyllyukko@maimed.org) - 2002
#
# greets fly to amokrun - thanks for the logo!
#
################################################################################
trap 'echo ; echo -e "\033[1;31mctrl\033[0m-\033[1;31mc\033[0m!" ; exit 1' 2
################################################################################
function laskuri() {
  echo -n "current attribute level? "
  read STATS
  [ -z ${STATS} ] && {
    echo "try to type something!"
    return 1
  }
  [ `expr ${STATS} - ${STATS} &>/dev/null ; echo $?` -eq 2 ] && {
    echo "number! you nitwit!"
    return 1
  }
  [ ${STATS} -lt 1 -o ${STATS} -gt 50 ] && {
    echo "value out of range!"
    return 1
  }
  [ ${STATS} -lt 16 ] && KERROIN=100
  [ ${STATS} -gt 15 -a ${STATS} -lt 21 ] && KERROIN=200
  [ ${STATS} -gt 20 -a ${STATS} -lt 26 ] && KERROIN=400
  [ ${STATS} -gt 25 -a ${STATS} -lt 31 ] && KERROIN=800
  [ ${STATS} -gt 30 -a ${STATS} -lt 36 ] && KERROIN=1600
  [ ${STATS} -gt 35 -a ${STATS} -lt 41 ] && KERROIN=3200
  [ ${STATS} -gt 40 -a ${STATS} -lt 46 ] && KERROIN=6400
  [ ${STATS} -gt 45 ] && KERROIN=12800
  echo "$[${STATS}*${KERROIN}]$"
}
################################################################################
function killadom() {
  ADOM_PID=`/sbin/pidof adom` || {
    echo "adom not running!"
    return 1
  }
  echo -en "killing adom (pid: \033[1;31m${ADOM_PID}\033[0m) - "
  kill -9 ${ADOM_PID} && echo "killed!" || {
    echo "adom dodged the bullet!"
    return 1
  }
  echo -n "removing temp - "
  rm -f ~/.adom.data/.adom.prc &>/dev/null && echo "done!" || "echo failed!"
}
################################################################################
function help() {
  PROGNAME=${0##*/}
  echo -e "\033[0m                 \033[1;30m       _.sxS\$\$\$P\"\033[0;37m        \033[1;30m         ::  .s\$s.   \033[0;37m"
  echo -e "                 \033[1;30m    .sSP^\033[0;35m.\033[1;30m.\$$^\033[0;37m   \033[1;30m::\033[0;37m      \033[1;30m  .sdSP~  .sd$'\033[0;35m.\033[1;30m\`\$b  \033[0;37m"
  echo -e "              \033[31m:\033[37m \033[1;30m:: .d\$P'\033[0;35m::\033[1;30md$^  \"\$Ss._\033[0;37m \033[31m,:\033[37m  \033[1;30m.s\$\$\$P .s\$\$'\033[0;35m.:.:::\033[1;30m$: ::\033[0;37m \033[31m:\033[37m"
  echo -e "       \033[31m.\033[37m  \033[31m:::::::\033[1;30m :\$\$'\033[0;35m::l\033[1;30mj$'\033[0;31m::::.\033[1;30m\`$~Tb.\033[0;31m:'\033[1;30md$'\033[0;35m.\033[1;30m\$\$'\033[0;31m:::\033[1;30m\`T$\033[0;35ml:l:II\033[1;30m\$l\033[0;37m \033[31m:::::\033[37m"
  echo -e "        \033[31m :IIIIIII\033[1;30m l$'\033[0;35mIl:\033[1;30m:\$\$ \033[0;31mI'\033[1;30m_.s $\033[0;35m::\033[1;30m\$l j$'\033[0;35m::\033[1;30m\`$\033[0;37m \033[31mI'\033[1;30m.s\033[0;31m.\033[1;30m\`$\033[0;35mXIIX\033[1;30mj$:\033[0;31m.IIIII::.\033[37m"
  echo -e "      \033[31m:::IXXXXXXX\033[1;30m \$\$\033[0;35mXIIXl\033[1;30m\$\$:.s\"\033[0;31m.X\033[1;30mj$\033[0;35mXl:\033[1;30m$ \$\$\033[0;35m:III\033[1;30m\`b\033[0;37m \033[1;30ms'\033[0;31mjXX\033[1;30m\`$\033[0;35mXXX\033[1;30m\$\$'\033[0;31mjXXXXXI:::\033[37m \033[31m;\033[37m"
  echo -e "         \033[31m:IIIIIII\033[1;30m :$\033[0;35mlXlXX\033[1;30m:\$l\033[0;37m \033[31mII'\033[1;30mj\$\$sd\$P l$\033[0;35mIXlXX:\033[1;30m\$s._\033[0;31mI'\033[1;30mj$\033[0;35mX'\033[1;30m\$P'\033[0;31mIIIIIII::\033[37m"
  echo -e "       \033[31m:\033[37m \033[31m.::::::::\033[1;30m \$\$\033[0;35mXX\033[1;30m.s\$\$\$b.\033[0;37m \033[1;30mjP^~\033[0;31m.::::\033[37m \033[1;30m\$\$\033[0;35m:XX'\033[1;30mxSP^\033[0;31m.'\033[1;30md\$\$\$P^\033[0;31m.::::::::\033[37m \033[31m':\033[37m"
  echo -e "            \033[31m':\033[37m   \033[1;30m::\`\$\$\$\$S\"~ \033[0;37m     \033[31m:'\033[37m \033[1;30m::\033[0;37m   \033[1;30m\`\$\$\$P\"~  .s\$\$P^~\033[0;37m  \033[1;30m::\033[0;37m \033[31m:'\033[37m"
  echo -e "                 \033[1;30m   \`$\"'   .\033[0;35ma\033[1;30m.\033[0;35md\033[1;30m.\033[0;35mo\033[1;30m.\033[0;35mm\033[1;30m.\033[0;37m      \033[1;30m\`$'\033[0;37m   \033[1;30m.\033[0;35mh\033[1;30m.\033[0;35me\033[1;30m.\033[0;35ml\033[1;30m.\033[0;35mp\033[1;30m.\033[0;35me\033[1;30m.\033[0;35mr\033[1;30m.\033[0;37m"
  #echo "adom_helper - by pyllyukko (pyllyukko@maimed.org)"
  echo
  echo -e "\033[1;30musage: \033[0;35m${PROGNAME}\033[1;30m [-\033[0;35mhSLslkcx\033[1;30m]\033[0m"
  echo -e "  \033[0;35mh\033[1;30m: this help text"
  echo -e "  \033[0;35mS\033[1;30m: quicksave"
  echo -e "  \033[0;35mL\033[1;30m: quickload"
  echo -e "  \033[0;35ms\033[1;30m: save"
  echo -e "  \033[0;35ml\033[1;30m: load"
  echo -e "  \033[0;35mk\033[1;30m: kill adom - to get your favorite month when creating character"
  echo -e "  \033[0;35mc\033[1;30m: counter - to know how much money you should pay for garth to advance"
  echo -e "\033[15Cattribute level"
  echo -e "  \033[35mx\033[1;30m: starting a new game? set the date to 2nd of july to get lucky and"
  echo -e "\033[15Cfate smiles upon you -instricts! (requires root password)"
  echo  
  echo "send all suggestions, typo & bug reports, ideas, criticism & fixes"
  echo -e "to pyllyukko@maimed.org - all are welcome!\033[0m"
}
################################################################################
function yes_no() {
  echo -n "$1 (y/n)? "
  while read -r -s -n 1 CHOICE
  do
    case $CHOICE in
      y)
	echo "yes"
	return 0
        ;;      
      n)
	echo "no"
	return 1
        ;;
      *)
	continue
        ;;
    esac
  done
}
################################################################################
function choose() {
  LISTA=$*
  AMOUNT=`echo ${LISTA} | wc | awk '{print $2}'`
  select CHOICE in ${LISTA} `echo -e "\033[1;31mcancel\033[0m"`
  do
    case ${CHOICE} in
      `echo -e "\033[1;31mcancel\033[0m"`)
        return 1
	;;
      *)
        expr ${REPLY} + 666 &>/dev/null || {
	  echo -e "\033[5;31mNITWIT\033[0m!" 1>&2
	  continue
	}
	[ ${REPLY} -lt 1 -o ${REPLY} -gt $((${AMOUNT}+1)) ] && {
	  echo -e "\033[5;31mNITWIT\033[0m!" 1>&2
	  continue
	}
	echo ${CHOICE}
        return 0
	;;
    esac
  done
}
################################################################################
function quickload() {
  cd ~/.adom.data/savedg 2>/dev/null || {
    echo "~/.adom.data/savedg - no such dir!"
    return 1
  }
  LISTA=`ls *.bak 2>/dev/null | sed 's/.bak^*//'`
  AMOUNT=`echo ${LISTA} | wc | awk '{print $2}'`
  case ${AMOUNT} in
    0)
      echo -n "no quicksaves available - "
      ;;
    1)
      WHO=${LISTA}
      ;;
    *)
      WHO=`choose ${LISTA}`
  esac
  [ -z ${WHO} ] && echo -e "\033[1;31mcancelled\033[0m!" || {
    [ -f ${WHO}.svg ] && { 
      yes_no "saved game exists, overwrite?"
      case $? in
        0)
	  echo -en "quickloading \033[1;31m${WHO}\033[0m - "
	  yes | cp ${WHO}.bak ${WHO}.svg && echo "loaded!" || echo "unknown error occured - check permissions!"
	  ;;
        1)
	  echo -e "\033[1;31mcancelled\033[0m!"
	  ;;
	*)
	  echo -e "unknown error - \033[5;31mTHIS SHOULDN'T HAPPEN\033[0m!"
      esac
    } || {
      echo -en "quickloading \033[1;31m${WHO}\033[0m - "
      cp ${WHO}.bak ${WHO}.svg && echo "loaded!" || echo "unknown error occured - check permissions!"
    }
  }
}
################################################################################
function quicksave() {
  cd ~/.adom.data/savedg 2>/dev/null || {
    echo "~/.adom.data/savedg - no such dir!"
    return 1
  }
  LISTA=`ls *.svg 2>/dev/null | sed 's/.svg^*//'`
  AMOUNT=`echo ${LISTA} | wc | awk '{print $2}'`
  case ${AMOUNT} in
    0)
      echo -n "no saved games! - "
      ;;
    1)
      WHO=${LISTA}
      ;;
    *)
      WHO=`choose ${LISTA}`
  esac
  [ -z ${WHO} ] && {
    echo -e "\033[1;31mcancelled\033[0m!"    
  } || {
    echo -en "quicksaving \033[1;31m${WHO}\033[0m - "
    yes | cp ${WHO}.svg ${WHO}.bak && echo "saved!" || echo "unknown error occured - check permissions!"
  }
}
################################################################################
function _load() {
  NAME=$1
  LISTA=`ls -X ${NAME}`
  AMOUNT=`echo ${LISTA} | wc | awk '{print $2}'`
  echo ",-------------------."
  echo -e "|\033[1;31m1\033[0m=\033[1;31moldest\033[0m - \033[1;31m${AMOUNT}\033[0m=\033[1;31mnewest\033[0m|"
  echo "\`-------------------'"
  PS3="which one to load? "
  select CHOICE in `echo "${LISTA}" | sed 's/^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]-//g'` `echo -e "\033[1;31mcancel\033[0m"`
  do
    case ${CHOICE} in
      `echo -e "\033[1;31mcancel\033[0m"`)
        echo -e "\033[1;31mcancelled\033[0m!"
	break
	;;
      *)
        expr ${REPLY} + 666 &>/dev/null || {
	  echo -e "\033[5;31mNITWIT\033[0m!"
	  continue
	}
	[ ${REPLY} -lt 1 -o ${REPLY} -gt $((${AMOUNT}+1)) ] && {
	  echo -e "\033[5;31mNITWIT\033[0m!"
	  continue
	}
	LOAD_WHO=`echo ${LISTA} | awk --assign R=${REPLY} '{print $R}'`
	[ -f ${NAME}.svg ] && {
	  yes_no "saved game exists, overwrite?"
	  case $? in
	    0)
	      echo -en "loading \033[1;31m${NAME}\033[0m - "
	      yes | cp ${NAME}/${LOAD_WHO} ${NAME}.svg && echo "loaded!" || echo "unknown error occured - check permissions!"
	      ;;
	    1)
	      echo -e "\033[1;31mcancelled\033[0m!"
	      ;;
	    *)
	      echo -e "unknown error - \033[5;31mTHIS SHOULDN'T HAPPEN\033[0m!"
	  esac
	  break
	} || {
	  echo -en "loading \033[1;31m${NAME}\033[0m - "
	  cp ${NAME}/${LOAD_WHO} ${NAME}.svg && echo "loaded!" || echo "unknown error occured - check permissions!"
	  break
	}
    esac
  done
}
################################################################################
function load() {
  cd ~/.adom.data/savedg 2>/dev/null && {
    LISTA=`du | awk '$1!="4" {print $2}' | sed '$d;s/^.\///g'`
    AMOUNT=`echo ${LISTA} | wc | awk '{print $2}'`
    case ${AMOUNT} in
      0)
        echo "no saved games!"
	;;
      1)
	_load ${LISTA}
	;;
      *)
        LOAD_WHO=`choose ${LISTA}`
        [ -z ${LOAD_WHO} ] && echo -e "\033[1;31mcancelled\033[0m!" || _load ${LOAD_WHO}
    esac
  }
}
################################################################################
function _save() {
  NAME=$1
  [ -d ~/.adom.data/savedg/${NAME} ] || {
    echo "save directory does not exist, creating one to ~/.adom.data/savedg/${NAME}"
    mkdir ~/.adom.data/savedg/${NAME} && echo "directory created!" || {
      echo "unknown error occured - check permissions!"
      return 1
    }
  }
  echo -en "description? \033[1;31m"
  read DESCRIPTION
  echo -en "\033[0m"
  [ -z "${DESCRIPTION}" ] && {
    echo "no description given!"
    DESCRIPTION="no_description"
  } || DESCRIPTION=`echo ${DESCRIPTION} | sed 's/ /_/g'`
  echo -en "saving \033[1;31m${NAME}\033[0m - "
  cp ~/.adom.data/savedg/${NAME}.svg ~/.adom.data/savedg/${NAME}/`date +%s`-${DESCRIPTION} && echo "saved!" || echo "unknown error occured - check permissions!"
}
################################################################################
function save() {
  cd ~/.adom.data/savedg 2>/dev/null && {
    LISTA=`ls *.svg 2>/dev/null | sed 's/.svg^*$//'`
    AMOUNT=`echo ${LISTA} | wc | awk '{print $2}'`
    case $AMOUNT in
      0)
        echo "no saved games!"
	;;
      1)
        _save ${LISTA}
	;;
      *)
	SAVE_WHO=`choose ${LISTA}`
	[ -z ${SAVE_WHO} ] && echo -e "\033[1;31mcancelled\033[0m!" || _save ${SAVE_WHO}
	;;    
    esac
  } || {
    echo "~/.adom.data/savedg - no such dir!"
  }
}
################################################################################
while getopts ":lsSLhkcx" OPTION
do
  case ${OPTION} in
    l)
      load
      ;;
    s)
      save
      ;;
    L)
      quickload
      ;;
    S)
      quicksave
      ;;
    h)
      help
      ;;
    k)
      killadom
      ;;
    c)
      laskuri
      ;;
    x)
      YEAR=`date +%Y`
      echo -n "password? "
      su --command="date --set=\"7/2/${YEAR}\" &>/dev/null" 2>/dev/null && echo "done!" || echo "failed!"
      ;;
    *)
      echo "invalid option!"
      ;;
  esac
done
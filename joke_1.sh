#!/bin/bash

#!/bin/bash
set -u
DEBUG=1

# This funcion allow to declare enum "types", I guess
enum() {
	# skip index ???
	shift
	AA=${@##*\{} # get string strip after {
	AA=${AA%\}*} # get string strip before }
	AA=${AA//,/} # delete commaa
	((DEBUG)) && echo $AA
	local I=0
	for A in $AA; do
		eval "$A=$I"
		((I++))
	done
}

### Main program
# Just declare enum as you need
enum index { OK, CANCEL, ERROR, CONFIRM, SAVE, EXIT }
# Print value of enumerated items
echo "OK = $OK;"
echo "CANCEL = $CANCEL;"
echo "ERROR = $ERROR;"
echo "CONFIRM = $CONFIRM;"
echo "SAVE = $SAVE;"
echo "EXIT = $EXIT;"

# Use enumerated index in program
echo ${ENUM[@]}
echo "PLEASE CHOSE: "
read -s I
case $I in
$OK)
	echo "Process here when index is OK"
	;;
$CANCEL)
	echo "Process here when index is CANCEL"
	;;
$ERROR)
	echo "Process here when index is ERROR"
	;;
$CONFIRM)
	echo "Process here when index is CONFIRM"
	;;
$SAVE)
	echo "Process here when index is SAVE"
	;;
$EXIT)
	echo "Process here when index is EXIT"
	;;
esac

exit 0

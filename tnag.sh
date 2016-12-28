#!/bin/bash

help(){
	
	# Essentially functions for nice formatting
	if [[ "$TERM" == "dumb" ]] ; then
		# Not running in a Terminal (like bsshp or cron)
		bold=""
		normal=""
	else
		# Interactive
		bold=`tput bold`
		normal=`tput sgr0`
	fi
	
	echo -e ""
	# General Description
	echo -e "DESCRIPTION: "
	echo -e ""
	echo -e "\t${bold}tnag.sh${normal} Handler script for telegram_nagios.py"
	echo -e ""
	# Parsable Options
	echo -e "SETTINGS:"
	echo -e ""
	echo -e "\t${bold}-t${normal}\t\tToken"
	echo -e "\t${bold}-o${normal}\t\tObject Type"
	echo -e "\t${bold}-c${normal}\t\tTelegram Contact Number"
	echo -e "\t${bold}-n${normal}\t\tNotification Type"
	echo -e "\t${bold}-s${normal}\t\tHost State"
	echo -e "\t${bold}-m${normal}\t\tHostname"
	echo -e "\t${bold}-a${normal}\t\tHost Address"
	echo -e "\t${bold}-b${normal}\t\tService State"
	echo -e "\t${bold}-d${normal}\t\tService Description"
	echo -e "\t${bold}-p${normal}\t\tOutput"
	echo -e "\t${bold}-D${normal}\t\tSet Debug Mode"
	echo -e "\t${bold}-h${normal}\t\tThis Help Message"
	echo -e ""
}


while getopts "t:o:c:n:s:m:a:b:d:p:Dh" OPTIONS ; do
	case $OPTIONS in
		t) token=${OPTARG} ;;
		o) object_type=${OPTARG} ;;
		c) telegram_contact=${OPTARG} ;;
		n) notification_type=${OPTARG} ;;
		s) host_state=${OPTARG} ;;
		m) host_name=${OPTARG} ;;
		a) host_address=${OPTARG} ;;
		b) service_state=${OPTARG} ;;
		d) service_description=${OPTARG} ;;
		p) output=${OPTARG} ;;
		D) set -x ;;
		h) help; exit 0 ;;
	esac
done

python_arg_string=""

if [[ -z ${token} ]] ; then
	# What Ubuntu Release to Use
	echo -e "Error: No Token Given"
	exit 1
else
	python_arg_string="${python_arg_string} -t \"${token}\" "
fi

if [[ -z ${object_type} ]] ; then
	# What Ubuntu Release to Use
	echo -e "Error: Object Type"
	exit 1
else
	python_arg_string="${python_arg_string} -o \"${object_type}\" "
fi

if [[ -z ${telegram_contact} ]] ; then
	# What Ubuntu Release to Use
	echo -e "Error: No Telegram Contact Given"
	exit 1
else
	python_arg_string="${python_arg_string} --contact \"${telegram_contact}\" "
fi

if [[ -z ${notification_type} ]] ; then
	# What Ubuntu Release to Use
	echo -e "Error: No notification type given"
	exit 1
else
	python_arg_string="${python_arg_string} --notificationtype \"${notification_type}\" "
fi

if [[ -z ${host_state} ]] ; then
	# What Ubuntu Release to Use
	#echo -e "Error: No host state given."
	#exit 1
	true
else
	python_arg_string="${python_arg_string} --hoststate \"${host_state}\" "
fi

if [[ -z ${host_name} ]] ; then
	# What Ubuntu Release to Use
	echo -e "Error: No host name given"
	exit 1
else
	python_arg_string="${python_arg_string} --hostname \"${host_name}\" "
fi

if [[ -z ${host_address} ]] ; then
	# What Ubuntu Release to Use
	#echo -e "Error: No host address given"
	#exit 1
	true
else
	python_arg_string="${python_arg_string} --hostaddress \"${host_address}\" "
fi

if [[ -z ${service_state} ]] ; then
	# What Ubuntu Release to Use
	#echo -e "Error: No service state given"
	#exit 1
	true
else
	python_arg_string="${python_arg_string} --servicestate \"${service_state}\" "
fi

if [[ -z ${service_description} ]] ; then
	# What Ubuntu Release to Use
	#echo -e "Error: No service description given"
	#exit 1
	true
else
	python_arg_string="${python_arg_string} --servicedesc \"${service_description}\" "
fi

if [[ -z ${output} ]] ; then
	# What Ubuntu Release to Use
	echo -e "Error: No output given"
	exit 1
else
	python_arg_string="${python_arg_string} --output \"${output}\" "
fi

RUN_LOC="/opt/telegram_nagios"


pushd ${RUN_LOC} &> /dev/null
source ${RUN_LOC}/bin/activate

# Run passing the flags you gave me
command="${RUN_LOC}/telegram_nagios.py ${python_arg_string}"

eval "${command}"

deactivate
popd &> /dev/null




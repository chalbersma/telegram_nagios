## Setup 

* Setup PIP Stuff

```
installdir="/opt/telegram_nagios"
pushd ${installdir}
rm -rf venv
PIPREQPKGS="twx"
virtualenv --no-site-packages -p python3 ${installdir}
source ./bin/activate
for pippkg in ${PIPREQPKGS} ; do
	pip install ${pippkg}
done
popd
```

## Usage

[guide](https://pommi.nethuis.nl/nagios-notifications-via-telegram/)

## Commands

* Add notification Commands :

```
define command {
	command_name     notify-host-by-telegram
	command_line     /opt/telegram_nagios/tnag.sh --token $yertoken --object_type host --contact "$CONTACTPAGER$" --notificationtype "$NOTIFICATIONTYPE$" --hoststate "$HOSTSTATE$" --hostname "$HOSTNAME$" --hostaddress "$HOSTADDRESS$" --output "$HOSTOUTPUT$"
}

define command {
	command_name     notify-service-by-telegram
	command_line     /opt/telegram_nagios/tnag.sh --token $yertoken --object_type service --contact "$CONTACTPAGER$" --notificationtype "$NOTIFICATIONTYPE$" --servicestate "$SERVICESTATE$" --hostname "$HOSTNAME$" --servicedesc "$SERVICEDESC$" --output "$SERVICEOUTPUT$"
}
```

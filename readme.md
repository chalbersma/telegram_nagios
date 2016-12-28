## Setup 

* Setup PIP Stuff

```
installdir="/opt/telegram_nagios"
mkdir -p ${installdir}
PIPREQPKGS="python3 twx"
pip install twx
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

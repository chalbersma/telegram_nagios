## Setup 

* Setup PIP Stuff

```
installdir="/opt/telegram_nagios"
mkdir -p ${installdir}
PIPREQPKGS="python3 twx.botapi"
pushd ${installdir}
rm -rf venv
virtualenv --system-site-packages -p python3 ${installdir}
source ${installdir}/activate
for pippkg in ${PIPREQPKGS} ; do
	pip install ${pippkg}
done
popd
```

## Usage

[guide](https://pommi.nethuis.nl/nagios-notifications-via-telegram/)

## Commands

```
define command {
  command_name     notify-host-by-telegram
  command_line     /usr/local/bin/telegram_nagios.py --token 200194008:AAEG6djWC9FENEZaVIo3y3vZm24P3GTMetw --object_type host --contact "$CONTACTPAGER$" --notificationtype "$NOTIFICATIONTYPE$" --hoststate "$HOSTSTATE$" --hostname "$HOSTNAME$" --hostaddress "$HOSTADDRESS$" --output "$HOSTOUTPUT$"
}
define command {
  command_name     notify-service-by-telegram
  command_line     /usr/local/bin/telegram_nagios.py --token 200194008:AAEG6djWC9FENEZaVIo3y3vZm24P3GTMetw --object_type service --contact "$CONTACTPAGER$" --notificationtype "$NOTIFICATIONTYPE$" --servicestate "$SERVICESTATE$" --hostname "$HOSTNAME$" --servicedesc "$SERVICEDESC$" --output "$SERVICEOUTPUT$"
}

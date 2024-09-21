import dbus

bus = dbus.SystemBus()
upower = bus.get_object('org.freedesktop.UPower', '/org/freedesktop/UPower')

devPaths = dbus.Interface(upower, 'org.freedesktop.UPower').EnumerateDevices()
result = {}
for devPath in devPaths:
    dev = bus.get_object('org.freedesktop.UPower', devPath)
    devProps = dbus.Interface(dev, 'org.freedesktop.DBus.Properties') \
          .GetAll('org.freedesktop.UPower.Device')
    if 2 == devProps['Type']:
        result[devProps['NativePath']] = {
            'percentage': devProps['Percentage'],
            'rate': devProps['EnergyRate'],
            'hoursLeft': devProps['TimeToEmpty'] / 3600
        }

# import json
# print(json.dumps(result))

if 'BAT0' in result:
    print(f"  {result['BAT0']['rate']:.1f}w   ")


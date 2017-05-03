#!/bin/bash
/bin/grep -E 'Handlers' /proc/bus/input/devices | /bin/grep -E 'mouse0' | /bin/grep -Eo 'event[0-9]+' > /tmp/mouse_event
if [ -s "/tmp/mouse_event" ]
then
sed -i -e "s/event1/$(sed 's:/:\\/:g' /tmp/mouse_event)/" /etc/X11/xorg.conf.d/10-input.conf
fi

/bin/grep -E 'Handlers|EV=' /proc/bus/input/devices | /bin/grep -B1 'EV=1[02]001[3Ff]' | /bin/grep -Eo 'event[0-9]+' > /tmp/keyboard_event
if [ -s "/tmp/keyboard_event" ]
then
sed -i -e "s/event2/$(sed 's:/:\\/:g' /tmp/keyboard_event)/" /etc/X11/xorg.conf.d/10-input.conf
fi
startx

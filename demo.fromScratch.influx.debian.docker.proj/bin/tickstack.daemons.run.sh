# Listening on HTTP" log_id=0bHp9wwW000 service=httpd addr=[::]:8086 https=false
/usr/lib/influxdb/scripts/influxd-systemd-start.sh 2>> /var/log/influxdb.log >> /var/log/influxdb.log &

rm -f /var/run/telegraf/telegraf.pid
/etc/init.d/telegraf restart &

#/etc/init.d/kapacitor restart &

# Serving chronograf at http://[::]:8888" component=server
#/usr/bin/chronograf 2>> /var/log/chronograf.log >> /var/log/chronograf.log &

# show databases
# use telegraf
# tail -f /var/log/influxdb.log
# select * from "system" where time >= now() -55s

# docker run -it -p 8086:8086 influxdb /bin/bash
# curl -XPOST 'http://localhost:8086/query' --data-urlencode 'q=CREATE DATABASE "myTempDb"'

# docker commit ..


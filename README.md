# xtslack_notify
Slack notifications for xTuple ERP

Example of using PostgreSQL's  pg_notify facility for sending messages to a Slack channel via triggers and a node.js listener.

### Possible install:
```
mkdir /opt/xtuple/xtslack_notify
cp xtslack_notify.js /opt/xtuple/xtslack_notify
cp package.json /opt/xtuple/xtslack_notify
cd /opt/xtuple/xtslack_notify
npm install
```

### Edit start-script/xtslack_notify.conf file and put it in /etc/init
```
cp start-script/xtslack_notify.conf /etc/init/xtslack_notify.conf
```

### Run:
```
service xtslact_notify start
```





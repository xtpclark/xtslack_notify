Possible install:

mkdir /opt/xtuple/xtslack_notify
cp xtslack_notify.js /opt/xtuple/xtslack_notify
cp package.json /opt/xtuple/xtslack_notify

cd /opt/xtuple/xtslack_notify
npm install

Edit start-script/xtslack_notify.conf file and put it in /etc/init

Run:
service xtslact_notify start



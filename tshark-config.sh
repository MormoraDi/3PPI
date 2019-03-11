#!/bin/bash

touch /etc/systemd/system/tshark.service

echo "[Unit]" >> /etc/systemd/system/tshark.service
echo "Description=Tshark service" >> /etc/systemd/system/tshark.service
echo "After=network.target" >> /etc/systemd/system/tshark.service

echo "[Service]" >> /etc/systemd/system/tshark.service
echo "ExecStart=/bin/bash /script/tshark.sh" >> /etc/systemd/system/tshark.service
echo "Restart=always" >> /etc/systemd/system/tshark.service
echo "RestartSec=5" >> /etc/systemd/system/tshark.service

echo "[Install]" >> /etc/systemd/system/tshark.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/tshark.service

mkdir /script
touch /script/tshark.sh

echo "#!/bin/bash" >> /script/tshark.sh
echo "tshark -c 200 -w /script/capture.pcap" >> /script/tshark.sh
echo "sleep 15" >> /script/tshark.sh

chmod 755 /script/tshark.sh

systemctl enable tshark.service
systemctl start tshark.service

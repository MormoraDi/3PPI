#!/bin/bash
# Script created by A. Mammadov #
# Edits by J.E. Haavie#


# Create an empty file to use as the service
touch /etc/systemd/system/tshark.service

# Write the code that configures the service to the created file
echo "[Unit]" >> /etc/systemd/system/tshark.service
echo "Description=Tshark service" >> /etc/systemd/system/tshark.service
echo "After=network.target" >> /etc/systemd/system/tshark.service

echo "[Service]" >> /etc/systemd/system/tshark.service
echo "ExecStart=/bin/bash /script/tshark.sh" >> /etc/systemd/system/tshark.service
echo "Restart=always" >> /etc/systemd/system/tshark.service
echo "RestartSec=5" >> /etc/systemd/system/tshark.service

echo "[Install]" >> /etc/systemd/system/tshark.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/tshark.service

# Create directory and shell script file
mkdir /script
touch /script/tshark.sh

# Write the intended code to the script
echo "#!/bin/bash" >> /script/tshark.sh
echo "tshark -c 200 -w /script/capture.pcap" >> /script/tshark.sh #This line can be edited to change tshark parameters
echo "sleep 15" >> /script/tshark.sh

# Make script executable
chmod 755 /script/tshark.sh

# Enable and start created service
systemctl enable tshark.service
systemctl start tshark.service

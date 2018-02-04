#!/bin/sh
wget --no-check-certificate https://raw.githubusercontent.com/mixool/rinetd/master/rinetd_bbr_powered -O /root/rinetd
chmod +x rinetd
echo　"
0.0.0.0 22 0.0.0.0 22
0.0.0.0 80 0.0.0.0 80
0.0.0.0 8080 0.0.0.0 8080
0.0.0.0 443 0.0.0.0 443" > rinetd.conf
echo "
[Unit]
Description=rinetd

[Service]
ExecStart=/root/rinetd -f -c /root/rinetd.conf raw venet0:0
Restart=always
  
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/rinetd.service
systemctl enable rinetd.service && systemctl start rinetd.service

cat <<EOF | sudo tee /etc/systemd/system/puma.service > /dev/null
[Unit]
Description=Puma
After=network.target

[Service]
Type=simple
WorkingDirectory=/opt/monolith/reddit
ExecStart=/usr/local/bin/puma
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Запуск Puma и включение в автозапуск
sudo systemctl daemon-reload
sudo systemctl start puma
sudo systemctl enable puma

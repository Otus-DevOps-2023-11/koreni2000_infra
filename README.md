# koreni2000_infra
koreni2000 Infra repository

Подключение в одну команду к someinternalhost:
    ssh -i ~/.ssh/yacloud -A -J koreni@51.250.76.167 koreni@10.128.0.21

Доп. задание:
чтобы подключаться командой вида ssh someinternalhost, необходмо внести следующие изменения в файл ~/.ssh/config
    Host bastion-host
        Hostname 51.250.76.167
        User koreni
        IdentityFile ~/.ssh/yacloud

    Host someinternalhost
        Hostname 10.128.0.21
        User koreni
        ProxyCommand ssh -q -W %h:%p bastion-host

OpenVPN:
    bastion_IP = 51.250.76.167
    someinternalhost_IP = 10.128.0.21

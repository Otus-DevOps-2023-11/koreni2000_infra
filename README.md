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

APP:
    testapp_IP = 62.84.115.89
    testapp_port = 9292

cloud-init:
    yc compute instance create \
        --name reddit-app-1 \
        --hostname reddit-app-1 \
        --memory=4 \
        --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
        --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
        --metadata-from-file user-data=/Users/koreni/DevOps/OTUS/l004/koreni2000_infra/cloud-init.yml \
        --metadata serial-port-enable=1

packer-base:
  Добавлен bake-образ, файлы с переменными и используется параметризация для packer. В папке files добавлены скрипты для создания systemd unit и билда приложения.
  В папке config-scripts добавлены файлы для создания ВМ и файл cloud-init-create-reddit.yml в котором передаются данные пользователя на ВМ машину.

terraform:
    Добавлено создание 2 ВМ и балансировщика, в ходе развертывания добавляются IP адреса хостов для работы баласировщика и healthcheck для проверки доступности. В случае ручного добавляения хода для хостов все работает но затрудняется управление и внесение правок. Добавлен в output.tf адрес балансировщика.

    Добвлено стукутированное разделение на 2 окружения prod/stage, вынесен файл terraform.tfstate для совместного доступа в корзину. Добавлены файлы для раздельного развертывания сервера с приложением и сервера с базой данных.

ansible:
    ansible app -m command -a 'rm -rf ~/reddit' - удаляет в домашней папке reddit, и после запуска происходит выполнение клонирования репозитория

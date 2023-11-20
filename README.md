# gruzdevnn_infra
gruzdevnn Infra repository

    bastion_IP = 158.160.127.47
    someinternalhost_IP = 10.128.0.28

# cloud-bastion

# cloud-testapp

    testapp_IP = 62.84.114.200
    testapp_port = 9292

# command for run instance YC

    yc compute instance create \
      --name reddit-app3 \
      --hostname reddit-app3 \
      --memory=4 \
      --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
      --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
      --metadata-from-file user-data=Startup.yaml \
      --metadata serial-port-enable=1

# Ansible-1

После выполнения команды:

    ansible-playbook clone.yml

Терминал показал: ok=2 changed=0, так как изменения уже были произведены предыдущей командой, Ansible просто проверил сооветсивие состояния системы плейбуку.
После выполнения команды:

    ansible app -m command -a 'rm -rf ~/reddit'

Состояние системы изменилось и Ansible выполнил действия (клонирование), поэтому в терминале было: ok=2 changed=1

# Ansible-2

Проблемы, которые возникли:

1. Не скачивались файлы с git, добавил блок для установки git

    - name: Install git
      become : true
      apt:
        name: git
        state: present
        update_cache: yes

2. Ошибка:

    failed to handshake

Обновил файл config.pkr.hcl

3. Ошиибка:

    FAILED! => {"msg": "failed to transfer file to...

Добавил блок в provisioners:

            "extra_arguments": [
            "--scp-extra-args", "'-O'",
        ]

4. Ошибка с доступом к репозиторию mongodb. Обновил ключ:

    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927

Проверил, что новый ключ рабочий по ссылке:

    http://keyserver.ubuntu.com/

# Ansible-3

Была проблема с прохождением тестов, она решилась добавлением блока в файл ansible.cfg

    [galaxy]
    server = https://old-galaxy.ansible.com/

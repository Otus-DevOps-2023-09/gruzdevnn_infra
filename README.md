# gruzdevnn_infra
gruzdevnn Infra repository

    bastion_IP = 158.160.127.47
    someinternalhost_IP = 10.128.0.28

#cloud-bastion
#Подключение в одну строку через бастион:
#
#ssh -J engineer@158.160.127.47 engineer@10.128.0.28 -i ~/.ssh/engineer2
#
#(engineer2 - приветный ключ от someinternalhost)
#
#Подключение через алиасы:
#
#Открываем vim ~/.ssh/config на локальной машине (Ubuntu 23)
#
#Host bastion
#    HostName 158.160.127.47
#    User engineer
#
#Host someinternalhost
#    HostName 10.128.0.28
#    User engineer
#    ProxyJump bastion
#    IdentityFIle ~/.ssh/engineer2
#
#Потом заходим ssh someinternalhost
#
#После подключения vpn смог зайти через Putty на Windows, используя переделанный в Puttygen сертификат
#на внутренний адрес 10.128.0.28
#Если нужно как-то иначе пробовать зайти, могу попытаться настроить

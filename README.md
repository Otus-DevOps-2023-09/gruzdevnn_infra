# gruzdevnn_infra
gruzdevnn Infra repository

    bastion_IP = 158.160.127.47
    someinternalhost_IP = 10.128.0.28

#cloud-bastion
#����������� � ���� ������ ����� �������:
#
#ssh -J engineer@158.160.127.47 engineer@10.128.0.28 -i ~/.ssh/engineer2
#
#(engineer2 - ��������� ���� �� someinternalhost)
#
#����������� ����� ������:
#
#��������� vim ~/.ssh/config �� ��������� ������ (Ubuntu 23)
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
#����� ������� ssh someinternalhost
#
#����� ����������� vpn ���� ����� ����� Putty �� Windows, ��������� ������������ � Puttygen ����������
#�� ���������� ����� 10.128.0.28
#���� ����� ���-�� ����� ��������� �����, ���� ���������� ���������

# mikhail-korneev_infra
mikhail-korneev Infra repository

# bastion-host
Предварительно добавляем ssh-ключ в ssh-agent:
```
> ssh-add ~/.ssh/yc_otus
> ssh-add -L
```
## Подключение через bastion-host: последовательный способ
Последовательно подключаемся сначала к `bastion-host` c SSH Agent Forwarding (`-A`), потом к `internal-host`:
```
> ssh -i ~/.ssh/yc_otus -A yc_otus@84.201.172.75
> hostname
bastion
> ssh 10.128.0.15
> hostname
someinternalhost
```
## Подключение через bastion-host: в одну команду
Предыдущий вариант, только в одну команду, и все равно не очень удобный:
```
> ssh -i yc_otus -A yc_otus@84.201.172.75 ssh 10.128.0.15
> hostname
someinternalhost
```
## Подключение через bastion-host: удобный способ в одну команду
Предварительно настраиваем `~/.ssh/config`, результат:
```
> cat ~/.ssh/config

Host bastion-host
  HostName 84.201.172.75
  User yc_otus
  IdentityFile ~/.ssh/yc_otus
  IdentitiesOnly yes
  ForwardAgent yes

Host internal-host
  HostName 10.128.0.15
  User yc_otus
  ProxyCommand ssh bastion-host -W %h:%p
```
Подключиться к `internal-host` теперь можно явно не указывая `bastion-host` в одну команду:
```
> ssh internal-host
> hostname
someinternalhost
```

# VPN
```
bastion_IP = 62.84.119.21
someinternalhost_IP = 10.128.0.15
```

# Deploy TestApp
```
testapp_IP = 51.250.8.27
testapp_port = 9292
```

# Packer
В результате работы сделано:
1. Установлен Packer.
2. Создан и сконфигурирован сервисный аккаунт в YC для Packer, создан IAM key.
3. Подготовлен файл-шаблон Packer, включая параметризацию значений.
4. На основе файла-шаблона собран образ VM.
5. На основе образа развернута VM, приложение reddit-app проверено на запуск.

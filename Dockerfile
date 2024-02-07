# Установка git
RUN apk add --no-cache git

# Клонирование репозитория с файлами конфигурации
RUN git clone https://github.com/ваш-пользователь/ваш-репозиторий.git /tmp/config

# Копирование файлов конфигурации из временного каталога внутрь контейнера
COPY /tmp/config/ipsec.conf /etc/ipsec.conf
COPY /tmp/config/ipsec.secrets /etc/ipsec.secrets
COPY /tmp/config/entrypoint.sh /entrypoint.sh

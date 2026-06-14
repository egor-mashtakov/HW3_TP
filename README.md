# Домашняя работа 3
#### Выполнил Егор Маштаков ББИ2505
 
## Запуск проекта
 
```bash
chmod +x run.sh
 
./run.sh build_generator   # собрать образ генератора
./run.sh run_generator     # сгенерировать data.csv
 
./run.sh build_reporter    # собрать образ репортёра
./run.sh run_reporter      # сгенерировать report.html
 
./run.sh report_server     # запустить веб-сервер
```
 
## Как открыть отчёт в браузере

Cкопируйте репозиторий в ваше пространство Codespaces, затем выполните все команды выше, затем откройте в браузере:
 
```
https://<your-codespace-name>-8080.app.github.dev/report.html
```
 
## Вспомогательные команды
 
```bash
./run.sh structure          # структура файлов проекта
./run.sh clear_data         # удалить data.csv и report.html
./run.sh create_local_data  # создать data.csv локально в local_data/
./run.sh inside_generator   # показать содержимое /data изнутри контейнера генератора
./run.sh inside_reporter    # показать содержимое /data изнутри контейнера репортёра
```
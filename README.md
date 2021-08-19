Cбилдить докер

    docker build .
    docker build -t [myImageName] .

Посмотреть образы докера и их id

    docker image ls
    docker images

Этой командой можно запустить скачать образ докера

    docker pull node


Запустить контейнер

    docker run [id образа]

чтобы запустить интерактивно образ

    docker run -it node (или id образа)

    docker ps // покажет список контейнеров

    docker ps -a  // показывает все контейнеры смотри хелп по команде

    docker rm [id конетйнера]

    docker container prune // удалить все неиспользуемые контейнеры


Удалить image

    docker image rmi [id] --forse (-f)
    docker image prune

для образов docker hub node


После того как написал конфиг нужно сбилдить

    docker build .
    docker build -t gordondalos:volumes .

точка означает что смотреть нужно там где докер лежит, то есть
докерфайл лежит в этой же директории в которой нужно запускать
-t означает что имедж будет называться гордондалос а тег volumes

После того как сбилдили нужно этот контейнер запускать
для этого посмотрим что есть за имеджи

    docker images

и запускаем имедж

    docker run [image-id]
    docker run -d -p 3000:3000 --rm --name ["my name for container"] [image-id]
    docker run -d -p 3000:3000 --rm --name [myName]:latest [image-id]
    docker run -d -p 3000:80 -e PORT=80 -e NODE_ENV=development --rm --name [myName]:latest [image-id]
    docker run -d -p 3000:80 -env-file ./.env --rm --name [myName]:latest [image-id]
    docker run -d -p 3000:80 -v data:/app/src/logs --rm --name [myName]:latest [image-id]

так можно запустить контейнер причем внутренний порт докера будет
замаплен на порт на машине где запущен докер, первый порт этот
тот который запущен на рельной машине, второй это внутри контейнера
-p означает что это порт
-d означает что это detach то есть отпустить консоль после запуска
-- name принимает имя чтобы потом можно было к нему обращаться и запускать или
останавливать
если дописать еще --rm то сразу после остановке контейнер удалится
если указать :latest то возьмется контейнер с тегом латест, но можно задать и другие теги
например так можно разделить прод и дев
-e задаем переменные для окружения
-env-file - можно указать файл с конфигурацией и там все переменные окружения
-v data:/app/src/logs Означает поищи вольюмы в папке /app/src/logs и при этом этот вольюм будет называться data



далее смотрим какие контейнеры запущены

    docker ps

остановить можно

    docker stop CONTAINER_ID

можно запустить сбилженый контейнер в фоновом режиме

    docker start CONTAINER_ID


подключить к контейнеру в консоли

    docker attach [id_конейнера]
    docker stop [id_конейнера]
    docker logs [id_конейнера] // это покажет все что выводилось в контейнере в логи

залогиниться в докерхабе

    docker login
    docker push [login в докерхаб]/[название репозитория]

переименовать надо если чтобы тег совпадал

    docker tag latest gordondalos/myRepo

посмотреть на volume

    docker volume ls

в нашем случае именованный volume будет называться data если мы запускали такую команду как выше

         docker run -d -p 3000:80 -v data:/app/src/logs --rm --name [myName]:latest [image-id]

также volume можно создавать заранее

        docker create volume MyvolumeName

и потом указав путь в докер файле его использовать

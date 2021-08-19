# Common build stage взять из имеджа которая называется нода
FROM node:14.14.0-alpine3.12 as common-build-stage

# взять все из текущей директории и положить в папку app
COPY . ./app

# говорим что наша директория app
WORKDIR /app

# так он закеширует этот файл и при сборке будет брать его из кеша
COPY package.json /app

# устанавливаем пакеты npm, ран используется только в момент установки
RUN npm install

# этой командой указываем на каком порту показывать
EXPOSE 3000

# Запускаем дев сборку
FROM common-build-stage as development-build-stage

# устанавливаем девелоп окружение
ENV NODE_ENV development

# запускаем наше приложение в дев режиме
CMD ["npm", "run", "dev"]

# запускаем прод сборку
FROM common-build-stage as production-build-stage

# Запускаем сборку прода
ENV NODE_ENV production

# так выполняется команды командной строки
CMD ["npm", "run", "start"]

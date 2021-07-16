# base image
FROM node:16.5.0-alpine3.11

# 빌드된 산출물을 실행시키기 위해 필요한 serve 모듈
RUN npm install -g serve

# set working directory
RUN mkdir /app
WORKDIR /app

# app dependencies, install 및 caching
RUN mkdir ./build
COPY ./build ./build

# Port 설정
EXPOSE 5000:5000

# 앱 실행
ENTRYPOINT [ "serve", "-s", "build"]
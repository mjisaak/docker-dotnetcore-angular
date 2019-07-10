FROM mcr.microsoft.com/dotnet/core/sdk:2.2-alpine3.9

LABEL maintainer="martin.brandl@whiteduck.de" \
org.label-schema.vcs-url="https://github.com/mjisaak/docker-dotnetcore-angular"

RUN apk update && apk add --update --no-cache nodejs-current nodejs-npm python make g++ \
&& npm install -g npm \
&& npm install -g node-sass --force --unsafe-perm=true --allow-root \
&& npm install -g @angular/cli

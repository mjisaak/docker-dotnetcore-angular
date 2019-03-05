FROM microsoft/dotnet:2.2-sdk
RUN apt-get update -yq && apt-get upgrade -yq && apt-get install -yq curl git nano
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -yq nodejs build-essential
RUN npm install -g npm
RUN npm install -g node-sass --force --unsafe-perm=true --allow-root
RUN npm install -g @angular/cli

  
FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
ENV TZ=Asia/Ho_Chi_Minh LANG=C.UTF-8

RUN curl -L https://github.com/golang-migrate/migrate/releases/download/v4.7.0/migrate.linux-amd64.tar.gz | tar xvz
RUN cp migrate.linux-amd64 /usr/local/bin/migrate

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install yarn

WORKDIR /usr/src/app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
COPY . /usr/src/app
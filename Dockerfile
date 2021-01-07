FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
ENV TZ=Asia/Tokyo LANG=C.UTF-8

RUN curl -L https://github.com/golang-migrate/migrate/releases/download/v4.7.0/migrate.linux-amd64.tar.gz | tar xvz
RUN cp migrate.linux-amd64 /usr/local/bin/migrate

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install yarn

WORKDIR /usr/src/app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

ENV RAILS_ENV production 
ENV RACK_ENV production

COPY . /usr/src/app

RUN bundle exec rake SECRET_KEY_BASE=d140269c106b6d064cdd670a5aace0bbbb1400de545377a47836dbdab8104f2fdf0ab87e6b7982819d1bcc2ccf6a5f093985a0895970f01f30b0b15378a090e9 assets:precompile

FROM ruby:2.6.1

RUN apt-get update -qq && apt-get install && apt-get install libv8-dev -y
RUN apt install openjdk-8-jre-headless -y

WORKDIR /app

COPY . /app
RUN gem install bundler
RUN apt install netcat -y 
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install nodejs -y
RUN bundle install
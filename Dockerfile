FROM ruby:2.5.3
ENV LANG C.UTF-8
ADD ./src /sinatra
WORKDIR /sinatra
RUN gem install bundler
RUN bundle install
EXPOSE 4567

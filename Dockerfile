FROM ruby:2.5.3
ENV LANG C.UTF-8
RUN mkdir /sinatra
WORKDIR /sinatra
ADD ./sinatra/Gemfile /sinatra/Gemfile
ADD ./sinatra/Gemfile.lock /sinatra/Gemfile.lock
RUN bundle install
ADD ./sinatra /sinatra
EXPOSE 4567

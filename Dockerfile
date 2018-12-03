FROM ruby:latest
RUN mkdir application

WORKDIR application
ADD Gemfile.lock .
ADD Gemfile .
RUN gem install bundler && bundle install
ADD . ./


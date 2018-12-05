FROM ruby:latest

### System Libraries
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs


### Install Application
RUN mkdir application
WORKDIR application.

RUN git clone git@idms-git.oit.duke.edu:da129/openshift-hello-world.git
RUN gem install bundler && bundle install
ADD . ./

EXPOSE 3000/tcp
CMD rails server -p 3000 -b '0.0.0.0'

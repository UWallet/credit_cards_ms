FROM ruby:2.3
RUN mkdir /credit-cards-ms
WORKDIR /credit-cards-ms
ADD Gemfile /credit-cards-ms/Gemfile
ADD Gemfile.lock /credit-cards-ms/Gemfile.lock
RUN bundle install
ADD . /credit-cards-ms

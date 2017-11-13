FROM ruby:2.3
RUN mkdir /credit-cards-ms
WORKDIR /credit_cards-ms
ADD Gemfile /credit_cards-ms/Gemfile
ADD Gemfile.lock /credit_cards-ms/Gemfile.lock
RUN bundle install
ADD . /credit-cards-ms

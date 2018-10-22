FROM ruby:2.5-alpine

RUN apk update && apk add build-base nodejs postgresql-dev bash
RUN mkdir -p /app
WORKDIR /app

# COPY Gemfile Gemfile.lock ./
COPY Gemfile ./

RUN bundle install --binstubs

COPY . .

CMD rails s

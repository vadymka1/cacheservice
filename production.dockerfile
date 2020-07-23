FROM ruby:latest

RUN gem install bundler

WORKDIR /usr/src/app

COPY . .

RUN bundle install

EXPOSE 3000

CMD ["puma", "config.ru", "-C", "puma.rb"]

FROM ruby:alpine

RUN apk add --no-cache \
    bash='>=4.0.0' \
    bash-completion='>=2.0' \
    util-linux='>=2.0' \
    coreutils='>=8.0' \
    binutils='>=2.0' \
    findutils='>=4.0' \
    grep='>3.0' \
    build-base='>=0.4' && \
    gem install bundler

# RUN gem install bundler

WORKDIR /usr/src/app

COPY . .

RUN bundle install

EXPOSE 3000

CMD ["puma", "config.ru", "-C", "puma.rb"]
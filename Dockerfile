FROM ruby:alpine

ENV PS1 "\u@\h \w>"
ENV RAILS_ENV production

RUN gem install bundler --no-document

RUN mkdir -p /var/www/htdocs

RUN apk add --quiet --no-cache --virtual .rundeps build-base postgresql-dev \
                                         git openssh-client \
                                         nodejs tzdata

WORKDIR /var/www/htdocs

COPY Gemfile /var/www/htdocs/Gemfile
COPY Gemfile.lock /var/www/htdocs/Gemfile.lock

RUN bundle config build.nokogiri --use-system-librarie && \
    bundle install --quiet --deployment --without development test

COPY . /var/www/htdocs

RUN bundle exec rake assets:precompile

EXPOSE 3000

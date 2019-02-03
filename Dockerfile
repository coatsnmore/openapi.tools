FROM ruby:2.5-alpine as jekyll-base

RUN apk add --no-cache build-base gcc bash cmake

EXPOSE 4000
WORKDIR /site

RUN gem install rake
RUN gem install jekyll
RUN gem install bundler
COPY Gemfile .
RUN bundle install

COPY workspace-entrypoint.sh /

# on every container start
ENTRYPOINT [ "bash", "workspace-entrypoint.sh" ]

# CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]
CMD bash
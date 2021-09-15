FROM ruby:3-alpine

RUN apk add build-base \
            postgresql-dev \
            tzdata \
            nodejs npm && \
    npm install --global yarn

COPY rails/Gemfile* /app/
COPY docker-entrypoint.sh /usr/local/bin/
WORKDIR /app
RUN bundle

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]

COPY rails /app/

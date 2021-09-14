FROM ruby:3-alpine

RUN apk add build-base \
            postgresql-dev \
            tzdata \
            nodejs npm && \
    npm install --global yarn

COPY Gemfile* /app/
WORKDIR /app
RUN bundle
COPY . /app/

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]

FROM ruby:3.2.2-alpine

RUN apk add --update --no-cache \
    build-base \
    postgresql-dev \
    postgresql-client \
    nodejs \
    tzdata \
    git

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
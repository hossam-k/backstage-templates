FROM ruby:${{ values.rubyVersion }}-slim AS base

WORKDIR /app

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev git curl && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock* ./
RUN bundle install --jobs 4 --retry 3

COPY . .

EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]

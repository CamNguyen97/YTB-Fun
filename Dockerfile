# Use a lightweight base image
FROM ruby:3.2.0

# Set environment variables
ENV RAILS_LOG_TO_STDOUT=true \
    RAILS_SERVE_STATIC_FILES=true

# Update package lists and install necessary packages
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    nodejs npm && \
    npm install -g yarn && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle config --local frozen 1 && \
    bundle install --jobs 20 --retry 5 --without development test && \
    rm -rf /usr/local/bundle/cache

# Copy the rest of the application code
COPY . .

# Install JavaScript dependencies
RUN yarn install --check-files --frozen-lockfile && \
    rm -rf node_modules/.cache/yarn

# Copy entrypoint script and set permissions
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["entrypoint.sh"]

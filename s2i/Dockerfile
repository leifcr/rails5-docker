FROM ruby:2.4
MAINTAINER leifcr@gmail.com

# Add https transport to apt
RUN apt-get update -qq && apt-get install -y apt-transport-https

# Install updated nodejs, yarn and build packages
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  libmysqlclient-dev \
  libxml2-dev \
  libxslt1-dev \
  mysql-client \
  wget \
  nodejs \
  yarn

# For staging and production env, duck-cli must be installed to be able to download refile assets
ENV APP_HOME /app

# If encoding errors occur, adjust locale.
ENV LANG C.UTF-8

# Create application folder
# Setup rails user group and rails user
# Set rails:rails as user on app folder
RUN mkdir $APP_HOME && \
    groupadd -g 1010 rails && \
    useradd --uid 1010 -s /bin/bash -m -d /home/rails -g 1010 rails && \
    chown 1010:0 $APP_HOME && \
    mkdir -p /home/rails/.ssh/ && \
    touch /home/rails/.ssh/known_hosts && \
    ssh-keyscan bitbucket.org >> /home/rails/.ssh/known_hosts && \
    ssh-keyscan github.org >> /home/rails/.ssh/known_hosts

COPY rails/* /usr/local/bin/

# Make entrypoint executable when building on Windows
# And backwards compatible entrypoint
RUN chmod +x /usr/local/bin/start.sh \
  && ln -s /usr/local/bin/start.sh /start.sh \
  && chmod +x /usr/local/bin/migrate-database.sh \
  && ln -s /usr/local/bin/migrate-database.sh /migrate-database.sh

# Copy docker entry point
# COPY docker-entrypoint.sh /usr/local/bin/

# Make entrypoint executable when building on Windows
# And backwards compatible entrypoint
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh && ln -s /usr/local/bin/docker-entrypoint.sh /docker-entrypoint.sh

# Continue as rails user - this should be done in end-app-image
USER 1010

# Set workdir to /app, so COPY, ADD, RUN and ENTRYPOINT is run within folder
WORKDIR $APP_HOME

ENV RAILS_ENV production

# Copy app
ONBUILD COPY . ./
# Install gems
ONBUILD RUN gem install bundler && bundle install --jobs 20 --retry 5 --without development:test && yarn install
# Disable skylight dev warning
ONBUILD RUN skylight disable_dev_warning
# Precompile assets
ONBUILD RUN rails assets:precompile

# Set entry point to bundle exec, as all cmd's with rails should be prepended
ENTRYPOINT ["start.sh"]
CMD ["rails", "server"]

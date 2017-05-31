# FROM phusion/passenger-ruby24:0.9.21
FROM phusion/passenger-full:0.9.21

LABEL maintainer leifcr@gmail.com
      # Location of the STI scripts inside the image.
LABEL io.openshift.s2i.scripts-url=image:///usr/local/bin/s2i \
      # DEPRECATED: This label will be kept here for backward compatibility.
      io.s2i.scripts-url=image:///usr/local/bin/s2i \
      summary="Platform for building and running Rails 5 with Ruby 2.4 on nginx/passenger, including extra packages" \
      io.k8s.description="Platform for building and running Rails 5 with Ruby 2.4 on nginx/passenger, including extra packages" \
      io.k8s.display-name="Ruby 2.4 (Rails 5) + Passenger/Nginx" \
      io.openshift.expose-services="80:http, 443:https" \
      io.openshift.tags="builder,ruby,ruby24,rails5,rails,passenger"
      # io.openshift.wants='postgresql'

# The $HOME is not set by default, but some applications needs this variable
ENV APP_HOME=/home/app \
    HOME=/home/app \
    STI_SCRIPTS_PATH=/usr/local/bin/s2i \
    RUBY_VERSION=2.4 \
    LANG=C.UTF-8 \
    RAILS_ENV=production

# Add https transport to apt
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get update -qq && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
    apt-get install -y apt-transport-https apt-utils

# For staging and production env, duck-cli must be installed to be able to download refile assets

# Install updated nodejs, yarn and build packages
# RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - \
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq && apt-get install -y \
  build-essential \
  libxslt1-dev \
  libxml2-dev \
  # libmysqlclient-dev \
  # mysql-client \
  libpq-dev \
  postgresql-client \
  wget \
  tar \
  unzip \
  rsync \
  lsb-release \
  sudo \
  yarn

# Cannot install duck, as it requires root on install
# See: https://trac.cyberduck.io/browser/trunk/setup/deb/duck.postinstall (need to submit ticket)
# RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FE7097963FEFBE72 \
#     && echo "deb https://s3.amazonaws.com/repo.deb.cyberduck.io stable main" | tee /etc/apt/sources.list.d/duck.list \
#     && apt-get update -qq && apt-get install -y duck

# Copy contrib
# COPY ./contrib/ $APP_HOME

# Install gems (Base gems used for most apps to save deployment time)
# Add Gemfile
COPY Gemfile Gemfile.lock package.json yarn.lock $APP_HOME/

RUN bash -lc 'rvm --default use ruby-2.4'

# Copy bin
COPY bin/ /usr/local/bin/
COPY s2i/bin $STI_SCRIPTS_PATH

# Nginx setup
COPY etc/nginx/sites-enabled/ /etc/nginx/sites-enabled/
RUN rm -f /etc/service/nginx/down && rm /etc/nginx/sites-enabled/default

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV HOME=/home/dockerfu
# Create special su user
RUN groupadd wheel && \
    useradd --uid 1010 -s /bin/bash -m -d /home/dockerfu -g wheel dockerfu -G rvm && \
    sed -i '/sufficient pam_wheel.so trust/s/^# //g' /etc/pam.d/su && \
    echo 'dockerfu	ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/dockerfu

# Continue as app user
WORKDIR $APP_HOME

# Install gems
RUN setuser app bundle install --deployment --jobs 20 --retry 5 && \
    setuser app yarn install && \
    setuser app node --version && \
    setuser app ruby --version

WORKDIR /

USER 1010

ENTRYPOINT ["container-entrypoint"]
# CMD ["usage"]
# CMD ["$STI_SCRIPTS_PATH/usage"]
# CMD ["/sbin/my_init"]
CMD ["/sbin/preinit"]

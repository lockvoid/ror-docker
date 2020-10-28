# == Stage: Prepare

FROM registry.access.redhat.com/ubi8/ubi:8.2 as base

# Setup defaults

ENV APP_ROOT="/srv/app"
ENV NODEJS_VERSION="12"
ENV RUBY_VERSION="2.6"
ENV GEM_HOME="/usr/local/bundle"
ENV PATH="$GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH"

# == Stage: Build

FROM base AS builder

# Install dependencies

RUN yum -y module enable ruby:${RUBY_VERSION} && \
    yum -y module enable nodejs:${NODEJS_VERSION} && \
    INSTALL_PKGS=" \
      automake \
      curl \
      gcc \
      gcc-c++ \
      git \
      libffi-devel \
      libpq-devel \
      libxml2-devel \
      libxslt-devel \
      make \
      nodejs \
      npm \
      openssl-devel \
      patch \
      redhat-rpm-config \
      ruby \
      ruby-devel \
      tzdata \
    " && \
    yum install -y --setopt=tsflags=nodocs ${INSTALL_PKGS} && \
    yum -y clean all --enablerepo='*' && \
    rpm -V ${INSTALL_PKGS}

RUN gem install bundler && \
    npm install yarn --global

# Copy application files

COPY . ${APP_ROOT}/

# Go to application

WORKDIR ${APP_ROOT}

# Install application dependencies

RUN bundle install
RUN yarn install

# Compile application assets (Rails can't precompile assets without SECRET_KEY_BASE) and cleanup

RUN RAILS_ENV=production bundle exec rails assets:precompile

# == Stage: Release

FROM base

# Install dependencies

RUN yum -y module enable ruby:${RUBY_VERSION} && \
    yum -y module enable nodejs:${NODEJS_VERSION} && \
    INSTALL_PKGS=" \
      automake \
      curl \
      gcc \
      gcc-c++ \
      git \
      libffi \
      libpq \
      libxml2 \
      libxslt \
      make \
      nodejs \
      npm \
      openssl \
      patch \
      redhat-rpm-config \
      ruby \
      ruby-devel \
      tzdata \
    " && \
    yum install -y --setopt=tsflags=nodocs ${INSTALL_PKGS} && \
    yum -y clean all --enablerepo='*' && \
    rpm -V ${INSTALL_PKGS}

RUN gem install bundler

# Copy application from former build stage

COPY --from=builder ${GEM_HOME} ${GEM_HOME}
COPY --from=builder ${APP_ROOT} ${APP_ROOT}

# Remove cache

RUN rm -rf ${APP_ROOT}/node_modules && \
    rm -rf ${APP_ROOT}/tmp

# Drop the root user and make the content of /opt/app-root owned by user 1001

RUN chown -R 1001:0 ${APP_ROOT} && chmod -R ug+rwx ${APP_ROOT}

USER 1001

# Go to application

WORKDIR ${APP_ROOT}

# Save timestamp of image building

RUN date -u > BUILD_TIME

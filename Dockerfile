FROM python:3.9.6-slim-buster as base

ENV PYTHONDONTWRITEBYTECODE=1
ENV TZ="CET"

ARG VERSION="latest"

WORKDIR /app

RUN \
    set -eux \
    && apt-get update -q \
    && apt-get -qy install --no-install-recommends \
      git \
      make \
    \
    # cleanup
    && apt-get autoremove -yq \
    && apt-get clean -yqq \
    && cd /var/lib/apt/lists && rm -fr *Release* *Sources* *Packages* \
    && truncate -s 0 /var/log/*log

COPY Makefile ./

# Install requirements
COPY requirements/ ./requirements/
RUN pip install --no-cache-dir -r requirements/requirements.txt

# Copy source code
COPY . .

# Copy files for versioning
# COPY index.html site/
COPY versions.json site/

# Build site
RUN mkdocs build --site-dir site/${VERSION}

FROM python:3.9.6-slim-buster as base
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
COPY . /app

# Build site
RUN make mkdocs-build


# # Deploy
# # ======
# FROM production as deployment

# ARG AWS_ACCESS_KEY_ID
# ARG AWS_SECRET_ACCESS_KEY
# ARG AWS_DEFAULT_REGION
# ARG CLOUDFRONT_DISTRIBUTION_ID="E5L7E66VL8TQC"

# RUN \
#     set -eux \
#     && aws s3 sync /app/site/ s3://www-docs-staging-dicehub-com/ --quiet \
#     && aws cloudfront create-invalidation \
#       --distribution-id ${CLOUDFRONT_DISTRIBUTION_ID} \
#       --paths '/*'


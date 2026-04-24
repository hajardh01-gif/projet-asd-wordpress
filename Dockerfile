FROM wordpress:6.8-apache

LABEL maintainer="Le Petit Journal d'Orleans"
LABEL description="WordPress customise pour Le Petit Journal d'Orleans"
LABEL version="1.0.0"

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost/ || exit 1

EXPOSE 80
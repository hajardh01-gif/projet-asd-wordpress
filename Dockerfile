FROM wordpress:latest

LABEL maintainer="hajardh01"
LABEL description="WordPress ASD projet"

RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 80

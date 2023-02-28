FROM debian:bullseye-slim
LABEL org.opencontainers.image.source="https://github.com/mijdavis2/tf-unused"

COPY ./target/release/tf-unused /usr/local/bin/tf-unused

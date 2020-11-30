FROM nginx:1.17.2-alpine as build

LABEL name="another-prova-github" \
      description="" \
      eu.mia-platform.url="https://www.mia-platform.eu" \
      eu.mia-platform.version="0.1.0"

COPY nginx /etc/nginx

RUN touch ./off \
  && chmod o+rw ./off \
  && echo "another-prova-github: $COMMIT_SHA" >> /etc/nginx/commit.sha

WORKDIR /usr/static

COPY ./build .

USER nginx

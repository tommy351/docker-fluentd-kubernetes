FROM fluent/fluentd:onbuild

RUN apk add --update --no-cache  --virtual .build-deps sudo build-base ruby-dev && \
  sudo gem install fluent-plugin-kubernetes_metadata_filter && \
  sudo gem sources --clear-all && \
  apk del .build-deps && \
  rm -rf /home/fluent/.gem/ruby/2.3.0/cache/*.gem

EXPOSE 24284

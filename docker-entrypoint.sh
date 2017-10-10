#!/bin/sh

COUNT=2 QUEUE=* BACKGROUND=yes bundle exec rails resque:workers
bundle exec puma "$@"

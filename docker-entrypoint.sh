#!/bin/sh

bundle exec bin/delayed_job start --pool=user:10 --pool=default:2
bundle exec puma "$@"

#!/usr/bin/env sh
egrep -ohIR "([\"\'][^\s\"]*[\"\']|:.*$)" $1 | sed -E "s/^:\s*//" | ./score_string.rb

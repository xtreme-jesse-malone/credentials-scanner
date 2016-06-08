#!/usr/bin/env sh
egrep -ohIR "([\"\'][^\s\"]*[\"\']|:.*$)" ./* | sed -r "s/^:\s*//" | ./score_string.rb

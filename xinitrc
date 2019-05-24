#!/bin/sh

[ -f "$Home/.xprofile" ] && . ~/.xprofile

exec i3

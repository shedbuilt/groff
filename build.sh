#!/bin/bash
PAGE=letter ./configure --prefix=/usr &&
# Explicitly prevent parallel builds
make -j1 &&
make DESTDIR="$SHED_FAKE_ROOT" install

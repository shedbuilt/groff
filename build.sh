#!/bin/bash
declare -A SHED_PKG_LOCAL_OPTIONS=${SHED_PKG_OPTIONS_ASSOC}
PAGE=letter \
./configure --prefix=/usr \
            --docdir="$SHED_PKG_DOCS_INSTALL_DIR" &&
# Explicitly prevent parallel builds
make -j1 &&
make DESTDIR="$SHED_FAKE_ROOT" install || exit 1
# Prune Documentation
if [ -z "${SHED_PKG_LOCAL_OPTIONS[docs]}" ]; then
    rm -rf "${SHED_FAKE_ROOT}${SHED_PKG_DOCS_INSTALL_DIR}"
fi

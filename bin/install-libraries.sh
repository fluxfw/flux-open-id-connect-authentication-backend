#!/usr/bin/env sh

set -e

bin="`dirname "$0"`"
root="$bin/.."
libs="$root/.."

checkAlreadyInstalled() {
    if [ `ls "$libs" | wc -l` != "1" ]; then
        echo "Already installed" >&2
        exit 1
    fi
}

installLibrary() {
    (mkdir -p "$libs/$1" && cd "$libs/$1" && wget -O - "$2" | tar -xz --strip-components=1)
}

checkAlreadyInstalled

installLibrary flux-authentication-backend-api https://github.com/fluxfw/flux-authentication-backend-api/archive/refs/tags/v2023-02-16-4.tar.gz

installLibrary flux-config-api https://github.com/fluxfw/flux-config-api/archive/refs/tags/v2023-02-09-1.tar.gz

installLibrary flux-hash-api https://github.com/fluxfw/flux-hash-api/archive/refs/tags/v2023-02-09-1.tar.gz

installLibrary flux-http-api https://github.com/fluxfw/flux-http-api/archive/refs/tags/v2023-02-16-1.tar.gz

installLibrary flux-shutdown-handler-api https://github.com/fluxfw/flux-shutdown-handler-api/archive/refs/tags/v2023-02-09-1.tar.gz

installLibrary mime-db https://registry.npmjs.org/mime-db/-/mime-db-1.52.0.tgz
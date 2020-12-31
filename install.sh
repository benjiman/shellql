#!/bin/sh -e

. ./install_fns

run_tests() {
    pushd tests
    bats *.bats
    popd &> /dev/null
}

if [[ "$*" =~ .*skip-tests.* ]]; then
    echo "Skipping tests"
else
    run_tests
fi

echo "Installing to ${HOME}/bin"
install "${HOME}/bin"

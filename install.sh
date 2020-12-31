#!/bin/sh -e

. ./install_fns

run_tests() {
    pushd tests
    bats *.bats
    popd
}

run_tests
install "$HOME/bin"

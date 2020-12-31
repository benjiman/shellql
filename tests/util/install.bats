super.setup() {
    INSTALL_DIR=$(mktemp -d --suffix='.shellql-tests')
    pushd ..
    . ./install_fns
    install $INSTALL_DIR
    popd
    export PATH="$INSTALL_DIR:$PATH"
}

super.teardown() {
    rm -rf "$INSTALL_DIR"
}

setup() {
    super.setup
}

teardown() {
    super.teardown
}


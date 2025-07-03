#!/bin/sh

CURRENT_DIR="$PWD"

if [ ! -f "$HOME/.cargo/bin/cargo" ]; then
    curl --proto "=https" --tlsv1.2 -sSf "https://sh.rustup.rs" | sh -s -- -y --default-toolchain=stable
fi

if [ ! -f "$HOME/.cargo/bin/fish" ]; then
    cargo install --git "https://github.com/fish-shell/fish-shell" --tag 4.0.0
    fish -c 'curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain=stable'
fi

if [ ! -f "$HOME/.cargo/bin/addr2line" ]; then
    cargo install --locked addr2line
fi

if [ ! -f "$HOME/.cargo/bin/dotter" ]; then
    cargo install --locked dotter
fi

if [ ! -f "$HOME/.cargo/bin/fd" ]; then
    cargo install --locked fd-find
fi

if [ ! -f "$HOME/.cargo/bin/flamegraph" ]; then
    cargo install --locked flamegraph
fi

if [ ! -f "$HOME/.cargo/bin/flamelens" ]; then
    cargo install --locked flamelens
fi

if [ ! -f "$HOME/.cargo/bin/hyperfine" ]; then
    cargo install --locked hyperfine
fi

if [ ! -f "$HOME/.cargo/bin/inferno-collapse-perf" ]; then
    cargo install --locked inferno
fi

if [ ! -f "$HOME/.cargo/bin/jj" ]; then
    cargo install --locked --bin jj jj-cli
fi

if [ ! -f "$HOME/.cargo/bin/lsd" ]; then
    cargo install --locked lsd
fi

if [ ! -f "$HOME/.cargo/bin/rg" ]; then
    cargo install --locked ripgrep
fi

if [ ! -f "$HOME/.cargo/bin/sd" ]; then
    cargo install --locked sd
fi

if [ ! -f "$HOME/.cargo/bin/tokei" ]; then
    cargo install --locked tokei
fi

if [ ! -f "$HOME/.cargo/bin/zellij" ]; then
    cargo install --locked zellij
fi

if [ ! -f "$HOME/.cargo/bin/cargo-asm" ]; then
    cargo install --locked cargo-show-asm
fi

if [ ! -f "$HOME/.cargo/bin/cargo-expand" ]; then
    cargo install --locked cargo-expand
fi

if [ ! -f "$HOME/.cargo/bin/cargo-flamegraph" ]; then
    cargo install --locked cargo-flamegraph
fi

if [ ! -f "$HOME/.cargo/bin/cargo-release" ]; then
    cargo install --locked cargo-release
fi

if [ ! -f "$HOME/.cargo/bin/rust-analyzer" ]; then
    git clone "https://github.com/rust-lang/rust-analyzer/" "$HOME/.cargo/rust-analyzer"
    cd "$HOME/.cargo/rust-analyzer"
    cargo xtask install --server
    cd "$CURRENT_DIR"
fi

if [ ! -f "$HOME/.cargo/bin/hx" ]; then
    git clone "https://github.com/helix-editor/helix" "$HOME/.cargo/helix"
    cd "$HOME/.cargo/helix"
    cargo install --path helix-term --locked
    cd "$CURRENT_DIR"
fi

cd "$CURRENT_DIR"
"$HOME/.cargo/bin/dotter" deploy --force --verbose

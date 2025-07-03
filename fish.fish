if status is-interactive
    # Commands to run in interactive sessions can go here
    source "$HOME/.config/fish/oh-my-posh.fish"
    COMPLETE=fish jj | source
end

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/usr/local/cuda-12.8/bin:$PATH"

export PATH="$HOME/miniconda3/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.juliaup/bin:$PATH"

export RUSTDOCFLAGS="--cfg docsrs --html-in-header $HOME/katex-header.html"
export RUSTFLAGS="-C symbol-mangling-version=v0"

alias record="perf record -g"
alias report="perf report -g 'graph,0.5,caller' -M intel"
alias lens="perf script -i perf.data | inferno-collapse-perf | flamelens"

alias ls=lsd
alias ll="ls --long"
alias l=ls
alias la="ls --all --long"
alias lt="ls --tree"

fzf_configure_bindings --directory=\cf

set -U fish_greeting

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

export HELIX_RUNTIME="$HOME/.cargo/helix/runtime"

alias record="perf record -g"
alias report="perf report -g 'graph,0.5,caller' -M intel"
alias lens="perf script -i perf.data | inferno-collapse-perf | flamelens"

alias ls=lsd
alias ll="ls --long"
alias l=ls
alias la="ls --all --long"
alias lt="ls --tree"

fzf_configure_bindings --directory=\cf

function print_pad2
    set --local v $argv[1]
    if test $v -lt 10
        printf 0
    end
    printf $v
end

function print_pad3
    set --local v $argv[1]
    if test $v -lt 100
        printf 0
    end
    print_pad2 $v
end

function elapsed --on-event fish_postexec
    set --local total "$CMD_DURATION"
    set --local c0 b3e2cd
    set --local c1 fdcdac
    set --local c2 f4cae4
    set --local c3 cbd5e8

    set_color --italics c0c0c0
    printf "time elapsed"
    set_color normal
    printf ": "

    set_color normal
    while true
        if test $total -lt 1000
            set_color $c0
            printf $total
            set_color normal
            printf ms
            break
        end

        set --local seconds (math "($total - $total % 1000) / 1000")
        set --local milli (math $total % 1000)

        if test $total -lt 60000
            set_color $c1
            printf $seconds
            set_color normal

            printf 's '

            set_color $c0
            print_pad3 $milli
            set_color normal

            printf ms
            break
        end

        set --local minutes (math "($seconds - $seconds % 60) / 60")
        set --local seconds (math "$seconds % 60")

        if test $total -lt 3600000
            set_color $c2
            printf $minutes
            set_color normal

            printf 'm '

            set_color $c1
            print_pad2 $seconds
            set_color normal

            printf 's '

            set_color $c0
            print_pad3 $milli
            set_color normal

            printf ms
            break
        end

        set --local hours (math "($minutes - $minutes % 60) / 60")
        set --local minutes (math "$minutes % 60")

        set_color $c3
        printf $hours
        set_color normal

        printf 'h '

        set_color $c2
        print_pad2 $minutes
        set_color normal

        printf 'm '

        set_color $c1
        print_pad2 $seconds
        set_color normal

        printf 's '

        set_color $c0
        print_pad3 $milli
        set_color normal

        printf ms
        break
    end

    set_color normal
    printf "\n"
end

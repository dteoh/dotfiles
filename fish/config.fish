# https://github.com/lunks/fish-nuggets/blob/master/functions/is-git.fish
function is_git
    env git rev-parse --git-dir ^/dev/null >/dev/null
end

# https://github.com/lunks/fish-nuggets/blob/master/functions/has-git-changes.fish
function git_has_changes
    not git diff --quiet; or not git diff --quiet --cached ^/dev/null
end

# https://github.com/lunks/fish-nuggets/blob/master/functions/parse_git_branch.fish
function git_info
    if git_has_changes
        set_color red
    else
        set_color green
    end

    set branch (env git symbolic-ref -q HEAD)
    if test ! -z "$branch"
        echo -n $branch | sed -e 's/refs\/heads\///'
    else
        git name-rev --name-only HEAD ^/dev/null
    end
end

# Override built-in prompt_pwd
function prompt_pwd
    if test "$PWD" != "$HOME"
        printf '%s' (echo $PWD|sed -e 's|/private||' -e "s|^$HOME|~|")
    else
        echo '~'
    end
end

function fish_prompt
    if not set -q __prompt_hostname
        set -g __prompt_hostname (hostname|cut -d . -f 1)
    end
    printf '%s@%s %s' $USER $__prompt_hostname (prompt_pwd)
    set_color normal

    if is_git; printf ' %s' (git_info); end

    set_color normal
    echo \n'$ '
end

set -xg PATH /usr/local/bin $PATH


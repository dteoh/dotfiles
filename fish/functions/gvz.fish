function gvz --description 'alias gvz=gv (fzf -q $argv)'
    if test (count $argv) -gt 0
        gv (fzf -q $argv);
    else
        gv (fzf);
    end
end

function gvz --description 'alias gvz=gv (fzf -q $argv)'
    if count $argv > 1
        gv (fzf -q $argv[2..-1]);
    else
        gv (fzf);
    end
end

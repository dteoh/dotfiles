function nvz --description 'alias nvz=nvim (fzf -q $argv)'
    if test (count $argv) -gt 0
        nvim (fzf -q $argv);
    else
        nvim (fzf);
    end
end

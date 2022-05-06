vim.cmd([[
command! ReloadConfig luafile %
command! -nargs=0 Screenkey :silent execute "!screenkey &" 
command! -nargs=0 ScreenkeyExit :silent execute "!killall screenkey &" 
command! ColorPicker silent !colorpicker --short --one-shot --preview | tr -d '\n' | xsel -b 
command! Format undojoin | Neoformat 
command! Init vs $MYVIMRC 
command! Uptime !uptime -p 
command! Indent norm gg=G
command! LearnVim e $HOME/.config/nvim/learn_vim.md
command! OhShitGit call jobstart("xdg-open https://ohshitgit.com")
command! TrimWhitespace %s/\v\s+$//
command! Df !df -h .
command! VirtualTextToggle lua require('user.utils').diagnostic_virtual_text_toggle()
command! VirtualTextEnable lua require('user.utils').diagnostic_virtual_text_toggle(true)
command! VirtualTextDisable lua require('user.utils').diagnostic_virtual_text_toggle(false)
]])

-- TODO: fix the jobstart function or use plenary jobs
vim.api.nvim_create_user_command("Addhost", function(opts)
    -- print(vim.inspect(opts))
    local domain_name = opts.args
    vim.fn.jobstart({ "fortune" }, {
        on_stdout = function(j, d, e)
            print(vim.inspect(d))
            -- print(j,d,e)
        end,
    })
end, {
    nargs = 1,
})

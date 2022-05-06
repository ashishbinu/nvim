" Recognize some files known to support JSON with comments
" Entries sorted by pattern

autocmd BufNewFile,BufRead coffeelint.json set filetype=jsonc


autocmd BufNewFile,BufRead *.jsonc setfiletype=jsonc

autocmd BufNewFile,BufRead tsconfig.*.json set filetype=jsonc
autocmd BufNewFile,BufRead jsconfig.*.json set filetype=jsonc
autocmd BufNewFile,BufRead tsconfig-*.json set filetype=jsonc
autocmd BufNewFile,BufRead jsconfig-*.json set filetype=jsonc

autocmd BufNewFile,BufRead */waybar/config set filetype=jsonc

autocmd BufNewFile,BufRead eslintrc.json set filetype=jsonc
autocmd BufNewFile,BufRead .jsfmtrc set filetype=jsonc
autocmd BufNewFile,BufRead .jshintrc set filetype=jsonc
autocmd BufNewFile,BufRead .swcrc set filetype=jsonc
autocmd BufNewFile,BufRead .hintrc set filetype=jsonc
autocmd BufNewFile,BufRead .babelrc set filetype=jsonc
autocmd BufNewFile,BufRead .babelrc.json set filetype=jsonc
autocmd BufNewFile,BufRead .babel.config.json set filetype=jsonc
autocmd BufNewFile,BufRead .ember-cli set filetype=jsonc
autocmd BufNewFile,BufRead tsconfig.json set filetype=jsonc
autocmd BufNewFile,BufRead jsconfig.json set filetype=jsonc
autocmd BufNewFile,BufRead .mocharc.json set filetype=jsonc
autocmd BufNewFile,BufRead coc-settings.json set filetype=jsonc

autocmd BufNewFile,BufRead .code-workspace set filetype=jsonc
autocmd BufNewFile,BufRead language-configuration.json set filetype=jsonc
autocmd BufNewFile,BufRead icon-theme.json set filetype=jsonc
autocmd BufNewFile,BufRead color-theme.json set filetype=jsonc
autocmd BufNewFile,BufRead .code-snippets set filetype=jsonc
autocmd BufNewFile,BufRead settings.json set filetype=jsonc
autocmd BufNewFile,BufRead launch.json set filetype=jsonc
autocmd BufNewFile,BufRead tasks.json set filetype=jsonc
autocmd BufNewFile,BufRead keybindings.json set filetype=jsonc
autocmd BufNewFile,BufRead extensions.json set filetype=jsonc
autocmd BufNewFile,BufRead argv.json set filetype=jsonc
autocmd BufNewFile,BufRead profiles.json set filetype=jsonc

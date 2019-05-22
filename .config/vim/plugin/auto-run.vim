" Recompile suckless programs automaticlly;
" autocmd BufWritePost config.h,config.def.h !sudo make install

autocmd BufWritePost *xbindkeysrc !killall xbindkeys; xbindkeys --poll-rc
autocmd BufWritePost *sxhkdrc !killall sxhkd; setsid sxhkd &

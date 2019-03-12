function! Cleanreg#execute()
	let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
	for r in regs
		  call setreg(r, [])
	  endfor"')
endfunc

command! Cleanreg call Cleanreg#execute()

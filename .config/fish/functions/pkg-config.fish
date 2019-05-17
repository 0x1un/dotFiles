function pkg-config
	command pkg-config $argv | string split " "
end


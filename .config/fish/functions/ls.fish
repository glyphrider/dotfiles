function ls
	eza -F --icons --color=auto --group-directories-first --git $argv
end

function la
	eza -aF --icons --color=auto --group-directories-first --git $argv
end

function ll
	eza -alF --icons --color=auto --group-directories-first --git $argv
end

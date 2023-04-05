function ls
	exa -F --icons --color=auto --group-directories-first --git $argv
end

function la
	exa -aF --icons --color=auto --group-directories-first --git $argv
end

function ll
	exa -alF --icons --color=auto --group-directories-first --git $argv
end

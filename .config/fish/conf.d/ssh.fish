fish_add_path ~/.cargo/bin

function ll
  exa -alF --icons --color=auto --group-directories-first --git $argv
end

function ls
  exa -F --icons --color=auto --group-directories-first --git $argv
end

function la
  exa -aF --icons --color=auto --group-directories-first --git $argv
end

if status is-interactive
	# Commands to run in interactive sessions can go here
	set SSH_ENV "$HOME/.ssh/agent-environment"

	function start_agent 
		echo "Initialising new SSH agent..."
		/usr/bin/ssh-agent -c | sed 's/^echo/#echo/' > "$SSH_ENV"
		echo succeeded
		chmod 600 "$SSH_ENV"
		cat "$SSH_ENV" | source
		/usr/bin/ssh-add
	end

	# Source SSH settings, if applicable

	if [ -f "$SSH_ENV" ]
		cat "$SSH_ENV" | source
		ps -ef | grep $SSH_AGENT_PID | grep -e 'ssh-agent -c$' > /dev/null || start_agent
	else
		start_agent
	end

	source ~/.asdf/asdf.fish

	#starship init fish | source
end

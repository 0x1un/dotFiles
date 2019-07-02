complete -c doas -s -S -d "Run a login shell"
complete -c doas -s N -d "No interactive mode - fail if would prompt password"
complete -c doas -s u -a "(__fish_complete_users)" -x -d "Run command as user"
complete -c doas -d "Command to run" -x -a "(__fish_complete_subcommand_root -u -g)"

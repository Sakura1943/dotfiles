complete -c brightness_control -n "__fish_use_subcommand" -s h -l help -d 'Print help'
complete -c brightness_control -n "__fish_use_subcommand" -s V -l version -d 'Print version'
complete -c brightness_control -n "__fish_use_subcommand" -f -a "gui" -d 'Running on Graphical user interface'
complete -c brightness_control -n "__fish_use_subcommand" -f -a "cmd" -d 'Running on command-line interface'
complete -c brightness_control -n "__fish_use_subcommand" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c brightness_control -n "__fish_seen_subcommand_from gui" -l width -d 'Window width' -r
complete -c brightness_control -n "__fish_seen_subcommand_from gui" -l height -d 'Window height' -r
complete -c brightness_control -n "__fish_seen_subcommand_from gui" -s h -l help -d 'Print help'
complete -c brightness_control -n "__fish_seen_subcommand_from cmd" -s i -l inc -d 'Increase brightness'
complete -c brightness_control -n "__fish_seen_subcommand_from cmd" -s d -l dec -d 'Decrease brightness'
complete -c brightness_control -n "__fish_seen_subcommand_from cmd" -s h -l help -d 'Print help'
complete -c brightness_control -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from gui; and not __fish_seen_subcommand_from cmd; and not __fish_seen_subcommand_from help" -f -a "gui" -d 'Running on Graphical user interface'
complete -c brightness_control -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from gui; and not __fish_seen_subcommand_from cmd; and not __fish_seen_subcommand_from help" -f -a "cmd" -d 'Running on command-line interface'
complete -c brightness_control -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from gui; and not __fish_seen_subcommand_from cmd; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'

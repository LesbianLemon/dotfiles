zstyle ":completion:*" completer _extensions _complete _approximate

zstyle ":completion:*:*:*:*:descriptions" format "%F{green}-- %d --%f"
zstyle ":completion:*:*:*:*:corrections" format "%F{yellow}!- %d (errors: %e) -!%f"
zstyle ":completion:*:messages" format " %F{purple} -- %d --%f"
zstyle ":completion:*:warnings" format " %F{red}-- no matches found --%f"
zstyle ':completion:*' group-name ''

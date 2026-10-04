fzf_theme_opts="\
--color=bg+:#43474e
--color=bg:#111318
--color=spinner:#e2e2e9
--color=hl:#ffb4ab
--color=fg:#e2e2e9
--color=header:#ffb4ab
--color=info:#a9c7ff
--color=pointer:#e2e2e9
--color=marker:#c4c6cf
--color=fg+:#e2e2e9
--color=prompt:#a9c7ff
--color=hl+:#ffb4ab
--color=selected-bg:#43474e
--color=border:#43474e
--color=label:#e2e2e9"

export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS:+$FZF_DEFAULT_OPTS
}$fzf_theme_opts"

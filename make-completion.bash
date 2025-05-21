#!/usr/bin/env bash

# Completions for Makefile artisan helpers (make a, make art, make artisan)

_make_artisan_commands() {
    local cur prev words cword
    _init_completion || return

    local artisan_cmds
    artisan_cmds=$(docker compose -f compose.prod.yaml exec -T php-fpm php artisan list --format=json 2>/dev/null | jq -r '.commands[].name')

    COMPREPLY=( $(compgen -W "${artisan_cmds}" -- "$cur") )
}

complete -F _make_artisan_commands make

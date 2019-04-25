#!/usr/bin/env python3

import re


def parse_zsh_history(file: str):
    with open(file, 'rb+') as f:
        history = f.readlines()

    pattern = re.compile(r": (\d+):\d;(.*)")

    for his in history:
        try:
            if his:
                yield pattern.match(his.decode('utf8'))
            else:
                continue
        except UnicodeDecodeError:
            continue


def convert_to_fish_history_file(file: str):
    parse = parse_zsh_history(file)
    with open("./fish_history", "a+", encoding="utf8") as f:
        for p in parse:
            if p is None:
                continue
            f.write(f"- cmd: {p.group(2)}\n  when: {p.group(1)}\n")


convert_to_fish_history_file("./history")

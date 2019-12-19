#!/usr/bin/env python3
import sys


PATH = "/sys/class/backlight/intel_backlight/"
CURRENT = PATH + "brightness"
MAX = PATH + "max_brightness"


def get_light(filename: str) -> int:
    with open(filename) as f:
        return int(f.read().strip())


def set_light(num: int, flag: str):
    max = get_light(MAX)
    current = get_light(CURRENT)
    if num >= max: return
    if flag == "dec":
        current -= num
    elif flag == "inc":
        current += num
    with open(CURRENT, "w") as f:
        f.write(str(current))

if __name__ == "__main__":
    a = sys.argv
    flag, num = a[1], a[2]
    set_light(int(num), flag)
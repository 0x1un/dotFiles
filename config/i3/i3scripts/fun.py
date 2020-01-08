#!/usr/bin/env /home/aumujun/.virtualenvs/Spider/bin/python3

import requests
import json


url = 'https://fun.serical.net/'
def get_fun(url: str):
    response = requests.get(url)
    resp = json.loads(response.text)
    return resp['data']


result = get_fun(url)
print(result)

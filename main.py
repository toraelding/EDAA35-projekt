import timeit

import numpy as np
import pandas as pd
from microbench import *
import time


class Bench2(MicroBench, MBGlobalPackages):
    outfile = 'test.txt'


basic_bench = Bench2()


@basic_bench
def load_json():
    return pd.read_json("data.json", encoding='unicode_escape')


def load_json2():
    data = pd.read_json("http://api.scb.se/OV0104/v1/doris/sv/ssd/START/HE/HE0110/HE0110G/Tab4bDispInkN")
    return pd.DataFrame(list(data['variables']))


def load_csv():
    return pd.read_csv("data.csv", encoding='unicode_escape')


def handle_data(data):
    data['antal'] = pd.to_numeric(data['antal'], errors='coerce')

    data['andel_man'] = pd.to_numeric(data['andel_man'], errors='coerce')
    data['andel_kvinnor'] = pd.to_numeric(data['andel_kvinnor'], errors='coerce')
    data['antal_kvinnor'] = pd.to_numeric(data['antal_kvinnor'], errors='coerce')
    data['antal_man'] = pd.to_numeric(data['antal_man'], errors='coerce')

    rd = data[data.diagnoskapitel_kod.isin(koder)].pivot_table(index=indices, aggfunc=
    {
        "antal_man": np.sum,
        "antal_kvinnor": np.sum,
        'andel_man': np.mean,
        'andel_kvinnor': np.mean
    })

    return rd


ops = [handle_data, load_json, load_csv]

if __name__ == '__main__':

    koder = [
        "F00-F99",
        "H00-H59",
        "H60-H95"
    ]

    indices = ["diagnoskapitel_text"]

    use_json = bool(input())
    if use_json:
        data = load_json()
    else:
        data = load_csv()

    n = 500

    handle_data_times = []
    for i in range(n):
        t1 = time.time()
        handle_data(data)
        t2 = time.time()

        diff = t2 - t1
        handle_data_times.append(diff)

    res = pd.DataFrame(handle_data_times).agg('mean')
    print(res)

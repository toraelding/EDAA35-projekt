import json

import numpy as np
import pandas as pd
import time

def load_json():
    return pd.read_json("data/data.json", encoding='unicode_escape')

def load_json2():
    data = pd.read_json("http://api.scb.se/OV0104/v1/doris/sv/ssd/START/HE/HE0110/HE0110G/Tab4bDispInkN")
    return pd.DataFrame(list(data['variables']))


def load_csv():
    return pd.read_csv("data/data.csv", encoding='unicode_escape')


def handle_data():
    # remove:
    # index, kvartal, diagnoskapitel, etc
    # separera:

    pass


if __name__ == '__main__':

    thing = bool(input())
    if thing:
        data = load_json()
    else:
        data = load_csv()

    data['antal'] = pd.to_numeric(data['antal'], errors='coerce')

    data['andel_man'] = pd.to_numeric(data['andel_man'], errors='coerce')
    data['andel_kvinnor'] = pd.to_numeric(data['andel_kvinnor'], errors='coerce')

<<<<<<< HEAD
    rd = data.pivot_table(index=["ar","diagnoskapitel_text"], aggfunc={"antal": np.sum, 'andel_man':np.mean, 'andel_kvinnor':np.mean})
    print(rd)
=======
if __name__ == '__main__':
    json_data = load_json()
    csv_data = load_csv()
    print(json_data)
>>>>>>> da422dd2286fcb13e06406a39fdcdd3f562b0f77

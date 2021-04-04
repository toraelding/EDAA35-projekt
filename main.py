import urllib.request, json
import pandas as pd


def load_json():
    results = []
    next_url = "https://catalog.forsakringskassan.se/rowstore/dataset/6733a920-64e4-44ac-b0a4-63138ab2c2cf/json"

    i = 0
    while next_url:
        i += 1
        print(i)
        with urllib.request.urlopen(next_url) as url:
            json_data_part = json.loads(url.read().decode())

        next_url = json_data_part['next'] if json_data_part['next'] else ""

        results += json_data_part['results']

        # Loopa genom results lägga till en rad per objekt i dataframen

        # temp = pd.read_json()

        # pd.concat(data, temp)

    return pd.DataFrame(results)


def load_csv():
    return pd.read_csv("data/data.csv")


if __name__ == '__main__':
    #json_data = load_json()
    csv_data = load_csv()
    print(csv_data)

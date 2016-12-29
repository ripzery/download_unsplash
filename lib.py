import shutil
import requests
import os


def download_img(folder, url, count):
    response = requests.get(url, stream=True)
    with open(folder + '/img' + str(count) + '.png', 'wb') as out_file:
        shutil.copyfileobj(response.raw, out_file)
    del response


def create_folder(folder):
    if not os.path.exists(folder):
        os.makedirs(folder)

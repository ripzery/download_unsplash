import shutil
import requests


def download_img(url, count):
    response = requests.get(url, stream=True)
    with open('img'+str(count)+'.png', 'wb') as out_file:
        shutil.copyfileobj(response.raw, out_file)
    del response

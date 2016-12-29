import shutil
import requests
import os


def download_img(url, count):
    response = requests.get(url, stream=True)
    folder = "unsplash"
    if not os.path.exists(folder):
        os.makedirs(folder)
    with open(folder+'/img'+str(count)+'.png', 'wb') as out_file:
        shutil.copyfileobj(response.raw, out_file)
    del response

import shutil
import requests
import os
from robot.api import logger
from StringIO import StringIO
from PIL import Image


def download_img(folder, url, count):
    extension = ".jpg"
    if url.find(".png") != -1:
        extension = ".png"

    response = requests.get(url, allow_redirects=False)
    headers = {}
    if 'location' in response.headers:
        headers['Referer'] = response.headers['location']
        response = requests.get(url, headers=headers)
    i = Image.open(StringIO(response.content))
    i.save(folder + "/img" + str(count+1) + extension)
    del response


def create_folder(folder):
    if not os.path.exists(folder):
        os.makedirs(folder)

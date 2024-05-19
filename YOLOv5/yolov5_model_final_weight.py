# -*- coding: utf-8 -*-
"""yolov5_model_final_weight (1).ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1P4ZG2gN4K24ph9ymwUlzMMN3g5s3LMrh
"""

!pip install roboflow

# 라벨링된 이미지 YOLOv5 형식에 맞게 불러오기
from roboflow import Roboflow
rf = Roboflow(api_key="D9KL1XhF9yRvyI2zM2i8")
project = rf.workspace("capstone-rc3ka").project("capstone-ffdco")
version = project.version(2)
dataset = version.download("yolov5")

!git clone https://github.com/ultralytics/yolov5

# Commented out IPython magic to ensure Python compatibility.
# %mv /content/capstone-2 /content/yolov5/

# Commented out IPython magic to ensure Python compatibility.
# %cd yolov5

!pip install -r requirements.txt

from glob import glob #이미지를 한번에 긁어모으기 위한 glob 모듈

img_list = glob('/content/yolov5/capstone-2/train/images/*.jpg') # 학습 이미지 경로
val_img_list = glob('/content/yolov5/capstone-2/valid/images/*.jpg') # 검증 이미지 경로

with open('/content/yolov5/capstone-2/train.txt', 'w') as f:
    f.write('\n'.join(img_list) + '\n')


with open('/content/yolov5/capstone-2/valid.txt', 'w') as f:
    f.write('\n'.join(val_img_list) + '\n')

!pip install -U pyYAML

!python train.py --img 640 --batch 30 --epochs 100 --data capstone-2/data.yaml --cfg models/yolov5s.yaml --weights yolov5s.pt --name yolo_run

!python detect.py --weight "/content/yolov5/runs/train/yolo_run/weights/best.pt" --source "/content/yolov5/capstone-2/test/images"

"""## 이미지 결과 확인"""

import cv2
import matplotlib.pyplot as plt
from glob import glob

img_paths = glob("/content/yolov5/runs/detect/exp/styrofoam-10-_jpg.rf.d9cd24e391c510184481b772e17d8beb.jpg")

img = cv2.imread(img_paths[0])
plt.figure(figsize=(10,6))
plt.imshow(img)
plt.show()
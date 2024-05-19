# -*- coding: utf-8 -*-
"""functions

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1P4ZG2gN4K24ph9ymwUlzMMN3g5s3LMrh
"""

import numpy as np
import cv2
import torch
import pathlib
from pathlib import Path
pathlib.PosixPath = pathlib.WindowsPath

print(cv2.__version__)
model = torch.hub.load('ultralytics/yolov5', 'custom', path='best.pt', force_reload=True)
classes = []
with open('classes.txt', 'r') as f:
    for line in f:
        classes.append(line.strip())

def yolo(img_path):
    img = cv2.imread(img_path)
    img = cv2.resize(img, (416, 416))
    results = model(img)
    Label, Bbox, Confidence = [], [], []
    for res in results.pandas().xyxy[0].iterrows():
        if res[1]['confidence'] > 0.2:
            (x1, y1, x2, y2) = (res[1]['xmin'], res[1]['ymin'], res[1]['xmax'], res[1]['ymax'])
            bbox = (x1, y1, x2, y2)
            ClassName = classes[int(res[1]['class'])]
            Label.append(ClassName)
            Bbox.append(bbox)
            Confidence.append(res[1]['confidence'])
            # Draw bounding box on image
            cv2.rectangle(img, (int(x1), int(y1)), (int(x2), int(y2)), (0, 255, 0), 2)
            cv2.putText(img, f'{ClassName} {res[1]["confidence"]:.2f}', (int(x1), int(y1) - 10),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0, 255, 0), 2)
    output_path = img_path.replace('.jpg', '_result.jpg')
    cv2.imwrite(output_path, img)
    return Label, Bbox, Confidence, output_path
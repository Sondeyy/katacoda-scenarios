#!/bin/bash
docker run -p 8888:8888 -d --name jupyter jupyter/pyspark-notebook
docker cp main.ipynb jupyter:/home/jovyan/main.ipynb
docker cp crude-oil-price.csv jupyter:/home/jovyan/crude-oil-price.csv
docker logs jupyter
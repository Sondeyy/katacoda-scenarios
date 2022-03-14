You will now run a Docker container for Jupyter Notebook. Note: this may take up to 3 minutes, because of the size of the container image.

## Run the Jupyter Notebook 

Run the Jupyter Notebook container image:

`docker run -p 8888:8888 -d --name jupyter jupyter/pyspark-notebook`{{execute}}

`docker cp main.ipynb jupyter:/home/jovyan/main.ipynb`{{execute}}
`docker cp crude-oil-price.csv jupyter:/home/jovyan/crude-oil-price.csv`{{execute}}

When the container is running, execute this statement:
`docker logs jupyter`{{execute}}

This will show something like:
```
    Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://localhost:8888/?token=f89b02dd78479d52470b3c3a797408b20cc5a11e067e94b8
```

The token is the value behind `/?token=`. You need that for logging in.

Next, you can open the Jupyter Notebook at 
 https://[[HOST_SUBDOMAIN]]-8888-[[KATACODA_HOST]].environments.katacoda.com/

Note: you need the value of the Jupyter Token to login to the environment.
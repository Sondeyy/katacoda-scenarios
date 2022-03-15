You will now run a Docker container for Jupyter Notebook.

## Run the Jupyter Notebook 

Pull and run the Jupyter Notebook container image:
`docker run -p 8888:8888 -d --name jupyter jupyter/pyspark-notebook`{{execute}}

This image will already have jupyter, pyspark and some other useful libraries like matplotlib or pandas installed.
Without a container you would just run `pip install pyspark` to get started.

Since the creation of the container may take some time on the limited resources of the katacoda machine, you might as well get yourself a coffee or tea in the meantime, sorry for that.

After the creation of the container we will copy two files to its filesystem. The first is just an empty notebook file to get you started. 

`docker cp main.ipynb jupyter:/home/jovyan/main.ipynb`{{execute}}

The second file we will copy to our jupyter container is a csv-file containing data about crude oil prices from 2010 up until now. 
We will use this as example data and explore the capabilities of pyspark by exploring this dataset. The dataset is from [kaggle](https://www.kaggle.com/sc231997/crude-oil-price).

`docker cp crude-oil-price.csv jupyter:/home/jovyan/crude-oil-price.csv`{{execute}}

Now we need to open our jupyter notebook. You will need a token to open it. Follow the next steps to get it. 

`docker logs jupyter`{{execute}}

This will show something like:
```
    to login with a token:
        http://localhost:8888/?token=f89b02dd78479d52470b3c3a797408b20cc5a11e067e94b8
```

The token is the value behind `/?token=`. You need that for logging in.

Next, you can open the Jupyter Notebook at 
 https://[[HOST_SUBDOMAIN]]-8888-[[KATACODA_HOST]].environments.katacoda.com/

Open the `main.ipynb` notebook to start. 
You will now run a Docker container for Jupyter Notebook.

## Run the Jupyter Notebook 
Some commands will be invoked in the terminal to your right. They pull and run a container containing all necessary packages to get started with pyspark in a jupyter notebook. 
Moreover, a blank example notebook and some example data used later on will be copied to it. This may take some time, but please hang on. 
Normally you would just use `pip install pyspark` to install pyspark. But since we want to show its capabilities in a notebook, we do it this way.

Finally, we need to print the logs of the container.
`docker logs jupyter`{{execute}}

This will show something like:
```
    to login with a token:
        http://localhost:8888/?token=f89b02dd78479d52470b3c3a797408b20cc5a11e067e94b8
```


The token is the value behind `/?token=`. You need that for logging in. Copy the token to your clipboard.

Next, you can open the Jupyter Notebook at 
 https://[[HOST_SUBDOMAIN]]-8888-[[KATACODA_HOST]].environments.katacoda.com/

You may need to click on *TRY AGAIN*.

Open the `main.ipynb` notebook to start. 
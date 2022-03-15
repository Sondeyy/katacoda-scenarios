As mentioned earlier Spark can work with many file formats. One of them is Apache parquet, a file format designed for efficient data storage and retrieval. [5](https://databricks.com/glossary/what-is-parquet)
<pre class="file" data-target="clipboard">
df.write.parquet("data/crude_oil_price.parquet")
spark.read.parquet("data/crude_oil_price.parquet").show(5)
</pre>

Another useful feature of Spark is the easy connection to databases like SQL. 
Here we will take a look at how many datasets we have and what the average oil price was. 
<pre class="file" data-target="clipboard">
df.createOrReplaceTempView("crude_oil_price")
spark.sql("select avg(price), count(price) from crude_oil_price").show()
</pre>

You've already seen a lot of the in-/output functionalities provided by Spark. In the next step we will finally use our data and apply machine learning to predict the oil price. 
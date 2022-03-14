<pre class="file" data-target="clipboard">
df.write.parquet("data/crude_oil_price.parquet")
spark.read.parquet("data/crude_oil_price.parquet").show(5)
</pre>

<pre class="file" data-target="clipboard">
df.createOrReplaceTempView("crude_oil_price")
spark.sql("select avg(price), count(price) from crude_oil_price").show()
</pre>
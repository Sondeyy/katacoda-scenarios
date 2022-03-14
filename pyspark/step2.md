<pre class="file" data-target="clipboard">
sc = SparkContext(appName="PySpark-Katacoda")
spark = SparkSession.builder.getOrCreate()
</pre>

<pre class="file" data-target="clipboard">
file_location = "crude-oil-price.csv"

df = spark.read.format("csv").option("inferSchema", True).option("header", True).load(file_location)

df.show(5)
df.printSchema()
</pre>

<pre class="file" data-target="clipboard">
dfp = df.toPandas()
dfp.price.plot()
plt.show()
</pre>
The first thing to do when working with spark is to create a SparkSession.
A SparkSession encapsulates multiple SparkContexts, which need to be created when using spark in different areas.
For example in previous versions you had to create a SQLContext, a HiveContext and so on. This was simplified with Spark Sessions in Apache 2.0 [3](https://medium.com/@achilleus/spark-session-10d0d66d1d24). 

<pre class="file" data-target="clipboard">
spark = SparkSession.builder.getOrCreate()
</pre>

---

Next thing we want to do is to read our example dataset. Spark provides many functions for reading data from many inputs whether they are different file formats or even remote streams. 
We will read the data from the csv-file and can even directly infer the schema. 
<pre class="file" data-target="clipboard">
file_location = "crude-oil-price.csv"
df = spark.read.format("csv").option("inferSchema", True).option("header", True).load(file_location)
df.show(5)
df.printSchema()
</pre>
We created a new dataframe. Dataframes are distributed collections of data grouped into named columns. [4](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.sql.DataFrame.html)
PySpark dataframes are comparable to pandas dataframes or sql relational tables.

---

PySpark even provides a function to turn the dataframe directly to a pandas dataframe, which might be more familiar to some. From there one can use pandas functionalities like plotting.
<pre class="file" data-target="clipboard">
dfp = df.toPandas()
dfp.price.plot()
plt.show()
</pre>
The plot shows the development of the crude oil price over the last 12 years. 

---

Let's continue by looking at some in-/output functionalities we could use. 
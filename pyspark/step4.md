Since we don't need the change and percentChange columns we will remove them from the dataframe.
The other thing we want to do beforehand is to split the date column into separate columns for day, month and year. This is necessary because the price probably not depends on the number of days that passed since the data collection started, but more on seasonal effects. This is just a prediction of myself, and we will see if it is accurate.  
<pre class="file" data-target="clipboard">
df = df.drop("change")
df = df.drop("percentChange")

df = df.withColumn('dayOfMonth', dayofmonth(col('date')))
df = df.withColumn('month', month(col('date')))
df = df.withColumn('year', year(col('date')))
</pre>

Next thing to do is to split the dataframe into a train- and test-dataset. The training data is used for creating an efficient prediction model and the testing data is used to compare it with the predictions and see how efficient our model really is. 
The train-dataset contains data from the years 2010-2018, the test-dataset everything else. 
<pre class="file" data-target="clipboard">
train_df = df.where("year <= 2018")
test_df = df.where("year > 2018")
print(f"train_df has {train_df.count()} elements.")
print(f"test_df has {test_df.count()} elements.")
df = df.drop("date")
</pre>

What we did so far were steps often applied in machine learning in general. The next step is more PySpark specific. The datasets need to consist of RDD's of LabeledPoints. 
A RDD is a *resilient distributed dataset*, the main abstraction of Spark data. RDD's can be shared over multiple nodes of a cluster that can be operated in parallel without the user needing to adapt anything. The PySpark Dataframe is another abstraction over RDD's. 
A LabeledPoint is a object which differentiates between the label and its features. In our case the label is the price, which depends on the three date columns, our features. 
<pre class="file" data-target="clipboard">
train_df = train_df.rdd.map(lambda x: LabeledPoint(x.price, (x.dayOfMonth, x.month, x.year)))
test_df = test_df.rdd.map(lambda x: LabeledPoint(x.price, (x.dayOfMonth, x.month, x.year)))
</pre>

Finally we are ready to create our model. To keep things simple and fast, we use a RandomForestRegressor with 10 tree. Spark provides a lot of other models, which may be better suited to this or other situations. 
<pre class="file" data-target="clipboard">
model = RandomForest.trainRegressor(train_df, categoricalFeaturesInfo={},
                                    numTrees=10, featureSubsetStrategy="auto",
                                    impurity='variance', maxDepth=4, maxBins=32)

predictions = model.predict(test_df.map(lambda x: x.features))
</pre>

See how simple it was to train the model and predict values?

To evaluate our prediction we will plot them in comparison to the real values.
<pre class="file" data-target="clipboard">
predictions_list = predictions.collect() # rdd to list 
dfp.price.plot()
plt.plot([i for i in range(train_df.count(), df.count())], predictions_list)
plt.show()
</pre>

And also calculate a common metric, the mean squared errror. 

<pre class="file" data-target="clipboard">
labelsAndPredictions = test_df.map(lambda lp: lp.label).zip(predictions)
testMSE = labelsAndPredictions.map(lambda lp: (lp[0] - lp[1]) * (lp[0] - lp[1])).sum() / float(test_df.count())
print('Test Mean Squared Error = ' + str(testMSE))
</pre>

To be fair, our prediction does not seem to match the real values.
Crude oil price is probably less dependent to seasonal effects than political and financial events, but this realization is also worth something. 
Anyway: much more important is the knowledge we gained in the process!
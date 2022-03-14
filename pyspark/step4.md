<pre class="file" data-target="clipboard">
df = df.drop("change")
df = df.drop("percentChange")

df = df.withColumn('dayOfMonth', dayofmonth(col('date')))
df = df.withColumn('month', month(col('date')))
df = df.withColumn('year', year(col('date')))
</pre>

<pre class="file" data-target="clipboard">
train_df = df.where("year <= 2018")
test_df = df.where("year > 2018")
print(f"train_df has {train_df.count()} elements.")
print(f"test_df has {test_df.count()} elements.")

df = df.drop("date")
</pre>

<pre class="file" data-target="clipboard">
train_df = train_df.rdd.map(lambda x: LabeledPoint(x.price, (x.dayOfMonth, x.month, x.year)))
test_df = test_df.rdd.map(lambda x: LabeledPoint(x.price, (x.dayOfMonth, x.month, x.year)))
</pre>

<pre class="file" data-target="clipboard">
model = RandomForest.trainRegressor(train_df, categoricalFeaturesInfo={},
                                    numTrees=10, featureSubsetStrategy="auto",
                                    impurity='variance', maxDepth=4, maxBins=32)

predictions = model.predict(test_df.map(lambda x: x.features))
</pre>



<pre class="file" data-target="clipboard">
predictions_list = predictions.collect()
dfp.price.plot()
plt.plot([i for i in range(train_df.count(), df.count())], predictions_list)
plt.show()
</pre>

<pre class="file" data-target="clipboard">
labelsAndPredictions = test_df.map(lambda lp: lp.label).zip(predictions)
testMSE = labelsAndPredictions.map(lambda lp: (lp[0] - lp[1]) * (lp[0] - lp[1])).sum() / float(test_df.count())
print('Test Mean Squared Error = ' + str(testMSE))
</pre>
Welcome!

This Katacoda covers the basics of PySpark. You won't need any previous knowledge about Spark, but some with Python and Common Data Formats. But first things first, what is PySpark?

> PySpark is an interface for Apache Spark in Python. It not only allows you to write Spark applications using Python APIs, but also provides the PySpark shell for interactively analyzing your data in a distributed environment. [1](https://spark.apache.org/docs/latest/api/python/)

This explains that PySpark is more or less just a python wrapper for Apache Spark, which is why i will continue talking about PySpark and Spark as if they are the same thing. PySpark provides just a nice way to interact with Spark. There are also API's for R, Scala and Java. 

Apache Spark is an engine, that provides various features used for data-engineering, machine learning and big-data-processing. It provides in-memory caching, processing in-memory and optimized query execution. 

---

It is open source and widely used in the industry.
> Apache Spark has become one of the most popular big data distributed processing framework with 365,000 meetup members in 2017. [2](https://aws.amazon.com/big-data/what-is-spark/)

---

One big feature is that it provides these features not only on single-node machines but also on big clusters for performance efficient, parallel computing with large datasets. It can be used either standalone or as an abstraction layer on Hadoop YARN or Kubernetes Clusters.

![Spark architecture](assets/architecture.png)
04 Tools, #121

--- 

This katacoda will cover a few different topics in the next few steps. To create and explain the code iteratively we will use a jupyter notebook. Let's get started by installing that!
from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("PySparkTest").getOrCreate()
df = spark.createDataFrame([("Alice", 1), ("Bob", 2)], ["name", "id"])
df.show()
spark.stop()

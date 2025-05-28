import os
import findspark

# Set the Python interpreter for PySpark
os.environ["PYSPARK_PYTHON"] = r"D:\Rajendra-Tech\GitHubRepos\PySpark\PySpark\.venv\Scripts\python.exe"

findspark.init()

from pyspark.sql import SparkSession

# This will create a singleton SparkSession (only one per process)
def get_spark():
    spark = (
        SparkSession.builder
        .appName("NotebookTest")
        .getOrCreate()
    )
    return spark

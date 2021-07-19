# Create __SparkSession__ object
# 
#     The entry point to programming Spark with the Dataset and DataFrame API.
# 
#     Used to create DataFrame, register DataFrame as tables and execute SQL over tables etc.

from pyspark.sql import SparkSession
import sys
# Import the necessary classes and create a local SparkSession, the starting point of all functionalities related to Spark.
from pyspark.sql.types import *
from pyspark.sql.functions import *
from pyspark.sql.functions import col,udf

from pyspark.ml import Pipeline, PipelineModel
from pyspark.ml.feature import  IDF
from pyspark.ml.feature import CountVectorizer
from pyspark.ml.feature import  Tokenizer
from pyspark.ml.feature import StringIndexer
from pyspark.ml.classification import RandomForestClassifier

spark = SparkSession \
    .builder \
    .appName("Kafka Spark Structured Streaming") \
    .config("spark.master", "local[*]") \
    .getOrCreate()

spark.sparkContext.setLogLevel("ERROR")

model = PipelineModel.load("/user/thomasj/StructuredStreamingKafka/Model")

#print(model)
	
df = spark \
  .readStream \
  .format("kafka") \
  .option("kafka.bootstrap.servers", "c.insofe.edu.in:9092") \
  .option("subscribe", "TextApp_Batch52") \
  .option("startingOffsets", "earliest") \
  .load()

df.selectExpr("CAST(key AS STRING)", "CAST(value AS STRING)")

df.printSchema()

df = df.select(col("value").cast("string"), col("timestamp"))
df = df.withColumn('message', split(df.value, "\t")[0])
df = df.select( "message", "timestamp")

df.printSchema()

#df = df.withWatermark("timestamp", "10 minutes")

test_predictions_lr = model.transform(df)

# Start running the query that prints the running counts to the console
#query = df \
#        .writeStream \
#        .format("csv") \
#        .outputMode("append") \
#        .option("truncate","false") \
#        .option("path", "file:///home/centos/jeevans/Kafka/output") \
#        .option("checkpointLocation", "file:///home/centos/jeevans/Kafka/outputCP") \
#        .start()

query = test_predictions_lr \
        .writeStream \
        .format("console") \
        .outputMode("append") \
        .option("truncate","false") \
        .start()

query.awaitTermination()

# ### Initializing Spark

# Build __SparkConf__ object 
# 
#     Contains information about your application.  
# 
# 
# Create __SparkContext__ object 
#     
#     Tells Spark how to access a cluster. 
#     
# 
# Create __SparkSession__ object
# 
#     The entry point to programming Spark with the Dataset and DataFrame API.
# 
#     Used to create DataFrame, register DataFrame as tables and execute SQL over tables etc.

from pyspark.conf import SparkConf
from pyspark import SparkContext
from pyspark.sql import SparkSession

conf = SparkConf().setAppName("TM App Model Building").setMaster('local').set('spark.executor.memory', '1G')
sc = SparkContext(conf=conf)
spark = SparkSession(sc)

# ### Loading the dependent libraries
from pyspark.sql.types import *
from pyspark.sql.functions import *


# ### Problem Statement
# 
# #### Description:
# The SMS Spam Collection v.1 (hereafter the corpus) is a set of SMS tagged messages that have been collected for SMS Spam research. It contains one set of SMS messages in English of 5,574 messages, tagged acording being ham (legitimate) or spam. 

## Read data and create a dataframe
data = spark.read.format("csv").option("sep", "\t").option("header", "false").option("inferSchema", "true").load("file:///home/thomasj/Batch52/SparkStructuredStreaming/SMSSpamCollectionTrain")


# #### Rename Columns
data = data.withColumnRenamed('_c0', 'messageType').withColumnRenamed('_c1', 'message')


# ### Data Preprocessing

# ### Tokenizer
# 
# Tokenization is the process of taking text (such as a sentence) and breaking it into individual terms (usually words). Let's tokenize the messages and create a list of words of each message.

from pyspark.ml.feature import Tokenizer

tokenizer = Tokenizer(inputCol="message", outputCol="words")


# ###  CountVectorizer
# 
# CountVectorizer converts the list of tokens above to vectors of token counts. 

from pyspark.ml.feature import CountVectorizer

countVectorizer = CountVectorizer(inputCol="words", outputCol="rawFeatures")


# ### Inverse Document Frequency
# 
# IDF down-weighs features which appear frequently in a corpus. This generally improves performance when using text as features since most frequent, and hence less important words, get down-weighed.


from pyspark.ml.feature import  IDF

idf = IDF(inputCol="rawFeatures", outputCol="features")


# ### StingIndexer
from pyspark.ml.feature import StringIndexer

indexer_Label = StringIndexer(inputCol="messageType", outputCol="label")


# ### Create list of preprocessing Pipeline Stages

preprocessiong_Stages = [tokenizer]+ [countVectorizer] + [idf] + [indexer_Label]


# ### Build Logistic Regression Classification Model

from pyspark.ml.classification import LogisticRegression

lr = LogisticRegression(labelCol="label", featuresCol="features")


from pyspark.ml import Pipeline


# Add random forest model to the list of pipeline stages

lr_Pipeline = Pipeline(stages=preprocessiong_Stages + [lr]) 

lr_Pipeline_model = lr_Pipeline.fit(data)


# ### Save the Pipeline Model

lr_Pipeline_model.save("/user/thomasj/StructuredStreamingKafka/Model/")

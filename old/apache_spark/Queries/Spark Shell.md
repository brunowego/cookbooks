# Shell Shell (Scala)

## Type

```scala
scala> :type spark
```

## Version

```scala
scala> spark.version
```

## Imports

```scala
scala> :imports
```

## Quit

```scala
scala> :q
```

## Data

### Input

Read a text file into a value:

```scala
scala> val textData = sc.textFile("file.txt")
```

Read a directory of text files into a value:

```scala
/* NOTE: Each row corresponds to a line */
scala> val textData = sc.textFile("/path/to/files*.txt")
```

Read whole text files into an rdd:

```scala
/* NOTE: Each row corresponds to a specific file, represented as (filename, content) */
scala> val fileData = sc.wholeTextFile("/path/of/files*.txt")
```

Read a sequence file into an rdd:

```scala
/* NOTE: How you read this data will be determined by how you wrote this data */
scala> sc.sequenceFile("path/to/sequence/files", classOf[org.apache.hadoop.io.Text], classOf[org.apache.hadoop.io.Text]) \
scala>   .map(x => (x._1.toString, x._2.toString))
```

Read a compressed sequence file into an rdd

```scala
/* NOTE: How you read this data will be determined by how you wrote this data */
scala> sc.sequenceFile("path/to/sequence/files", classOf[org.apache.hadoop.io.Text], classOf[org.apache.hadoop.io.Text], scala> classOf[org.apache.hadoop.io.compress.GzipCodec]) \
scala>   .map(x => (x._1.toString, x._2.toString))
```

### Output

Save as text file

```scala
scala> myRdd.saveAsTextFile("/path/to/file.txt")
```

Save as gzip compressed text file

```scala
scala> myRdd.saveAsTextFile("/text/file/path", classOf[org.apache.hadoop.io.compress.GzipCodec])
```

Save as sequence file

```scala
/*
 * NOTE: RDD must be formatted as org.apache.spark.rdd.RDD[(String, String)] in order to save as a sequence file
 * RDD[(Int, String)] or RDD[(String, Int)] are also acceptable
 * For Instance:
 */
scala> val sequenceRdd = myRdd.map(x => (x(0).toString, x(0) + "," + x(1) + "," + x(2)))
scala> myRdd.saveAsSequenceFile("/path/to/sequenceFile")
```

Save as Gzip Compressed sequence file

```scala
scala> sequenceRdd.saveAsSequenceFile("/path/to/sequence/files", Some(classOf[org.apache.hadoop.io.compress.GzipCodec]))
```

Save as object file

```scala
scala> myRdd.saveAsObjectFile("/path/to/object/file")
```

## RDD

### Actions

Count the lines in a text file

```scala
scala> textFile.count()
```

Return an array of the first n elements

```scala
scala> textFile.take(n)
```

Return n samples of the elements

```scala
scala> textFile.takeSample(n)
```

Return an array of all elements

```scala
scala> textFile.collect()
```

Get the first line of the text file

```scala
scala> textFile.first()
```

Reduce a mapped dataset

```scala
scala> myRdd.reduce((a, b) => a + b)
```

Count by key

```scala
scala> myRdd.countByKey()
```

For each

```scala
scala> myRdd.forEach(data => data.doSomething)
```

#### Double RDD

##### Sum

```scala
scala> myRdd.sum()
```

##### Mean

```scala
scala> myRdd.mean()
```

##### Variance

```scala
scala> myRdd.variance()
```

##### Std. Deviation

```scala
scala> myRdd.stddev()
```

### Transformations

Map and reduce data

```scala
scala> myRdd \
scala>   .map(line => line.split(" ").size) \
scala>   .reduce((a, b) => Math.max(a, b))
```

Filter lines according to lambda

```scala
scala> myRdd \
scala>   .filter(line => line.contains("spark"))
```

Flat map - one to many mapping

```scala
scala> myRdd \
scala>   .flatMap(line => line.split(" "))
```

Create an rdd that is a sampling of the original rdd

```scala
scala> myRdd.sample(n)
```

Combine two datasets

```scala
scala> myRdd.union(otherRdd)
```

Compute intersection of two datasets

```scala
scala> myRdd.intersection(otherRdd)
```

Compute the distinct elements in the rdd

```scala
scala> myRdd.distinct()
```

Cartesian (creates all combinations between the two sets)

```scala
scala> myRdd.cartesian(otherRdd)
```

Subtract - removes supplied elements (rdd2) from rdd1

```scala
scala> myRdd.subtract(otherRdd)
```

Zip (pairs up the sets)

```scala
scala> myRdd.zip(otherRdds)
```

### Key-wise transformations

Map values

```scala
scala> pairRdd.mapValues(val => val.upper())
```

Flat map values

```scala
scala> pairRdd.flatMapValues(val => val.split(" "))
```

Key by

```scala
scala> myRdd.keyBy(line => line.split(" ")(0))
```

Return keys

```scala
scala> pairRdd.keys()
```

Return values

```scala
scala> pairRdd.rows()
```

Count by key

```scala
scala> pairRdd.countByKey()
```

Reduce by key for key-value pairs

```scala
/* NOTE: Returns a tuple.  Function operates on value data */
scala> pairRdd.reduceByKey(a, b) => a + b)
```

Group by key

```scala
/* NOTE: Transforms (K, V) to (K, Iterable<V>) */
scala> pairRdd.groupByKey()
```

Aggregate by key

```scala
/* NOTE: Transforms (K, V) to (K, FUNC(V)) */
scala> pairRdd \
scala>   .aggregateByKey(0)((accum, v) => accum + v, (v1, v2) => v1 + v2)
```

Aggregate by Key Example

```scala
scala> var rddResult = productsDF.map(x=>(x(1).toString.toInt,x(4).toString.toDouble)).aggregateByKey \
scala>   ((0.0,0.0,0,9999999999999.0)) \
scala>   ( \
scala>   (x,y)=>(math.max(x._1,y),x._2+y,x._3+1,math.min(x._4,y)), \
scala>   (x,y)=>(math.max(x._1,y._1),x._2+y._2,x._3+y._3,math.min(x._4,y._4)) \
scala>   ) \
scala>   .map(x=> (x._1,x._2._1,(x._2._2/x._2._3),x._2._3,x._2._4)).sortBy(_._1, false);
scala> rddResult.collect().foreach(println);
```

Combine by Key Example

```scala
scala> joinedOrderDataDF
scala>   .map(x=> ((x(1).toString,x(3).toString),(x(8).toString.toFloat,x(0).toString)))
scala>   .combineByKey(
scala>     (x:(Float, String))=>(x._1,Set(x._2)),
scala>     (x:(Float,Set[String]),y:(Float,String))=>(x._1 + y._1,x._2+y._2),
scala>     (x:(Float,Set[String]),y:(Float,Set[String]))=>(x._1+y._1,x._2++y._2))
scala>   .map(x=> (x._1._1,x._1._2,x._2._1,x._2._2.size)).
```

Sort by key

Ascending

```scala
scala> pairRdd.sortByKey(true)
```

Descending

```scala
scala> pairRdd.sortByKey(false)
```

> NOTE: joins (K, V) with (K, W) as (K, (V, W))

Inner join

```scala
scala> pairRdd.join(otherPairRdd)
```

Left outer join

```scala
scala> pairRdd.leftOuterJoin(otherPairRdd)
```

Right outer join

```scala
scala> pairRdd.rightOuterJoin(otherPairRdd)
```

Full outer join

```scala
scala> pairRdd.fullOuterJoin(otherPairRdd)
```

Co-Group

```scala
/* NOTE: combines(K, V) and (K, W) by key, and returns (K, (Iterable<V>, Iterable<W>)) */
scala> pairRdd.coGroup(otherPairRdd)
```

### Passing named functions

Scala function

```scala
scala> def toUpper(s: String): String = {
scala>   return s.upper()
scala> }
```

toUpper function usage

```scala
scala> textFile.map(toUpper).take(2)
```

### Passing anonymous functions

Long form

```scala
scala> textFile.map(line => line.upper()).take(2)
```

Short form

```scala
scala> textFile.map(_.toUpper()).take(2)
```

## Self-contained applications

A simple scala spark app

`SimpleApp.scala`

```scala
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._
import org.apache.spark.SparkConf

object SimpleApp {
  def main(args: Array[String]) {
    val logFile = "YOUR_SPARK_HOME/README.md" // Should be some file on your system
    val conf = new SparkConf().setAppName("Simple Application")

    val sc = new SparkContext(conf)

    val logData = sc.textFile(logFile, 2).cache()
    val numAs = logData.filter(line => line.contains("a")).count()
    val numBs = logData.filter(line => line.contains("b")).count()
    println("Lines with a: %s, Lines with b: %s".format(numAs, numBs))

    sc.stop()
  }
}
```

Submitting your scala spark app with spark-submit

```sh
spark-submit \
  --class 'SimpleApp' \
  --master local[4] \
  path/to/spark/app.jar
```

## Misc spark commands

Parallelize a collection for use in spark

```scala
scala> val myArray = Array(1, 2, 3, 4)
scala> val myArrayRDD = sc.parallelize(myArray)
```

## Create sql/hive context

```scala
scala> val sqlCtx = new SQLContext(sc)
```

```scala
scala> val hiveCtx = new HiveContext(sc)
```

## Loading and saving dataframes

### Load operations

Load Generic DataFrame

```scala
scala> val df = sqlContext.read.load("/path/to/any/supported/file.type")
```

Load Avro

```scala
scala> import com.databricks.spark.avro._;
scala> val avroDF = sqlContext.read.avro("/path/to/avrofiles")
```

Load JSON

```scala
scala> val jsonDF = sqlContext.read.json("/path/to/some/jsonfiles")
```

Load parquet

```scala
scala> val parquetDF = sqlContext.read.parquet("/path/to/some/parquetfiles")
```

Load JDBC

```scala
scala> val accountsDF = sqlContext.load("jdbc", \
  Map("url"-> "jdbc:mysql://host:port/database?user=username&password=pass", "dbtable" -> "accounts"))
```

### Save operations

Write Avro

```scala
scala> import com.databricks.spark.avro._;
scala> df.write.avro("/path/to/my/saved/file.avro")
```

Write Compressed Avro

```scala
scala> import com.databricks.spark.avro._;
scala> sqlContext.setConf("spark.sql.avro.compression.codec", "<snappy, deflate, uncompressed>")
scala> df.write.avro("/save/path")
```

Write JSON

```scala
scala> df.toJSON.saveAsTextFile("/save/path")
```

Write Compressed JSON

```scala
scala> df.toJSON.saveAsTextFile("/save/path", classOf[org.apache.hadoop.io.compress.GzipCodec])
```

Write Parquet

```scala
scala> df.write.parquet("/save/path")
```

Write Compressed Parquet

```scala
scala> sqlContext.setConf("spark.sql.parquet.compression.codec", "g=<gzip, snappy, lzo, uncompressed")
scala> df.write.parquet("/save/path")
```

Write Optimized Row Columnar (ORC) data

```scala
scala> sequenceData.map(x => {var d = x._2.split("\t"); (d(0), d(1), d(2), d(3))}).toDF("col1", "col2", "col3", "col4").write.orc("/path/to/orcfiles")
```

Write JDBC

```scala
val prop = new java.util.Properties
prop.setProperty("driver", "com.mysql.jdbc.Driver")
prop.setProperty("user", "root")
prop.setProperty("password", "pw")

// JDBC MySQL URL
val url = "jdbc:mysql://host:port/database"

// Destination database table
val table = "tableName"

scala> df.write.mode().jdbc(url, table, prop)
```

Save as a Hive Table

```scala
/* NOTE: Only possible with HiveContext */
scala> df.write.format("parquet").mode(<append, overwrite, ignore>).saveAsTable("tableName")
```

## Basic dataframe operations

View a dataframe

```scala
scala> dataFrame.show(n)
```

Collect

```scala
scala> dataFrame.collect()
```

Take

```scala
scala> dataFrame.take(n)
```

Count

```scala
scala> dataFrame.count()
```

View the schema

```scala
scala> dataFrame.printSchema()
```

Select a column and show it

```scala
/* TODO: Slides say to use triple quotes.  This may be specific to HiveContext */
scala> dataFrame.select("name").show()
```

Select everybody, and increment age by 1

```scala
scala> dataFrame.select(dataFrame("name"), dataFrame("age") + 1).show()
```

Limit

```scala
scala> dataFrame.select(dataFrame("name"), dataFrame("age") + 1).limit(2).show()
```

Select using a filter

```scala
scala> dataFrame.filter(dataFrame("age") > 21).show()
```

Select using where

```scala
scala> dataFrame.select("age", "name").where("age > 10").show()
```

Sort data

```scala
scala> dataFrame.sort(dataFrame("name").asc)
```

Count by a column

```scala
scala> dataFrame.groupBy("age").count().show()
```

Convert an RDD to a DataFrame

```scala
scala> val someDataFrame = someRdd.toDF()
```

Convert a DataFrame to an RDD

```scala
scala> val someRdd = someDF.rdd
```

Register a temp table name to a dataframe

```scala
scala> someDF.registerTempTable("tableName")
```

Rename a column in a dataframe

```scala
scala> someDF.select(col("field1").alias("newName"), col("field2"), col("field3"))
```

Group by -> aggregation (very useful)

```scala
scala> someDF.
scala> 	.groupBy(to_date(from_unixtime(col("order_date")/1000)).alias("order_formatted_date"), col("order_status"))
scala> 	.agg(round(sum("order_item_subtotal"),2).alias("total_amount"), countDistinct("order_id").alias("total_orders"))
scala> 	.orderBy(col("order_formatted_date").desc, col("order_status"), col("total_amount").desc, col("total_orders"));
```

Timestamp to date handling

```scala
scala> val dates = ordersDF.select(to_date(from_unixtime(ordersDF("order_date"))).alias("date")).show
```

## Inferring dataframe schema using reflection

Create a class to represent the schema

```scala
scala> case class Person (name: String, age: Int)
```

Load data as RDD

```scala
scala> val people = sc.textFile("/some/text/file.txt").map(_.split(",")).map(p => Person(p(0), p(1).trim.toInt)).toDF()
```

Assign a table name

```scala
scala> people.registerTempTable("people")
```

Use a select statement to generate a new DataFrame

```scala
scala> people.sql("SELECT * FROM people WHERE age > 12 AND age < 20")
```

## Programmatic dataframe schema creation

Import Row.

```scala
import org.apache.spark.sql.Row;
```

Import Spark SQL data types

```scala
import org.apache.spark.sql.types.{StructType,StructField,StringType};
```

Load data as RDD

```scala
scala> val people = sc.textFile("/some/text/file.txt").map(_.split(",")).map(p => Row(p(0), p(1).trim))
```

Create a schema string

```scala
scala> val schemaString = "name age"
```

Generate the schema based on the string of schema

```scala
scala> val schema = \
scala>   StructType(schemaString.split(" ").map(fieldName => StructField(fieldName, StringType, true)))
```

Apply the schema to the RDD.

```scala
scala> val peopleDF = sqlContext.createDataFrame(people, schema)
```

Assign a table name

```scala
scala> peopleDF.registerTempTable("people")
```

Use a select statement to generate a new DataFrame

```scala
scala> people.sql("SELECT * FROM people WHERE age > 12 AND age < 20")
```

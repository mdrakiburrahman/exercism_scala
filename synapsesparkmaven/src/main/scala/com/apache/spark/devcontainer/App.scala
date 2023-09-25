package com.apache.spark.devcontainer

import scala.math.random
import org.apache.spark.sql.SparkSession

object SparkPi {
  def main(args: Array[String]): Unit = {

    println("Initiating Spark Session...")

    val builder = SparkSession.builder
      .appName("SparkPi")

    // Add in local spark config, if debug mode is enabled
    //
    val builderWithLocalConfig =
      if (sys.env.getOrElse("sparkmode", "") == "local") {
        println("SparkPi running in local mode")
        builder.config("spark.master", "local")
      } else {
        println("SparkPi running in cluster mode")
        builder
      }

    val spark = builderWithLocalConfig
      .getOrCreate()

    // Calculate Pi
    //
    val slices = if (args.length > 0) args(0).toInt else 2
    val n = math.min(100000L * slices, Int.MaxValue).toInt
    val count = spark.sparkContext
      .parallelize(1 until n, slices)
      .map { i =>
        val x = random * 2 - 1
        val y = random * 2 - 1
        if (x * x + y * y <= 1) 1 else 0
      }
      .reduce(_ + _)
    println(s"Pi is roughly ${4.0 * count / (n - 1)}")
    spark.stop()
  }
}

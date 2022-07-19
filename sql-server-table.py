# Databricks notebook source
# MAGIC %md
# MAGIC ##Variables

# COMMAND ----------

user_login = dbutils.secrets.get(scope = "eightfive-key-vault", key = "DBR-SQL-User-Login")
user_password = dbutils.secrets.get(scope = "eightfive-key-vault", key = "DBR-SQL-User-Password")

server = "eightfive-sql-***.database.windows.net"
database = "eightfive-sql-***"
table_read = "dbo.Iowa_Liquor_Sales"
table_read_write = "dbo.Iowa_Liquor_Sales_DBR"

# COMMAND ----------

# MAGIC %md
# MAGIC ##Post: Databricks — read/write to a SQL table

# COMMAND ----------

iowa_liquor_sales_df = spark.read.format("jdbc") \
    .option("url", f"jdbc:sqlserver://{server};databaseName={database};") \
    .option("dbtable", table) \
    .option("user", user_login) \
    .option("password", user_password) \
    .option("driver", "com.microsoft.sqlserver.jdbc.SQLServerDriver") \
    .load() \
    .limit(5)

display(iowa_liquor_sales_df)

# COMMAND ----------

from pyspark.sql.functions import col, lit
jdbcDF1 = jdbcDF.withColumn("ID", col("ID") + lit(100000))

# COMMAND ----------

jdbcDF1.write.mode("append").format("jdbc") \
    .option("url", f"jdbc:sqlserver://{server};databaseName={database};") \
    .option("dbtable", table) \
    .option("user", user_login) \
    .option("password", user_password) \
    .option("driver", "com.microsoft.sqlserver.jdbc.SQLServerDriver") \
    .save()

# COMMAND ----------

# MAGIC %md
# MAGIC ##Post: Databricks - reference a SQL table

# COMMAND ----------

spark.sql(f"""
    CREATE TABLE iowa.iowa_liquor_sales_DBR
    USING org.apache.spark.sql.jdbc 
    OPTIONS (
      url 'jdbc:sqlserver://{server};database=eightfive-sql-database', 
      dbtable '{table_read_write}', 
      user '{user_login}', 
      password '{user_password}' 
    )
"""
)

# COMMAND ----------

# MAGIC %sql
# MAGIC 
# MAGIC INSERT INTO iowa.iowa_liquor_sales_dbr
# MAGIC VALUES (150, 'S150', cast('2022-07-01' as date), 'Iowa', 'Iowa', 150)

# COMMAND ----------

iowaDF = spark.table("iowa.iowa_liquor_sales_DBR").filter(iowaDF.ID.isin([150, 151]))
display(iowaDF)

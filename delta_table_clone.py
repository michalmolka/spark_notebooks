# Databricks notebook source
# MAGIC %sql
# MAGIC CREATE OR REPLACE TABLE iowa.iowa_delta_deep_clone
# MAGIC DEEP CLONE iowa.iowa_delta
# MAGIC --VERSION AS OF <set-a-version>
# MAGIC --TIMESTAMP AS OF <set-a-timestamp>
# MAGIC LOCATION 'abfss://<container>@<dlsname>.dfs.core.windows.net/iowa_delta_deep_clone/'

# COMMAND ----------

# MAGIC %sql
# MAGIC CREATE OR REPLACE TABLE iowa.iowa_delta_shallow_clone
# MAGIC SHALLOW CLONE iowa.iowa_delta 
# MAGIC --VERSION AS OF <set-a-version>
# MAGIC --TIMESTAMP AS OF <set-a-timestamp>
# MAGIC LOCATION 'abfss://<container>@<dlsname>.dfs.core.windows.net/iowa_delta_shallow_clone/'

# COMMAND ----------

# MAGIC %sql
# MAGIC DESCRIBE TABLE EXTENDED iowa.iowa_delta_deep_clone

# COMMAND ----------

# MAGIC %sql
# MAGIC 
# MAGIC DESCRIBE TABLE EXTENDED iowa.iowa_delta_shallow_clone

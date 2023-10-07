import pandas as pd
import os
import gcsfs
from google.cloud import storage

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = "D:\Downloads\sqlcovidanalysis-5149e3b8b26a.json"
#path = r"SQL-Data-Analysis-Projects\Project 2 - SQL Data Cleaning\Nashville Housing Data.xlsx"
data = pd.read_excel("C:\\Users\\chaya\\Desktop\\SQL Data Analysis Projects\\SQL-Data-Analysis-Projects\\Project 2 - SQL Data Cleaning\\Nashville Housing Data.xlsx")

client = storage.Client()
bucket= client.get_bucket("nashville_raw")
bucket.blob('nashville_raw.csv').upload_from_string(data.to_csv(), 'text/csv')

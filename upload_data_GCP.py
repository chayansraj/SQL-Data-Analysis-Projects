import pandas as pd
import os
import gcsfs
from google.cloud import storage

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = "D:\Downloads\sqlcovidanalysis-5149e3b8b26a.json"
data = pd.read_excel('Nashville Housing Data.xlsx')

client = storage.Client()
bucket= client.get_bucket("nashville_raw")
bucket.blob('nashville_raw.csv').upload_from_string(data.to_csv(index=False, sep=','), 'text/csv')

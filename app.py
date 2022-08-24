#!/usr/bin/python3

import os
import json
from unittest import result
import sqlparse

import pandas as pd
import numpy as np

import connection_source
import conn_warehouse

def queryDB (param):
    query = sqlparse.format(
        open(
            path_query+param,'r'
            ).read(), strip_comments=True).strip()
    return query        

if __name__ == '__main__':
    print(f"[INFO] Service ETL is Starting .....")
    conn_dwh, engine_dwh  = conn_warehouse.conn()
    cursor_dwh = conn_dwh.cursor()

    conf = connection_source.config('postgresql')
    conn, engine = connection_source.psql_conn(conf)
    cursor = conn.cursor()

    path_query = os.getcwd()+'/query/'
   
    query1 = sqlparse.format(
        open(
            path_query+'insert_dim_users.sql', 'r'
            ).read(), strip_comments=True).strip()

    query2 = sqlparse.format(
        open(
            path_query+'insert_fact_orders.sql', 'r'
            ).read(), strip_comments=True).strip()

    query_dwh = sqlparse.format(
        open(
            path_query+'schema_dwh.sql','r'
            ).read(), strip_comments=True).strip()
      
    try:
        print(f"[INFO] Service ETL is Running .....")
        df1 = pd.read_sql(query1, engine)
        df2 = pd.read_sql(query2, engine)

        cursor_dwh.execute(query_dwh)
        conn_dwh.commit()
    
        df1.to_sql('dim_users', engine_dwh, if_exists='append', index=False)
        df2.to_sql('fact_orders', engine_dwh, if_exists='append', index=False )
        print(f"[INFO] Service Process  ETL is Success .....")

    except:
        print(f"[INFO] Service Process ETL is Failed .....")

    

    
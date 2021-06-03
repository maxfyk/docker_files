import os
import sys
import time
import MySQLdb
from redis import Redis


def get_cursor():
    """Returns database cursor"""
    try:
        mydb = MySQLdb.connect(
            host="database",
            password=os.environ['MYSQL_ROOT_PASS'],
            database='youpar'
        )
    except MySQLdb.Error as error:
        print(error)
        sys.exit("Error: Failed connecting to database")
    return mydb.cursor(), mydb


def get_redis():
    """Returns redis connection"""
    try:
        redis = Redis(host='redis', port=6379)
    except Redis.DoesNotExist as error:
        print(error)
        sys.exit("Error: Faild connecting to redis")
    return redis


def await_job(job, t=60):
    """Waits for job to be done"""
    for i in range(t):
        if job.result is None:
            time.sleep(1)
        else:
            pass

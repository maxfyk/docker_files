import os
import sys
import time
import MySQLdb
from redis import Redis
from rq import Queue


def get_cursor():
    """Returns database cursor"""
    try:
        mydb = MySQLdb.connect(
            host="database",
            password=os.environ['MYSQL_ROOT_PASS'],
            database='youpar',
            charset='utf8mb4',
            use_unicode=True
        )
    except MySQLdb.Error as error:
        print(error)
        return False, False
        # sys.exit("Error: Failed connecting to database")
    return mydb.cursor(), mydb


def get_redis():
    """Returns redis connection"""
    try:
        redis = Redis(host='redis', port=6379)
    except Redis.DoesNotExist as error:
        print(error)
        return False, False
        # sys.exit("Error: Faild connecting to redis")
    return redis


def await_job(job, t=60):
    """Waits for job to be done"""
    t = t * 10
    for i in range(t):
        if job.result is None:
            time.sleep(0.1)
        else:
            return True

from airflow import DAG
from airflow.decorators import task
from datetime import datetime

with DAG(
         dag_id = 'test',
         schedule = '@daily',
         start_date = datetime(2023,7,5,2),
         catchup = False
):

    @task
    def task1(name):
        print(f"{name}")
    
    @task
    def task2():
        print("Hi2")
        return 'Vikas'
    
    
    task1(task2())

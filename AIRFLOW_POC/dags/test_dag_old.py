from airflow import DAG
from airflow.decorators import task
from airflow.operators.python import PythonOperator
from datetime import datetime


with DAG(
     dag_id = 'test_dag_old',
     schedule='@daily',
     start_date = datetime(2023,7,5,1),
     catchup = False
) as d:


    def test1():
        print("Hello Airflow")
        return 'Vikas'

    def test2(ti):
        data = ti.xcom_pull(task_ids='t1')
        print(f"It's {data}")


    t1 = PythonOperator(
         task_id = 't1',
         python_callable = test1
    )
    
    t2 = PythonOperator(
         task_id = 't2',
         python_callable = test2
    )
    
    t1>>t2

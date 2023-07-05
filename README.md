# airflow_poc
Create data pipelines using airflow. 

#Airflow Notes

Airflow.

— Job orchestration. 
— Open source platform to programmatically author, schedule & monitor workflows. 
— Core components —>  
     1. Web Server - It’s python flask web server that allows you to access UI. 
     2. Scheduler - To schedule your tasks/data pipeline. 
    3. Megastore - DB to store metadata, SQLAlchemy compatible db like Postgresql/Mysql/SQL Server - It stores metadata related your data pipeline/tasks. 
    4. Triggerer - Run specific kinds of tasks. 
   5.  Executor(part of scheduler) - It doesn’t executes a task but It defines how and on which support your tasks are executed. For example, if you have a Kubernetes cluster, you want to execute your tasks on this Kubernetes cluster, you will use the KubernetesExecutor.
   6. Queue - To excuses tasks in correct order. 

— Core Concepts
    1. DAG -  It’s a graph with nodes, directed edges & no cycles. 
   2. Operator - It’s a task - It’s way to encapsulate what you want to do.  When you run a operator, you get a task instance. 
        3 Types of operator -
        I) Action operator - It executes something. - e.g. PythonOperator. 
        ii) Transfer Operator - They allow you to transfer data from point A to point B. - e.g. from MySQL to Redshift. 
        iii) Sensor Operators - They allow you to wait for something to happen. 

— Airflow is not 
    I) Data streaming solution. 
    ii) Data processor framework. 


Multi Node Architecture -
— Node 1 will have Web server & scheduler & executor. 
— Node 2 will have megastore & queue. 
— And multiple worker nodes (machines on which tasks will be executed.)
— In every node you have Airflow worker that you run with the command. 
— Web Server exchange data with the metadatabase and the Executor sends tasks to execute to the Queue in order to execute them in the right order, & finally workers, Airflow workers pull the task from the queue and execute the tasks.
— If you need more resources to execute the tasks, you just need to add new Airflow worker on new machine. 
— First you create a new DAG, dag.py & put that file into the folder DAGS. Scheduler parses this folder every 5 minutes by default to detect new DAGs. For modifications in existing tags, scheduler parses for modifications every 30 seconds. 
— Next schedular runs a DAG & for that it creates a DAG run object with the status Running.  —> then starts tasks execution within a DAG. 
— SO when you run a DAG, that DAG has DAG run with the state Queued  & then Success or Failed. 

Installation - Since Airflow 2.0 requires python version above 3.6. 
Airflow uses constraint files to enable reproducible installation, so using PIP & constraint file is recommended. 
1. Install Airflow locally - from airflow official GitHub repo - https://github.com/apache/airflow
   pip install 'apache-airflow==2.6.2' \
 --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-2.6.2/constraints-3.9.txt"
2. Set Airflow Home
    Airflow requires a home directory, and uses ~/airflow by default, but you can set a different location if you prefer. The AIRFLOW_HOME environment variable is used to inform Airflow of the desired location.
3. Change db connection in airflow.cfg file by changing property sql_alchemy_conn under [database] section to actual db like Postgres —>  sql_alchemy_conn = “postgresql+psycopg2://vikas.garud:postgres@localhost/airflow”
4. Initialise DB —> airflow db init
5. Start web server —> airflow webserver -p 8080
6. If error occurs do —> airflow db upgrade
7. Now web page will open at 0.0.0.0:8080/home
8. Add user with role & cress —> airflow users add
9. Open UI & login — It will show scheduler is not running. 
10. Start scheduler in new terminal —> airflow scheduler. 
11. To close example days set —> load_examples = False in airflow.cfg file. 



Production Deployment
1. Airflow comes with sqLite backend by default - configure it to external db. 
2. Airflow uses SequentialExecutor by default but it’s limited to executing one task at a time. For production use Kubertnetes executor or celery executor. 

Once you have configured the executor, it is necessary to make sure that every node in the cluster contains the same configuration and DAGs. Airflow sends simple instructions such as “execute task X of DAG Y”, but does not send any DAG files or configuration. You can use a simple cronjob or any other mechanism to sync DAGs and configs across your nodes, e.g., checkout DAGs from git repo every 5 minutes on all nodes.

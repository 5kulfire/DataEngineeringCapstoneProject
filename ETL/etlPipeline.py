#imports
from datetime import timedelta
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.utils.dates import days_ago

#DAG arguments
default_args = {
    'owner' : 'Rishabh Singh',
    'start_date' : days_ago(0),
    'email' : 'abc@xyz.com',
    'email_on_failure': True,
    'email_on_retry' : True,
    'retries' : 1,
    'retry_delay' : timedelta(minutes=5),
}

#DAG definition
dag = DAG(
    'process_web_log',
    default_args = default_args,
    description = 'This DAG analyzes the web server log file, and does ETL on data'
    schedule_interval = "@daily",
)

#Extract task
extract_data = BashOperator(
    task_id = 'extract_data',
    bash_command = 'cut -d "-" -f1 accesslog.txt > extracted_data.txt',
    dag = dag,
)

#Transform task
transform_data = BashOperator(
    task_id = 'transform_data',
    bash_command = 'sed "/198.46.149.143/d" extracted_data.txt > transformed_data.txt ',
    dag = dag,
)

#Load task
load_data = BashOperator(
    task_id = 'load_data',
    bash_command = 'tar cvf weblog.tar transformed_data.txt',
    dag = dag,
)

#Task pipeline

extract_data >> transform_data >> load_data
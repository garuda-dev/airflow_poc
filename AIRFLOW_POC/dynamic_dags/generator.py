from jinja2 import Environment,FileSystemLoader
import yaml
import os
import json


file_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
dag_dir = os.path.join(file_dir,'dags')

env = Environment(loader=FileSystemLoader(os.path.join(file_dir,'dynamic_dags')))
template = env.get_template('template_dag.jinja2') 

for file in os.listdir(os.path.join(file_dir,'dynamic_dags')):
    if file.endswith('.yaml'):
        with open(file,"r") as configfile:
            config = yaml.safe_load(configfile)
            with open(os.path.join(dag_dir,f"dag_job{config['dag_id']}.py"),"w") as f:
                f.write(template.render(config))
        








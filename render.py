#!/usr/bin/python
import jinja2
from jinja2 import Template
import json
import os

input_data = dict()

latex_jinja_env = jinja2.Environment(
	block_start_string = '\BLOCK{',
	block_end_string = '}',
	variable_start_string = '\VAR{',
	variable_end_string = '}',
	comment_start_string = '\#{',
	comment_end_string = '}',
	line_statement_prefix = '%%',
	line_comment_prefix = '%#',
	trim_blocks = True,
	autoescape = False,
	loader = jinja2.FileSystemLoader(os.path.abspath('.'))
)

def load_config():
    global input_data
    with open("config.json", "r") as f:
        input_data = json.load(f)


def render_index():
    with open('./template/index.html', "r") as f:
        tmpl = Template(f.read()).render(data=input_data)
        f.close()
        with open("index.html", "w+") as fh:
            fh.write(tmpl)
            fh.close()


def render_latex():
    tmpl = latex_jinja_env.get_template('./template/resume.tex')
    with open("resume.tex", "w+") as fh:
        fh.write(tmpl.render(data=input_data))
        fh.close()


def main():
    load_config()
    render_index()
    render_latex()


if __name__ == "__main__":
    main()

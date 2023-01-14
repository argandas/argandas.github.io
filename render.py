#!/usr/bin/python
import jinja2
from jinja2 import Template
import json
import os

input_data = dict()

std_jinja_env = jinja2.Environment(
    loader = jinja2.FileSystemLoader(os.path.abspath('.'))
)

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

def load_config(config_file):
    global input_data
    with open(config_file, "r") as f:
        input_data = json.load(f)


def render_file(template, dst):
    tmpl = std_jinja_env.get_template(template)
    with open(dst, "w+") as fh:
        fh.write(tmpl.render(data=input_data))
        fh.close()


def render_latex(template, dst):
    tmpl = latex_jinja_env.get_template(template)
    with open(dst, "w+") as fh:
        fh.write(tmpl.render(data=input_data))
        fh.close()


def main():
    load_config('config.json')
    render_file('./template/index.html', './index.html')
    render_latex('./template/resume.tex', './resume.tex')


if __name__ == "__main__":
    main()

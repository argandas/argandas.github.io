#!/usr/bin/python
import jinja2
import json
import os
import hashlib
import datetime

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


def parse_date(old_date):
    date_format = '%Y-%m-%d'
    new_date = ""
    try:
        new_date = datetime.datetime.strptime(old_date, date_format).date().strftime("%b %Y")
    except ValueError:
        print(f"[Warning] Failed to parse date: \"{old_date}\"")
        new_date = old_date
    return new_date


def load_config(config_file):
    global input_data
    with open(config_file, "r") as f:
        input_data = json.load(f)
    if 'basics' in input_data:
        if 'email' in input_data['basics']:
            email = input_data['basics']['email']
            input_data['artifacts']['gravatar'] = f"http://www.gravatar.com/avatar/{hashlib.md5(email.encode('utf-8')).hexdigest()}?s=256"
    if 'work' in input_data:
        for idx, val in enumerate(input_data['work']):
            input_data['work'][idx]['startDate'] = parse_date(val['startDate'])
            input_data['work'][idx]['endDate'] = parse_date(val['endDate'])
    if 'education' in input_data:
        for idx, val in enumerate(input_data['education']):
            input_data['education'][idx]['startDate'] = parse_date(val['startDate'])
            input_data['education'][idx]['endDate'] = parse_date(val['endDate'])


def render_file(template, dst):
    tmpl = std_jinja_env.get_template(template)
    with open(dst, "w+") as fh:
        fh.write(tmpl.render(data=input_data))
        fh.close()


def replace_percentage_recursive(data, replacement_char):
    if isinstance(data, dict):
        for key, value in data.items():
            if isinstance(value, (dict, list)):
                data[key] = replace_percentage_recursive(value, replacement_char)
            elif isinstance(value, str) and '%' in value:
                data[key] = value.replace('%', replacement_char)
    elif isinstance(data, list):
        for i, item in enumerate(data):
            if isinstance(item, (dict, list)):
                data[i] = replace_percentage_recursive(item, replacement_char)
            elif isinstance(item, str) and '%' in item:
                data[i] = item.replace('%', replacement_char)
    return data

def render_latex(template, dst):
    tmpl = latex_jinja_env.get_template(template)
    with open(dst, "w+") as fh:
        test_data = replace_percentage_recursive(input_data, "\%")
        fh.write(tmpl.render(data=test_data))
        fh.close()


def main():
    load_config('./resume.json')
    render_file('./template/index.html', './index.html')
    render_latex('./template/resume.tex', './resume.tex')


if __name__ == "__main__":
    main()

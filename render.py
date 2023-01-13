#!/usr/bin/python
from jinja2 import Template
import json


input_data = dict()


def load_config():
    global input_data
    with open("config.json", "r") as f:
        input_data = json.load(f)


def render_index():
    with open('./template/index.html', "r") as f:
        tmpl = Template(f.read()).render(
            data=input_data
        )
        f.close()
        with open("index.html", "w+") as fh:
            fh.write(tmpl)
            fh.close()


def main():
    load_config()
    render_index()


if __name__ == "__main__":
    main()

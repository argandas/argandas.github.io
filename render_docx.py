#!/usr/bin/python
import argparse
import datetime
import json
import os

import jinja2


def parse_date(old_date: str) -> str:
    date_format = "%Y-%m-%d"
    try:
        return datetime.datetime.strptime(old_date, date_format).date().strftime("%b %Y")
    except ValueError:
        return old_date


def parse_date_year(old_date: str) -> str:
    date_format = "%Y-%m-%d"
    try:
        return datetime.datetime.strptime(old_date, date_format).date().strftime("%Y")
    except ValueError:
        return old_date


def load_config(config_file: str) -> dict:
    with open(config_file, "r", encoding="utf-8") as f:
        input_data = json.load(f)

    if "work" in input_data:
        for idx, val in enumerate(input_data["work"]):
            input_data["work"][idx]["startDate"] = parse_date(val["startDate"])
            input_data["work"][idx]["endDate"] = parse_date(val["endDate"])

    if "education" in input_data:
        for idx, val in enumerate(input_data["education"]):
            input_data["education"][idx]["startDate"] = parse_date_year(val["startDate"])
            input_data["education"][idx]["endDate"] = parse_date_year(val["endDate"])

    return input_data


def main() -> None:
    parser = argparse.ArgumentParser(description="Render markdown resume for DOCX conversion")
    parser.add_argument("--input", default="./resume.json", help="Path to resume JSON")
    parser.add_argument("--template", default="./templates/resume_docx.md", help="Path to markdown Jinja template")
    parser.add_argument("--out", default="./.build/resume.md", help="Rendered markdown output path")
    args = parser.parse_args()

    os.makedirs(os.path.dirname(args.out), exist_ok=True)
    data = load_config(args.input)

    env = jinja2.Environment(loader=jinja2.FileSystemLoader(os.path.abspath(".")))
    tmpl = env.get_template(args.template)
    with open(args.out, "w", encoding="utf-8") as f:
        f.write(tmpl.render(data=data))


if __name__ == "__main__":
    main()

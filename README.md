

# Hugo Arganda - Resume

[![GitHub Releases](https://badgen.net/github/tag/argandas/argandas.github.io)](https://github.com/argandas/argandas.github.io/releases)
[![build](https://github.com/argandas/argandas.github.io/workflows/build/badge.svg)](https://github.com/argandas/argandas.github.io/actions/workflows/build.yml)
[![release](https://github.com/argandas/argandas.github.io/workflows/release/badge.svg)](https://github.com/argandas/argandas.github.io/actions/workflows/release.yml)
[![PDF Download](https://img.shields.io/badge/Download-PDF-red.svg)](https://github.com/argandas/argandas.github.io/releases/latest/download/resume.pdf)
[![License](https://img.shields.io/badge/License-CC_BY--SA_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)

## How to use

You can configure the resume content by updating resume.json, once you have finished, execute the render script

```bash
python3 -m pip install -r requirements.txt
python3 render.py
```

This will generate/update the index.html and resume.tex files.

### HTML Version

The resume HTML file (index.html) will be hosted by github.io to render an static web page for free, for more information please visit [GitHub Pages](https://pages.github.com/).

The template use Gravatar for the profile picture, for more information please check out [Gravatar](https://en.gravatar.com/).

### PDF Version

The resume PDF file is created by a GitHub workflow (.github/workflows/release.yml) using the LaTex document preparation system.

The release workflow use the resume.tex file as input and returns resume.pdf .

The release workflow is triggered when pushing a git tag (e.g. v1.0.0) and will upload the PDF file as release artifact.

```bash
git tag v1.0.0
git push origin v1.0.0
```





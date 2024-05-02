

# Hugo Arganda - Resume

[![GitHub Releases](https://badgen.net/github/tag/argandas/argandas.github.io)](https://github.com/argandas/argandas.github.io/releases)
[![build](https://github.com/argandas/argandas.github.io/workflows/build/badge.svg)](https://github.com/argandas/argandas.github.io/actions/workflows/build.yml)
[![PDF Download](https://img.shields.io/badge/Download-PDF-red.svg)](https://github.com/argandas/argandas.github.io/releases/latest/download/resume.pdf)
[![License](https://img.shields.io/badge/License-CC_BY--SA_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)

## How to use

Modify resume content by updating the JSON file (resume.json), once you have finished push the changes and then the GitHub workflow will generate the resume artifacts (HTML and PDF).

### HTML Version

The generated HTML file (index.html) will be hosted by github.io to render a static web page for free, for more information please visit [GitHub Pages](https://pages.github.com/).

The HTML template uses Gravatar for the profile picture, for more information please check out [Gravatar](https://en.gravatar.com/).

### PDF Version

The resume PDF file is created by a GitHub workflow using the LaTex document preparation system.

The release workflow uses the generated LaTex file (resume.tex) to create the PDF file as a release artifact (resume.pdf) when pushing a git tag (e.g. v1.0.0).

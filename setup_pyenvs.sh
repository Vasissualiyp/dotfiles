#!/usr/bin/env bash

cd "$HOME"
mkdir env
cd env
python -m venv venv
source venv/bin/activate
pip install pybibget arxiv pynvim

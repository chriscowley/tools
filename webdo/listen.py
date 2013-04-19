#!/usr/bin/env python

from flask import Flask, request
import subprocess
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('-s', '--script', required=True)
args = parser.parse_args()
script =  args.script
print script
app = Flask(__name__)

@app.route('/',methods=['POST'])
def foo():
    process = subprocess.Popen(script, shell=True, stdout=subprocess.PIPE)
    process.wait()
    return "OK"

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)

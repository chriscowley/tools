#!/usr/bin/env python

from flask import Flask, request
import subprocess

app = Flask(__name__)

@app.route('/',methods=['POST'])
def foo():
    process = subprocess.Popen('/usr/local/bin/cv-update', shell=True, stdout=subprocess.PIPE)

    process.wait()
    print process.returncode
    return "OK"

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)

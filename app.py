from flask import Flask
import os
app = Flask(__name__)

@app.route('/')
def hostname():
    return os.getenv("HOSTNAME", default="NOT_FOUND")

if __name__ == '__main__':
    app.run(host='0.0.0.0')
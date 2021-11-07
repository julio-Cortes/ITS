import os

from flask import Flask, send_from_directory
from flask import request
import flask_cors
import gunicorn
from flask_cors import CORS, cross_origin

app = Flask(__name__, static_folder='client/build', static_url_path='')
cors = CORS(app)


@app.route('/api')
@cross_origin()
def Welcome():
    return "Welcome to the API!!!"


@app.route('/')
def serve():
    return send_from_directory(app.static_folder, 'index.html')


@app.route("/api/webhook")
@cross_origin()
def get_webhook():
    print(request.json)


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=False, port=int(os.environ.get("PORT", 5000)))

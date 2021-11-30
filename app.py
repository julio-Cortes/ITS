import os

import requests
from flask import Flask, send_from_directory
from flask import request
import flask_cors
import gunicorn
from flask_cors import CORS, cross_origin
from Its import Its
from json import load

app = Flask(__name__, static_folder='client/build', static_url_path='')
cors = CORS(app)
BOT_URL = f'https://api.telegram.org/bot2110362248:AAFipt4bqziQLmmqmSdaCaw8e08L5UZYJCI/'
"""https://api.telegram.org/bot{my_bot_token}/setWebhook?url="""
params = ""
with open("params.json") as params_file:
    params = load(params_file)

its = Its(params)


@app.route("/api/questions", methods=['POST'])
@crossdomain(origin='*',headers=['access-control-allow-origin','Content-Type'])
def questions():
    data = request.json
    return its.post_questions(data)


@app.route("/api/users", methods=['GET'])
@crossdomain(origin='*',headers=['access-control-allow-origin','Content-Type'])
def users():
    return its.get_users()


@app.route("/api/modules", methods=['GET'])
@crossdomain(origin='*',headers=['access-control-allow-origin','Content-Type'])
def modules():
    return its.get_modules()


@app.route('/api')
@crossdomain(origin='*',headers=['access-control-allow-origin','Content-Type'])
def Welcome():
    return "Welcome to the API!!!"


@app.route("/api/webhook", methods=['POST'])
@crossdomain(origin='*',headers=['access-control-allow-origin','Content-Type'])
def get_webhook():
    data = request.json

    print(data)
    if "message" in data:  # Comment to hide what Telegram is sending you
        json_data = its.process_message(data)

        message_url = BOT_URL + 'sendMessage'
        print(json_data)
        print(message_url)
        print(requests.post(message_url, json=json_data))

        return json_data, 200
    return {}, 200


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=False, port=int(os.environ.get("PORT", 8080)))

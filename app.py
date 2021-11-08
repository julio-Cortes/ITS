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

params = ""
with open("params.json") as params_file:
    params = load(params_file)

its = Its(params)


@app.route('/api')
@cross_origin()
def Welcome():
    return "Welcome to the API!!!"


@app.route('/')
def serve():
    return send_from_directory(app.static_folder, 'index.html')


@app.route("/api/webhook", methods=['POST'])
@cross_origin()
def get_webhook():
    data = request.json

    print(data)  # Comment to hide what Telegram is sending you
    chat_id = data['message']['chat']['id']
    question = its.send_question()
    json_data = {
        "chat_id": chat_id,
        "parse_mode": "MarkdownV2",
        "text":question["Question"],
        "reply_markup": {"keyboard": question["Alternatives"],
                         "resize_keyboard": True,
                         "one_time_keyboard": True
                         }

    }

    message_url = BOT_URL + 'sendMessage'
    print(json_data)
    print(message_url)
    requests.post(message_url, json=json_data)
    return json_data, 200


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=False, port=int(os.environ.get("PORT", 8080)))

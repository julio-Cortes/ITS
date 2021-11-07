import os

import requests
from flask import Flask, send_from_directory
from flask import request
import flask_cors
import gunicorn
from flask_cors import CORS, cross_origin

app = Flask(__name__, static_folder='client/build', static_url_path='')
cors = CORS(app)
BOT_URL = f'https://api.telegram.org/bot2110362248:AAFipt4bqziQLmmqmSdaCaw8e08L5UZYJCI/'

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
    data = request.json

    print(data)  # Comment to hide what Telegram is sending you
    chat_id = data['message']['chat']['id']
    message = data['message']['text']

    json_data = {
        "chat_id": chat_id,
        "text": message,
    }

    message_url = BOT_URL + 'sendMessage'
    print(json_data)
    requests.post(message_url, json=json_data)


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=False, port=int(os.environ.get("PORT", 5000)))

import random
import requests
from dbInterface import dbInterface


class Its:
    def __init__(self, params):
        self.questions = params["Questions"]
        self.db = dbInterface()

    def sendAction(self, action):
        self.db.sendAction(action)

    def getActions(self):
        return self.db.getActions()

    def get_modules(self):
        return self.db.get_modules()

    def get_users(self):
        return self.db.get_users()


    def send_question(self):
        return random.choice(self.questions)

    def process_message(self, data):
        chat_id = data['message']['chat']['id']
        message = data["message"]["text"]
        json_data = {"chat_id": chat_id,
                     "parse_mode": "markdown",
                     }
        first_name = data["message"]["from"]["first_name"]
        last_name = data["message"]["from"]["last_name"]
        exist = self.db.check_user_exist(chat_id, first_name, last_name)
        if message == "/start":  # USUARIO NUEVO
            if exist:
                json_data["text"] = "Envia el comnado /help para pedir los comandos disponibles"
            else:
                self.db.new_user(chat_id, first_name, last_name)
                json_data["text"] = "Bienvenido al bot para aprender SQL los comandos disponibles son:" \
                                    "\n1./question para pedir la pregunta actual" \
                                    "\n2./hint para pedir una pista de la pregunta actual" \
                                    "\n4./help para pedir los comandos disponibles"
        elif not exist:
            json_data["text"] = "Envie el comando /start para empezar"
        elif message == "/hint":  # PISTA
            json_data["text"] = self.db.get_hint(chat_id)
        elif message == "/question":
            json_data["text"] = self.db.get_question(chat_id)
            reply = self.db.get_alternatives(chat_id)
            if reply != "":
                json_data["reply_markup"] = {"keyboard":reply,
                         "resize_keyboard": True,
                         "one_time_keyboard": True
                         }

        elif message == "/help":
            json_data['text'] = "Los comandos disponibles son:" \
                                "\n1./question para pedir la pregunta actual" \
                                "\n2./hint para pedir una pista de la pregunta actual" \
                                "\n4./help para pedir los comandos disponibles"
        else: # Contesto
            json_data["text"] = self.db.check_answer_correct(chat_id, message)

        print(json_data)
        return json_data


    def post_questions(self,data):
        return self.db.post_questions(data)
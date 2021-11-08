import random

class Its:
    def __init__(self, params):
        self.questions = params["Questions"]
        
    def send_question(self):
        return random.choice(self.questions)
    
    def check_answer(self):
        pass

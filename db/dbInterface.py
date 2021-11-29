import psycopg2 as pg


class dbInterface:

    def __init__(self):
        self.db_name = "ddmrho8k1e2bab"
        self.db_user = "ttdqdxknkanrsg"
        self.db_host = "ec2-3-229-127-203.compute-1.amazonaws.com"
        self.db_port = "5432"
        self.db_password = "dad2c30f394166d80045ff8b5857c0b43856f4d37a48669ee41cd5aaef592e8f"
        self.conn = None
        self.cursor = None

    def connect(self):
        self.conn = pg.connect(database=self.db_name, user=self.db_user, host=self.db_host, port=self.db_port,
                               password=self.db_pswd)
        self.cursor = self.conn.cursor()

    def close_connection(self):
        self.cursor.close()
        self.conn.close()

    def execute(self, query):
        self.cursor.execute(query)
        results = self.cursor.fetchall()
        if len(results) > 0:
            return results
        return None

    def check_user_exist(self, id, first_name, last_name):
        self.connect()
        query = f"SELECT * FROM USERS where id={id}"
        results = self.execute(query)
        self.close_connection()
        if results is not None:
            return True
        else:
            self.new_user(id, first_name, last_name)
            return False

    def new_user(self, id, first_name, last_name):
        self.connect()
        query = f"INSERT INTO USERS(id, first_name, last_name,approved, current_module_id, " \
                f") VALUES ({id}, {first_name},{last_name}, false, 1);"
        self.execute(query)
        self.create_submodules_user(id, 1)
        self.close_connection()

    def pass_module(self, user_id):
        self.connect()
        query = f"UPDATE USERS set current_module_id = current_module_id + 1 WHERE id = {user_id};"
        self.execute(query)
        query1 = f"SELECT current_module_id from users where id = {user_id}"
        res = self.execute(query1)
        if res is not None:
            res = res[0][0]
            self.create_submodules_user(user_id, res)

    def create_submodules_user(self, user_id, current_submodule):
        query2 = f"SELECT id from submodules where module_id = {current_submodule}"
        if query2 is not None:
            aux_query = ""
            for item in query2:
                aux_query += f"INSERT INTO usersubmodules (user_id, submodule_id, current_score) VALUES ({user_id}, " \
                             f"{item[0]},0) "

    def pick_new_question(self, user_id):
        pass

    def check_answer_correct(self, user_id):
        pass

    def update_score(self, user_id):
        pass



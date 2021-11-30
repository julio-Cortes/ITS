import psycopg2 as pg

import json


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
                               password=self.db_password)
        self.conn.autocommit = True
        self.cursor = self.conn.cursor()

    def close_connection(self):
        self.cursor.close()
        self.conn.close()

    def execute(self, query, ret):
        self.cursor.execute(query)

        if ret:
            results = self.cursor.fetchall()
            if len(results) > 0:
                return results

        return None

    def check_user_exist(self, id, first_name, last_name):
        self.connect()
        query = f"SELECT * FROM USERS where id={id}"
        results = self.execute(query, True)
        self.close_connection()
        if results is not None:
            return True
        else:
            return False

    def new_user(self, id, first_name, last_name):
        self.connect()
        query = f"INSERT INTO USERS(id, first_name, last_name,approved, current_module_id " \
                f") VALUES ({id}, '{first_name}','{last_name}', false, 1);" \
                f""
        self.execute(query, False)
        self.pick_new_question(id)
        self.close_connection()

    def check_module(self, user_id):
        pass

    def pass_module(self, user_id):
        query2 = f"SELECT current_module_id from users where id = {user_id}"
        res = self.execute(query2, True)
        if res is not None:
            res = res[0][0]
            if res == 5:
                self.execute(f"UPDATE users set approved=true WHERE id = {user_id};", False)
            else:
                query = f"UPDATE USERS set current_module_id = current_module_id + 1 WHERE id = {user_id};" \
                        f"UPDATE USERS set current_module_score = 0  WHERE id = {user_id};" \
                        f"UPDATE users set last_question_id = null, penultimate_question_id = null"

                self.execute(query, False)

    def pick_new_question(self, user_id):
        query = f"SELECT current_module_score, current_module_id, last_question_id, penultimate_question_id FROM " \
                f"users where id={user_id};"
        questions = f"SELECT question_id from userquestions where user_id = {user_id} and correct = true"
        result = self.execute(query, True)
        questions_results = self.execute(questions, True)
        if result is not None:
            score, module, last_question_id, penultimate_question_id = result[0]
            difficulty = 1
            if questions_results is not None:
                questions_results = [i[0] for i in questions_results]
                questions_results.append(0)
                questions_results = "(" + ",".join(str(i) for i in questions_results)
                questions_results += ")"

                difficulty = 1
                if score >= 30:
                    difficulty = 2
                if score >= 60:
                    difficulty = 3
                if score >= 90:
                    self.pass_module(user_id)
            else:
                questions_results = (0, 0)
            self.check_questions_for_assignment(last_question_id, penultimate_question_id, module, difficulty,
                                                questions_results, user_id)

    def check_questions_for_assignment(self, last_question_id, penultimate_question_id, module, difficulty,
                                       questions_results, user_id):
        if last_question_id is None:
            query1 = f"SELECT id from questions where difficulty = 1 and id not in {questions_results} and module_id = {module}" \
                     f"order by random() limit 1;"
            question = self.execute(query1, True)
            if question is not None:
                question = question[0][0]
                query2 = f"UPDATE USERS set last_question_id= {question} where id={user_id}; " \
                         f"INSERT INTO userquestions (user_id, question_id) values ({user_id}, {question});"
                self.execute(query2, False)
        elif penultimate_question_id is None:
            query1 = f"SELECT id from questions where difficulty = 1 and id not in {questions_results} and module_id = {module}" \
                     f"order by random() limit 1;"
            question = self.execute(query1, True)
            if question is not None:
                question = question[0][0]
                query2 = f"UPDATE USERS set penultimate_question_id=last_question_id, last_question_id= {question} " \
                         f"where id={user_id};" \
                         f"INSERT INTO userquestions (user_id, question_id) values ({user_id}, {question});"
                self.execute(query2, False)
        else:
            query_question = f"SELECT type from questions where id = {last_question_id}"
            query_question2 = f"SELECT type from questions where id = {penultimate_question_id}"
            query_question = self.execute(query_question, True)
            query_question2 = self.execute(query_question2, True)
            if query_question is not None and query_question2 is not None:
                query_question, query_question2 = query_question[0][0], query_question2[0][0]
                if query_question == query_question2:
                    if query_question == 2:
                        type = 2
                    else:
                        type = 1
                    query3 = f"SELECT id from questions where difficulty = {difficulty} and type = {type} and " \
                             f"module_id={module} and id not in {questions_results} order by random() limit 1;"
                else:
                    query3 = f"SELECT id from questions where difficulty = {difficulty} and module_id={module} and" \
                             f" module_id = {module} " \
                             f"and id not in {questions_results} order by random() limit 1;"
                question = self.execute(query3, True)
                if question is not None:
                    question = question[0][0]
                    query4 = f"UPDATE USERS set penultimate_question_id=last_question_id, last_question_id= " \
                             f"{question}  where id={user_id};" \
                             f"INSERT INTO userquestions (user_id, question_id) values ({user_id}, {question});"
                    self.execute(query4, False)
                else:
                    self.pass_module(user_id)
                    self.pick_new_question(user_id)

    def check_answer_correct(self, user_id, anwser):
        val = 0
        self.connect()
        query = f"SELECT last_question_id from users where id={user_id}"
        res = self.execute(query, True)
        if res is not None:
            res = res[0][0]
            query2 = f"SELECT type, query from questions where id={res} order by id desc limit 1;"

            result2 = self.execute(query2, True)

            if result2 is not None:
                type, query = result2[0]
                query4 = f"SELECT id, hint from userquestions where user_id={user_id} and question_id={res} order by " \
                         f"id desc limit 1;"
                result4 = self.execute(query4, True)
                if type == 2:
                    val = 5
                    query3 = f"SELECT text from alternatives where question_id={res} and correct = true;"
                    result3 = self.execute(query3, True)
                    if result3 is not None:
                        if result3[0][0] != anwser:
                            val *= -0.5
                        else:
                            if result4 is not None:
                                if result4[0][1]:
                                    val *= 0.8
                else:
                    try:
                        val = 10
                        if "INSERT" in query:
                            table = query.split(" ")[1]
                            query_ins = f"SELECT COUNT(*) FROM {table};"
                            res_c1 = self.execute(query_ins, True)
                            if res_c1 is not None:
                                res_c1 = res_c1[0][0]

                            self.execute(anwser, True)
                            table = query.split(" ")[1]
                            query_ins = f"SELECT COUNT(*) FROM {table};"
                            res_c = self.execute(query_ins, True)
                            if res_c is not None:
                                res_c = res_c[0][0]
                            if res_c != res_c1:
                                val *= 0.8
                            else:
                                val *= -0.5
                        elif "CREATE" in query:
                            if query.lower().replace(" ","").replace("\n","").replace("\t","") == \
                                    anwser.lower().replace(" ",""):
                                val *= 0.8
                            else:
                                val *= -0.5
                        else:
                            res1 = self.execute(anwser,True)
                            res2 = self.execute(query, True)
                            if res1 is not None and res2 is not None:
                                if res1 != res2:
                                    val *= -0.5
                                else:
                                    if result4 is not None:
                                        if result4[0][1]:
                                            val *= 0.8
                    except e:
                        print("FALLO EJECUTANDO DESAROLLO")


            self.update_score(result4[0][0], user_id, val)
        self.pick_new_question(user_id)
        self.close_connection()
        if val >= 0:
            return "Correcto!"
        else:
            return "Incorrecto :c"

    def update_score(self, uq_id, user_id, val):  # ANADIR LIMITE DE DESCENSO
        query = f"SELECT current_module_score from users where id={user_id}"
        res = self.execute(query, True)
        if res is not None:
            res=res[0][0]
            if res + val <= 0 or (res >=30 and res+val <= 30) or (res >=60 and res+val <= 60):
                pass
            else:
                if val >= 0:
                    query5 = f"UPDATE userquestions set correct = true where id={uq_id};" \
                             f"UPDATE users set current_module_score = current_module_score + {val} where id = {user_id};"
                else:
                    query5 = f"UPDATE userquestions set correct = true where id={uq_id};" \
                             f"UPDATE users set current_module_score = current_module_score + {val} where id = {user_id};"
                self.execute(query5, False)

    def get_hint(self, user_id):
        self.connect()
        query = f"SELECT last_question_id from users where id = {user_id}"
        results = self.execute(query, True)
        if results is not None:
            results = results[0][0]
            query2 = f"UPDATE userquestions set hint=true where user_id={user_id} and question_id={results};" \
                     f"SELECT hint from questions where id = {results}"
            results2 = self.execute(query2, True)
            if results2 is not None:
                results2 = results2[0][0]
                self.close_connection()
                return results2
        self.close_connection()
        return "Hubo un problema consiguiendo el hint."

    def get_question(self, user_id):
        self.connect()
        query = f"SELECT last_question_id from users where id = {user_id}"
        results = self.execute(query, True)
        if results is not None:
            results = results[0][0]
            query2 = f"SELECT question from questions where id = {results};"
            results2 = self.execute(query2, True)
            if results2 is not None:
                results2 = results2[0][0]
                self.close_connection()
                return results2
        self.close_connection()
        return "Hubo un problema consiguiendo el hint."

    def get_alternatives(self, user_id):
        self.connect()
        query = f"SELECT last_question_id from users where id = {user_id}"
        results = self.execute(query, True)
        if results is not None:
            results = results[0][0]
            query2 = f"SELECT text from alternatives where question_id = {results};"
            results2 = self.execute(query2, True)
            if results2 is not None:
                ret = []
                for i in results2:
                    ret.append([{"text": i[0]}])
                self.close_connection()
                return ret
        self.close_connection()
        return ""

    def get_users(self):
        self.connect()
        query = """
        SELECT umq.id, umq.first_name,umq.approved, umq.name, umq.current_module_score, umq.question, q.question from
       (SELECT um.id, um.first_name,um.approved, um.name, um.current_module_score, q.question, um.penultimate_question_id FROM
              (SELECT u.id, u.first_name,u.approved, m.name, u.current_module_score,u.last_question_id, 
              u.penultimate_question_id from users u inner join modules m on m.id = u.current_module_id) um
                  inner join questions q on last_question_id=q.id) umq inner join questions q on umq.penultimate_question_id=q.id;
        """
        res = self.execute(query, True)
        l = []
        if res is not None:
            for i in res:
                l.append({"id": i[0],
                          "first_name": i[1],
                          "approved": i[2],
                          "current_module_name": i[3],
                          "current_module_score": i[4],
                          "last_question_question": i[5],
                          "penultimate_question_question": i[6]
                          })
        self.close_connection()
        return json.dumps(l), 200

    def get_modules(self):
        self.connect()
        query = f"SELECT m.id, m.name from modules m"
        res = self.execute(query, True)
        l = []
        if res is not None:
            for item in res:
                query2 = f"SELECT q.question,q.hint,q.type,a.text from questions q inner join alternatives a on q.id = a.question_id where q.module_id = {item[0]} and a.correct=true and q.type=2;"
                res2 = self.execute(query2, True)
                l.append({
                    "id": item[0],
                    "name": item[1],
                    "questions": []
                })
                query3 = f"SELECT q.question,q.hint,q.type,q.query from questions q where q.module_id={item[0]} and q.type =1"
                res3 = self.execute(query3, True)
                if res2 is not None:
                    for subitem in res2:
                        l[-1]["questions"].append(
                            {
                                "question": subitem[0],
                                "hint": subitem[1],
                                "type": subitem[2],
                                "text": subitem[3]
                            }
                        )
                if res3 is not None:
                    for subitem in res3:
                        l[-1]["questions"].append(
                            {
                                "question": subitem[0],
                                "hint": subitem[1],
                                "type": subitem[2],
                                "text": subitem[3]
                            }
                        )

        return json.dumps(l), 200
        self.close_connection()


    def post_questions(self,data):
        self.connect()
        question = data["question"]
        type = data["type"]
        hint = data["hint"]
        module_id = data["module_id"]
        difficulty = data["difficulty"]
        sacar_id = f"SELECT COUNT(*) from questions;"
        id = self.execute(sacar_id, True)[0][0]
        if type == 2:
            alternatives = data["alternatives"]
            query = f"INSERT INTO questions ( id,question, hint, type, module_id, difficulty) values ({id+100},'{question}','{hint}'" \
                    f",{type},{module_id},{difficulty})"
            self.execute(query,False)
            for i in alternatives:
                query3 = f"INSERT INTO alternatives ( text, correct, question_id) values ('{i['text']}',{i['correct']},{id+100})"
                self.execute(query3, False)
        else:
            quer = data["query"]
            query = f"INSERT INTO questions ( id,question, hint, type, module_id,query, difficulty) values ({id+100},'{question}','{hint}'" \
                    f",{type},{module_id},'{quer}',{difficulty})"
            self.execute(query,False)


        self.close_connection()
        return {"msg":"success"},200


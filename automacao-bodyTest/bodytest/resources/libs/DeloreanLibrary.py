import psycopg2
from logging import info

class DeloreanLibrary():

    def connect(self):
        return psycopg2.connect(
            host='ec2-34-225-66-116.compute-1.amazonaws.com',
            database='d8i4m64ag5c8ss',
            user='yyhdpjcdasuala',
            password='75193f9900d8cbae121677016dbed810fd2f3761eee2c5b190bf7a57f1cbc99f'
        )

    #No robot o nome do método vai virar a keyword automaticamente => Remove Student  com o argumento email desejado para exclusão 
    def remove_student(self, email):

        query = "delete from students where email = '{}'".format(email)
        info(query)
        
        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def remove_student_by_name(self, name):

        query = "delete from students where name LIKE '%{}%'".format(name)
        info(query)
        
        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def insert_student(self, student):

        self.remove_student(student['email'])

        query = ("insert into students (name, email, age, weight, feet_tall, created_at, updated_at)"
                "values('{}','{}',{},{},{},NOW(),NOW());"
                .format(student['name'],student['email'],student['age'],student['weight'],student['feet_tall']))

        info(query)
        
        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

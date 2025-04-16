import psycopg2


def get_connection():
    con = psycopg2.connect(
        host='localhost',
        port=5432,
        database='partners_demo',
        user='postgres',
        password='root'
    )

    return con, con.cursor()

def close_connection(connection, cursor):
    cursor.close()
    connection.close()

def load_data():
    con, cur = get_connection()

    cur.execute("SELECT * FROM partners")

    return cur.fetchall()
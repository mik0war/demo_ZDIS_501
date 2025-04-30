import psycopg2

from src.data_types import Partner

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


# Метод для получения списка партнёров
#Скидка рассчитывается в SQL запросе на основании продаж
def load_data_with_skidka():
    con, cur = get_connection()

    cur.execute(
        "SELECT p.*, COALESCE(total_sums.sums, 0) "
        "FROM Partners p LEFT JOIN "
        "(SELECT CASE "
        "   WHEN SUM(product_count) < 10000 THEN 0 WHEN SUM(product_count) >= 10000 and SUM(product_count) < 50000 THEN 5 WHEN SUM(product_count) >= 50000 and SUM(product_count) < 300000 THEN 10 ELSE 15 END as sums, partner FROM partner_products GROUP BY partner) total_sums ON p.id = total_sums.partner")
    partners = [Partner(*i) for i in cur.fetchall()]
    close_connection(con, cur)
    return partners


def get_types():
    con, cur = get_connection()

    cur.execute('SELECT DISTINCT partner_type FROM partners')

    types = cur.fetchall()

    close_connection(con, cur)
    return types

def update(id, partner: Partner):

    con, cur = get_connection()

    cur.execute('Update partners set '
                'partner_type = %s, name = %s, director_name = %s, '
                'director_last_name = %s, '
                'director_surname = %s, e_mail  = %s, phone  = %s, address  = %s, '
                'inn = %s, rating  = %s WHERE id = %s',
                [partner.type, partner.name,
                 partner.d_first_name,
                 partner.d_last_name, partner.d_sur_name,
                 partner.e_mail, partner.phone,
                 partner.address, partner.inn, partner.rating, id])

    con.commit()

    close_connection(con, cur)

def create(partner: Partner):

    con, cur = get_connection()

    cur.execute("select MAX(id) from partners")
    pid = cur.fetchone()[0]

    cur.execute('INSERT INTO partners ('
                'partner_type, name, director_name, director_last_name, '
                'director_surname, e_mail, phone, address, inn, rating, id)'
                'VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)',
                [partner.type, partner.name,
                 partner.d_first_name,
                 partner.d_last_name, partner.d_sur_name,
                 partner.e_mail, partner.phone,
                 partner.address, partner.inn, partner.rating, pid+1])

    con.commit()

    close_connection(con, cur)


def calculate_skidka(partner: Partner):
    con, cur = get_connection()

    cur.execute('SELECT SUM(product_count) '
                '	from Partner_products WHERE partner = %s', [partner.id])

    total_count = cur.fetchone()[0]

    close_connection(con, cur)
    if total_count < 10_000:
        partner.skidka = 0
    elif 10000 <= total_count < 50_000:
        partner.skidka = 5
    elif 50_000 <= total_count < 300_000:
        partner.skidka = 10
    else:
        partner.skidka = 15

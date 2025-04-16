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


def load_data_with_skidka():
    con, cur = get_connection()

    cur.execute(
        "SELECT p.*, total_sums.sums "
        "FROM Partners p LEFT JOIN "
        "(SELECT CASE WHEN SUM(product_count) < 10000 THEN 0 WHEN SUM(product_count) >= 10000 and SUM(product_count) < 50000 THEN 5 WHEN SUM(product_count) >= 50000 and SUM(product_count) < 300000 THEN 10 ELSE 15 END as sums, partner FROM partner_products GROUP BY partner) total_sums ON p.id = total_sums.partner")
    partners = [Partner(*i) for i in cur.fetchall()]
    close_connection(con, cur)
    return partners


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

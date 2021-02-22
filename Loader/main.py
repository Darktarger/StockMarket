# ---Библиотеки-----------------------------------------------------
import requests
from bs4 import BeautifulSoup
import time
import psycopg2 as sql
import datetime
# ---Параметры подключения------------------------------------------
dbname   = 'DEVELOP_ST'
user     = 'postgres'
password = 'masterkey'
# ---Функции--------------------------------------------------------
def get_stock_price(url):
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36'}

    page = requests.get(url, headers=headers)
    soup = BeautifulSoup(str(page.content).replace('&nbsp', ''), 'html.parser')
    teg  = soup.findAll("span", {"jsname": "vWLAgc", "class": "IsqQVc", "class": "NprOob"})
    val  = teg[0].text.replace(",", ".").replace('\\xc2\\xa0', '')
    return float(val)

# ---Основная часть------------------------------------------------
# Так как цикл бесконечный - будем каждые 10 минут открывать новое подключение
while True:
    conn   = sql.connect(dbname=dbname, user=user, password=password)
    select = conn.cursor()
    insert = conn.cursor()

    select.execute("select * from Stock")

    for row in select:
        val   = get_stock_price(row[3])
        query = str('insert into StockPrice(Stock_Id, StockPrice_Value) values(' + str(row[0]) + ', ' + str(val) + ')')
        insert.execute(query)

    select.close()
    insert.close()
    conn.commit()
    print("Загрузка данных: " + datetime.datetime.now().strftime("%d.%m.%Y %H:%M"))
    conn.close()
    time.sleep(60)

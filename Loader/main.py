#---Библиотеки-----------------------------------------------------
import requests
from bs4 import BeautifulSoup

#---Функции--------------------------------------------------------
def get_stock_price(url):
    headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36'}

    page = requests.get(url, headers=headers)
    soup = BeautifulSoup(str(page.content).replace('&nbsp', ''), 'html.parser')
    teg  = soup.findAll("span", {"jsname": "vWLAgc", "class": "IsqQVc", "class": "NprOob"})
    val  = teg[0].text.replace(",", ".").replace('\\xc2\\xa0', '')
    # Заменить на добавление записи в базу
    print(val)

# ---Основная часть------------------------------------------------
# Заменить на получение списка из базы
stocks = {
    "SBER": "https://www.google.ru/search?newwindow=1&safe=strict&source=hp&ei=nrkyYODlOeuxrgS17o3oCQ&iflsig=AINFCbYAAAAAYDLHrtRSYspeX0qGayWQd05OEdqXyaOH&q=курс+акций+сбербанка&oq=курс+акций+Сбер&gs_lcp=Cgdnd3Mtd2l6EAMYADIHCAAQRhD6ATICCAAyAggAMgIIADICCAAyAggAMgIIADICCAAyAggAMgIIADoICAAQsQMQgwE6CAguELEDEIMBOggIABDHARCvAToFCAAQsQM6DQgAELEDEIMBEEYQggI6DQgAELEDEIMBEEYQ-gFQsxRYwTRg1T1oAHAAeACAAVaIAdQJkgECMTWYAQCgAQGqAQdnd3Mtd2l6&sclient=gws-wiz",
    "OZON": "https://www.google.ru/search?newwindow=1&safe=strict&ei=RVYzYMTlH5qHwPAPjOaJiAY&q=курс+акций+OZON&oq=курс+акций+OZON&gs_lcp=Cgdnd3Mtd2l6EAMyAggAMgIIADICCAAyBggAEBYQHjIGCAAQFhAeULesH1i3rB9g3bIfaABwAngAgAF6iAHUAZIBAzEuMZgBAKABAqABAaoBB2d3cy13aXrAAQE&sclient=gws-wiz&ved=0ahUKEwiEnJm59fzuAhWaAxAIHQxzAmEQ4dUDCA0&uact=5",
    "QIWI": "https://www.google.ru/search?newwindow=1&safe=strict&ei=SFgzYPrsI-XHrgTp5ZngCg&q=курс+акций+QIWI&oq=курс+акций+QIWI&gs_lcp=Cgdnd3Mtd2l6EAMyAggAUMUaWMUaYNYjaABwAngAgAGbAYgB8QGSAQMxLjGYAQCgAQKgAQGqAQdnd3Mtd2l6wAEB&sclient=gws-wiz&ved=0ahUKEwj6sOau9_zuAhXlo4sKHelyBqwQ4dUDCA0&uact=5"
}

# Получение котировок
for key, value in stocks.items():
    get_stock_price(value)
    print(key + " " + value)
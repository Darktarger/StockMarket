CREATE DATABASE "DEVELOP_ST"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE "DEVELOP_ST"
    IS 'База для разработки';

create table Stock
(
	Stock_Id    serial constraint XPKStock primary key,
	Stock_Code  varchar(250) not null,
	Stock_Name  varchar(500) not null,
	Stock_Url   varchar(4000) not null,
	Stock_Block int not null default(0)
);

create unique index XIE1Stock
on Stock (Stock_Code)
include (Stock_Id);

create table StockPrice
(
	StockPrice_Id    serial constraint XKPStorkPrice primary key,
	Stock_Id         serial not null,
	StockPrice_Date  date not null default(current_date),
	StockPrice_Time  time not null default(current_time),
	StockPrice_Value decimal(32,16) not null,
	foreign key (Stock_Id) references Stock (Stock_Id)
	on delete no action
	on update no action
);

create unique index XIEStockPrice
on StockPrice (Stock_Id, StockPrice_Date, StockPrice_Time)
include (StockPrice_Value);


insert into Stock
(
	Stock_Code,
	Stock_Name,
	Stock_Url
)
values ('SBER', 'Сбербанк'  , 'https://www.google.ru/search?newwindow=1&safe=strict&source=hp&ei=nrkyYODlOeuxrgS17o3oCQ&iflsig=AINFCbYAAAAAYDLHrtRSYspeX0qGayWQd05OEdqXyaOH&q=курс+акций+сбербанка&oq=курс+акций+Сбер&gs_lcp=Cgdnd3Mtd2l6EAMYADIHCAAQRhD6ATICCAAyAggAMgIIADICCAAyAggAMgIIADICCAAyAggAMgIIADoICAAQsQMQgwE6CAguELEDEIMBOggIABDHARCvAToFCAAQsQM6DQgAELEDEIMBEEYQggI6DQgAELEDEIMBEEYQ-gFQsxRYwTRg1T1oAHAAeACAAVaIAdQJkgECMTWYAQCgAQGqAQdnd3Mtd2l6&sclient=gws-wiz'),
       ('OZON', 'OZON-адр'  , 'https://www.google.ru/search?newwindow=1&safe=strict&ei=RVYzYMTlH5qHwPAPjOaJiAY&q=курс+акций+OZON&oq=курс+акций+OZON&gs_lcp=Cgdnd3Mtd2l6EAMyAggAMgIIADICCAAyBggAEBYQHjIGCAAQFhAeULesH1i3rB9g3bIfaABwAngAgAF6iAHUAZIBAzEuMZgBAKABAqABAaoBB2d3cy13aXrAAQE&sclient=gws-wiz&ved=0ahUKEwiEnJm59fzuAhWaAxAIHQxzAmEQ4dUDCA0&uact=5'),
	   ('QIWI', 'iQIWI'     , 'https://www.google.ru/search?newwindow=1&safe=strict&ei=SFgzYPrsI-XHrgTp5ZngCg&q=курс+акций+QIWI&oq=курс+акций+QIWI&gs_lcp=Cgdnd3Mtd2l6EAMyAggAUMUaWMUaYNYjaABwAngAgAGbAYgB8QGSAQMxLjGYAQCgAQKgAQGqAQdnd3Mtd2l6wAEB&sclient=gws-wiz&ved=0ahUKEwj6sOau9_zuAhXlo4sKHelyBqwQ4dUDCA0&uact=5'),
	   ('YNDX', 'Yandex clA', 'https://www.google.ru/search?newwindow=1&safe=strict&ei=AVwzYJePI5KxrgT054mABg&q=курс+акций+яндекс&oq=курс+акций+Я&gs_lcp=Cgdnd3Mtd2l6EAEYADICCAAyAggAMgIIADICCAAyAggAMgYIABAWEB4yBggAEBYQHjIGCAAQFhAeMgYIABAWEB4yBggAEBYQHlDbcljbcmCpeWgAcAJ4AIABd4gBzQGSAQMxLjGYAQCgAQGqAQdnd3Mtd2l6wAEB&sclient=gws-wiz'),
	   ('AFLT', 'Аэрофлот'  , 'https://www.google.ru/search?newwindow=1&safe=strict&ei=EVwzYL6kNeylrgTE_qXICg&q=курс+акций+Аэрофлот&oq=курс+акций+Аэрофлот&gs_lcp=Cgdnd3Mtd2l6EAMyAggAMgIIADICCAAyBggAEBYQHjIGCAAQFhAeMgYIABAWEB4yBggAEBYQHjIGCAAQFhAeOgcIABCwAxBDUMuOBljLjgZgmJIGaAFwAngAgAGAAYgB1QGSAQMxLjGYAQCgAQKgAQGqAQdnd3Mtd2l6yAEKwAEB&sclient=gws-wiz&ved=0ahUKEwj-8P78-vzuAhXskosKHUR_CakQ4dUDCA0&uact=5')
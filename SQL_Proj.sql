/* Create the database */
create database TD_Ameritrade;

/* Database tables */
create table Traders (trader_id int(11),
					  first_name varchar(50),
					  last_name varchar(50),
				      email varchar(50),
					  gender varchar(1),
                      age int(3),
					  country varchar(50),
                      city varchar(50),
                      adress varchar(50),
				      primary key (trader_id));

create table Crypto (crypto_id int(11),
					 crypto_symbol varchar(7),
					 crypto_name varchar(50),
					 crypto_price decimal(10,2),
					 primary key (crypto_id));
                     
create table Stocks (stock_id int(11),
					 stock_symbol varchar(7),
					 stock_name varchar(50),
					 stock_price decimal(10,2),
					 primary key (stock_id));
                     
create table Forex (forex_id int(11),
					forex_pair varchar(7),
					pair_price decimal(10,2),
					primary key (forex_id));
                    
create table Crypto_Transactions (trader_id int(11),
								  crypto_id int(11),
								  crypto_result varchar(50),
								  crypto_amount_result int(11),
								  crypto_transaction_date date,
                                  crypto_transaction_time time,
								  primary key (trader_id, crypto_id));
                                  
create table Stock_Transactions (trader_id int(11),
								 stock_id int(11),
								 stock_result varchar(50),
								 stock_amount_result int(11),
								 stock_transaction_date date,
								 stock_transaction_time time,
								 primary key (trader_id, stock_id));
                                  
create table Forex_Transactions (trader_id int(11),
								 forex_id int(11),
								 forex_result varchar(50),
								 forex_amount_result int(11),
								 forex_transaction_date date,
								 forex_transaction_time time,
								 primary key (trader_id, forex_id));
                                 
/* Input data into the tables */
insert into Traders (trader_id, first_name, last_name, email, gender, age, country, city, adress)
values (1, 'Aldwin', 'Allwood', 'aallwood0@walmart.com', 'M', '25', 'Japan', 'Itsukaichi', '75296 Bluejay Court'),
	   (2, 'Maybelle', 'Castiglioni', 'mcastiglioni1@bbb.org', 'F', '45', 'Portugal', 'Fermelã', '1730 Hovde Center'),
       (3, 'Mead', 'Stefi', 'mstefi2@spotify.com', 'M', '35', 'China', 'Fengtai Chengguanzhen', '458 Chive Lane'),
       (4, 'Nanine', 'Varns', 'nvarns3@ameblo.jp', 'F', '36', 'China', 'Chongmin', '26 Clyde Gallagher Circle'),
       (5, 'Gregorius', 'Cheatle', 'gcheatle4@cdc.gov', 'M', '20', 'Poland', 'Wawer', '175 Tennyson Park');
       
insert into Crypto (crypto_id, crypto_symbol, crypto_name, crypto_price)
values (1, 'BTC', 'Bitcoin', '31001.69'),
	   (2, 'ETH', 'Ethereum', '2269.27'),
       (3, 'SOL', 'Solana', '56.17'),
       (4, 'DOGE', 'Dogecoin', '0.09'),
       (5, 'LTC', 'Litecoin', '74.90');
       
insert into Stocks (stock_id, stock_symbol, stock_name, stock_price)
values (1, 'SYNT', 'Syntel Inc.', '635.12'),
	   (2, 'SPB', 'Spectrum Brands Holdings Inc.', '522.42'),
       (3, 'SMIT', 'Schmitt Industries Inc.', '965.22'),
       (4, 'IRM', 'Iron Mountain Inc.', '131.77'),
       (5, 'JFC', 'JPMorgan China Region Fund Inc.', '251.02');
       
insert into Forex (forex_id, forex_pair, pair_price)
values (1, 'EUR/AUD', '1.51'),
	   (2, 'CHF/JPY', '131.25'),
       (3, 'AUD/USD', '0.70'),
       (4, 'EUR/GBP', '0.86'),
       (5, 'CAD/JPY', '100.43');
       
insert into Crypto_Transactions (trader_id, crypto_id, crypto_result, crypto_amount_result, crypto_transaction_date, crypto_transaction_time)
values (1, 2, 'Win', '241', '2022-02-03', '21:36'),
	   (2, 4, 'Loss', '-138', '2022-02-19', '12:51'),
       (3, 3, 'Win', '182', '2022-01-18', '11:14'),
       (4, 5, 'Loss', '-89', '2022-01-11', '06:21'),
       (5, 1, 'Win', '320', '2022-02-04', '19:50');
       
insert into Stock_Transactions (trader_id, stock_id, stock_result, stock_amount_result, stock_transaction_date, stock_transaction_time)
values (1, 5, 'Loss', '-151', '2022-02-15', '20:46'),
	   (2, 3, 'Loss', '-290', '2022-02-22', '10:50'),
       (3, 4, 'Win', '312', '2022-01-01', '12:13'),
       (4, 1, 'Win', '147', '2022-01-12', '05:47'),
       (5, 2, 'Win', '190', '2022-02-09', '17:30');
       
insert into Forex_Transactions (trader_id, forex_id, forex_result, forex_amount_result, forex_transaction_date, forex_transaction_time)
values (1, 3, 'Win', '120', '2022-02-11', '21:34'),
	   (2, 1, 'Win', '90', '2022-02-28', '09:20'),
       (3, 5, 'Loss', '-74', '2022-01-14', '11:52'),
       (4, 2, 'Win', '95', '2022-01-17', '07:29'),
       (5, 4, 'Loss', '-60', '2022-02-04', '16:12');
       
/* Relevant information from database */
/* The average age of the traders */
select avg(age) as Average_age
from traders;

/* Country from where the traders are */
select first_name, last_name, country
from traders;

/* Transactions made by traders */
select first_name, last_name, crypto_name, crypto_price, stock_name, stock_price, forex_pair, pair_price
from traders
inner join crypto
on traders.trader_id=crypto.crypto_id
inner join stocks
on traders.trader_id=stocks.stock_id
inner join forex
on traders.trader_id=forex.forex_id;

/* Traders with their performance and results in crypto, stocks and forex transactions */
select first_name, last_name, crypto_amount_result, stock_amount_result, forex_amount_result
from traders
inner join crypto_transactions
on traders.trader_id=crypto_transactions.trader_id
inner join stock_transactions
on traders.trader_id=stock_transactions.trader_id
inner join forex_transactions
on traders.trader_id=forex_transactions.trader_id;

/* The best and the worst results made by traders */
select max(crypto_amount_result) as max_crypto_profit,
	   min(crypto_amount_result) as max_crypto_loss,  
	   max(stock_amount_result) as max_stock_profit,
       min(stock_amount_result) as max_stock_loss, 
       max(forex_amount_result) as max_forex_profit,  
       min(forex_amount_result) as max_forex_loss
from crypto_transactions, stock_transactions, forex_transactions;

/* Analysing how many traders are men and women */
select gender, count(gender) as Count
from traders 
where gender='M' 
union all
select gender, count(gender)
from traders
where gender='F'
order by gender;

/* The profitability of all trades made divided by crypto, stocks, forex */
select sum(crypto_amount_result) as Profitability
from crypto_transactions
union all 
select sum(stock_amount_result)
from stock_transactions
union all
select sum(forex_amount_result)
from forex_transactions;

/* The most expensive and the most cheapear crypto, stock, forex pair in the market */
select crypto_name, crypto_price, stock_name, stock_price, forex_pair, pair_price
from crypto, stocks, forex
where crypto_price = (select max(crypto_price) from crypto) 
and
stock_price = (select max(stock_price) from stocks)
and
pair_price = (select max(pair_price) from forex)
union all
select crypto_name, crypto_price, stock_name, stock_price, forex_pair, pair_price
from crypto, stocks, forex
where crypto_price = (select min(crypto_price) from crypto) 
and
stock_price = (select min(stock_price) from stocks)
and
pair_price = (select min(pair_price) from forex);

/* The time and the dates of all transactions made by traders */
select crypto_transaction_time as Trading_time, crypto_transaction_date as Trading_date
from crypto_transactions
union all
select stock_transaction_time, stock_transaction_date
from stock_transactions
union all
select forex_transaction_time, forex_transaction_date
from forex_transactions;

/* Traders age classified by under 30, between 30-50 and more than 50 years old */
select count(age) as Age_clasification
from traders
where age < 30
union all 
select count(age) 
from traders
where age > 30 and age < 50
union all
select count(age) 
from traders
where age > 50;

/* The sum of all crypto, stocks, forex pair prices if a traders wants to buy/trade them all */
select sum(crypto_price) as Total_price
from crypto
union all
select sum(stock_price)
from stocks
union all 
select sum(pair_price)
from forex;

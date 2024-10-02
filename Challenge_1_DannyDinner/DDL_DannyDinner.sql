/*
Challenge Number 1 :
*/

CREATE DATABASE dannyDinner


CREATE TABLE sales (
customer_id VARCHAR(1),
order_date DATE CHECK(order_date <= getDate()),
product_id INTEGER,
FOREIGN KEY (customer_id) REFERENCES members(customer_id),
FOREIGN KEY (product_id) REFERENCES menu(product_id),
PRIMARY KEY (customer_id, product_id, order_date)
)



CREATE TABLE members(
customer_id VARCHAR(1) PRIMARY KEY,
join_date DATE NOT NULL
)


CREATE TABLE menu(
product_id INTEGER PRIMARY KEY,
product_name VARCHAR(5) NOT NULL,
price INTEGER NOT NULL
)


INSERT INTO sales (customer_id, order_date, product_id)
VALUES 
('A', '2021-01-01', 1),
('A', '2021-01-01', 2),
('A', '2021-01-07', 2),
('A', '2021-01-10', 3),
('A', '2021-01-11', 3),
('C', '2021-01-11', 3),
('B', '2021-01-01', 2),
('B', '2021-01-02', 2),
('B', '2021-01-04', 1),
('B', '2021-01-11', 1),
('B', '2021-01-16', 3),
('B', '2021-02-01', 3),
('C', '2021-01-01', 3),
('C', '2021-01-01', 2),
('C', '2021-01-07', 3);

INSERT INTO menu (product_id, product_name, price)
VALUES
(1, 'sushi', 10),
(2, 'curry', 15),
(3, 'ramen', 12);


INSERT INTO members (customer_id, join_date)
VALUES
('A', '2021-01-07'),
('B', '2021-01-09');
('C', '2021-01-01');




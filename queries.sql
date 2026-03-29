--How can you isolate (or group) the transactions of each cardholder?

SELECT ch.name, tr.card, tr.date, tr.amount, m.name AS merchant, mc.name AS category  
FROM transaction AS tr
JOIN credit_card AS cc on tr.card = cc.card
JOIN card_holder AS ch on cc.id_card_holder = ch.id
JOIN merchant AS m on m.id = tr.id_merchant
JOIN merchant_category AS mc on mc.id = m.id_merchant_category
ORDER BY ch.name;

--Considering the time period 7:00 a.m. to 9:00 a.m.
--What are the 100 highest transactions during this time period?
SELECT * 
FROM transaction AS tr
WHERE extract(hour from date) >=7
AND extract (hour from date) <=9
ORDER BY amount DESC
LIMIT 100;

--Some fraudsters hack a credit card by making several small payments 
--(generally less than $2.00), which are typically ignored by cardholders. 
--Count the transactions that are less than $2.00 per cardholder. 
--Is there any evidence to suggest that a credit card has been hacked? 
--Explain your rationale.

SELECT * From transaction
WHERE cast (amount as decimal) < 2;

SELECT *
From transaction AS tr
WHERE cast (amount as decimal) < 2
Order by card, tr.amount DESC;

--What are the top five merchants prone to being hacked using small transactions?

SELECT m.name AS merchant, mc.name AS category,
COUNT (tr.amount) AS micro_transactions
FROM transaction AS tr
JOIN merchant AS m ON m.id = tr.id_merchant
JOIN merchant_category AS mc ON mc.id = m.id_merchant_category
WHERE tr.amount < 2
GROUP BY m.name, mc.name
ORDER BY micro_transactions DESC
LIMIT 5;

--Once you have a query that can be reused, create a view for each of the previous queries.

CREATE VIEW transactions_per_card_holder AS
SELECT ch.name, tr.card, tr.date, tr.amount, m.name AS merchant,
		mc.name AS category
FROM transaction AS tr
JOIN credit_card AS cc on tr.card = cc.card
JOIN card_holder AS ch on cc.id_card_holder = ch.id
JOIN merchant AS m on m.id = tr.id_merchant
JOIN merchant_category AS mc on mc.id = m.id_merchant_category
ORDER BY ch.name;

CREATE VIEW morning_higher_transactions AS
FROM transaction AS tr
JOIN credit_card AS cc on tr.card = cc.card
JOIN card_holder AS ch on cc.id_card_holder = ch.id
JOIN merchant AS m on m.id = tr.id_merchant
JOIN merchant_category AS mc on mc.id = m.id_merchant_category
ORDER BY ch.name;

CREATE VIEW micro_transactions AS
SELECT *
From transaction AS tr
WHERE cast (amount as decimal) < 2
Order by card, tr.amount DESC;

CREATE VIEW count_micr_transactions AS
SELECT * From transaction
WHERE cast (amount as decimal) < 2;

CREATE VIEW top_hacked_merchants_micro_transactios AS
SELECT m.name AS merchant, mc.name AS category,
COUNT (tr.amount) AS micro_transactions
FROM transaction AS tr
JOIN merchant AS m ON m.id = tr.id_merchant
JOIN merchant_category AS mc ON mc.id = m.id_merchant_category
WHERE tr.amount < 2
GROUP BY m.name, mc.name
ORDER BY micro_transactions DESC
LIMIT 5;















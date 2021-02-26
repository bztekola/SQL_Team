# This is a query to determine all Adabox subscriptions that are at least 2 years old(8 Adaboxes total)

SELECT o.customers_id, COUNT(DISTINCT(op.part_id)) AS total_adaboxes
FROM orders_products op
JOIN orders o ON o.orders_id = op.orders_id 
WHERE op.part_id IN (SELECT part_id FROM subscription_dates WHERE subscription_name = 'adabox' GROUP BY part_id)
AND o.customers_id IN (SELECT customers_id FROM subscriptions WHERE subscriptions_status = 'Active' AND date_created < '2018-03-05' GROUP BY customers_id)
GROUP BY o.customers_id
HAVING total_adaboxes > 7

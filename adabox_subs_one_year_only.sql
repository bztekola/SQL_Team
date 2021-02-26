#This SQL query determines how many customers have subscribed to Adabox for one year only

SELECT COUNT(*) AS two_years FROM (
SELECT sh.subscriptions_id, COUNT(sh.subscriptions_id) AS boxes, MIN(sh.timestamp) AS first_box, MAX(sh.timestamp) AS last_box
FROM subscriptions_history sh
JOIN orders o ON o.orders_id = sh.orders_id
WHERE sh.action = 'Create Shipment Order'
AND o.orders_status = 3
GROUP BY sh.subscriptions_id
HAVING boxes >= 4
AND last_box < first_box + INTERVAL 13 MONTH) a
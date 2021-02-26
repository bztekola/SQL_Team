/*This query is to determine how many gifted adabox subscriptions were converted to a regular subscription following the expiration of their gifted subscription */

SELECT s.subscriptions_id, s.customers_id
FROM subscriptions s
WHERE s.`customers_id` != s.`gifter_customers_id` AND s.subscriptions_status = 'Active' AND `prepaid_remaining` = 0 AND s.`gifter_customers_id` != 0;
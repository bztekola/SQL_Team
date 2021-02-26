/*This query determines how many Adabox gift subscriptions remain for the next 4 quarters*/

SELECT s.prepaid_remaining, COUNT(s.prepaid_remaining) AS subscribers
FROM subscriptions s
WHERE s.prepaid_remaining> 0
AND s.customers_id != s.gifter_customers_id
AND subscriptions_type = 'adabox'
GROUP BY prepaid_remaining
ORDER BY prepaid_remaining;
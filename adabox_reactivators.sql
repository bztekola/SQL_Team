#This SQL query determines how many Adabox subscriptions have been canceled or expired but then have been reactivated

SELECT COUNT(DISTINCT(sh.subscriptions_id)) AS 'Reactivators'
FROM `subscriptions_history` sh, `subscriptions_history` sh2, `subscriptions_history` sh3, `orders` o WHERE sh.subscriptions_id = sh2.subscriptions_id AND sh2.subscriptions_id = sh3.subscriptions_id AND sh3.orders_id = o.orders_id AND sh.action = 'Cancel Subscription' AND sh2.comments = 'Subscription reactivated through account settings.' AND sh2.timestamp > sh.timestamp AND sh3.action = 'Create Shipment Order' AND o.orders_status = 3

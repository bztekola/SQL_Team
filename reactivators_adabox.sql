/*This query determines how many Adabox subscripriptions were canceled and reactivated (the subscriptions status does not need to be currently active)*/

SELECT COUNT(DISTINCT(sh.subscriptions_id)) AS 'Reactivators'
FROM `subscriptions_history` sh, `subscriptions_history` sh2 
WHERE sh.subscriptions_id = sh2.subscriptions_id AND sh.comments = 'Manual Subscription cancellation through account settings.'
AND sh2.comments = 'Subscription reactivated through account settings.' AND sh2.timestamp > sh.timestamp;
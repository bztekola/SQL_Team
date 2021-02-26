/*This query is trying to determine the total DHL shipping cost for the week ending 11/3/2019 with the purpose of finding out why we had a profit loss that week*/ 

SELECT 
ot.text, o.shippingcost FROM orders_total ot, orders o WHERE ot.orders_id = o.orders_id AND o.shipping_module_code = 'dhlexpress' AND ot.class = 'ot_shipping'
AND o.date_purchased BETWEEN '2019-10-28 00:00:00' AND '2019-11-03 11:59:59'
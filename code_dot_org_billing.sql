#This sql query determines the billing and shipping specifics for our code.org packs 

SELECT
o.orders_id, o.date_purchased, order_total, o.orders_status, o.orders_billing_status, o.coupon_code, o.delivery_state, o.delivery_postcode, o.shippingcost AS 'Shipping Cost to Customer', SUM(ub.netAmount) AS 'Shipping Charges from UPS'
FROM orders o 
LEFT JOIN ups_billing ub ON o.orders_id = ub.orders_id
WHERE coupon_code LIKE 'CSD%' 
AND shipping_module_code = 'upsxml' 
AND o.orders_status NOT IN (14, 15)
GROUP BY o.orders_id
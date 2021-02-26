SELECT o.orders_id, o.delivery_country, o.delivery_state, o.delivery_postcode, o.date_purchased, op.part_id
FROM orders o 
JOIN orders_products op ON o.orders_id = op.orders_id WHERE part_id IN (4078, 4500, 4516, 4481, 4062, 3997, 3999, 3993, 3998, 3995, 3994, 3996, 4333, 4371)
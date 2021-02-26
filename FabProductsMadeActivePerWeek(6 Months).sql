Fab products made active per week (previous 6 months)
#This is an SQL Query to determine how many Fab products were made active per week for the last 6 months

SELECT AVG(per_week)
FROM(SELECT 
count(*) AS per_week, WEEK(wo.wo_date_active) AS WEEK FROM work_orders wo JOIN processes p ON p.wo_id = wo.wo_id WHERE p.process_class = 'processFabricate' AND wo.wo_date_active >= curdate() - INTERVAL 6 MONTH GROUP BY WEEK(wo.wo_date_active)) AS Average
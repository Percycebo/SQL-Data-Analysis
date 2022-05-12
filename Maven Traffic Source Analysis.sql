SELECT DISTINCT
    utm_source, utm_campaign
FROM
    website_sessions;
    
SELECT 
    utm_source,
    count(distinct website_sessions.website_session_id) as sessions,
    count(distinct orders.website_session_id) as orders
FROM
    website_sessions
        LEFT JOIN
    orders ON orders.website_session_id = website_sessions.website_session_id
WHERE
    website_sessions.website_session_id BETWEEN 1000 AND 2000
GROUP BY utm_source;


SELECT 
    utm_source, utm_campaign,http_referer, count(website_session_id) as sessions
FROM
    website_sessions
where created_at< '2012-04-12'
group by utm_source,utm_campaign,http_referer
order by sessions desc
;

SELECT 
    COUNT( ws.website_session_id) as sessions, 
    COUNT( o.website_session_id) as orders,
    (COUNT( o.website_session_id)/COUNT(distinct ws.website_session_id))*100
FROM
    website_sessions as ws
        LEFT JOIN
    orders as o ON ws.website_session_id = o.website_session_id
WHERE
	ws.utm_source='gsearch'and
    ws.utm_campaign='nonbrand' and
    ws.created_at < '2012-04-14'
ORDER BY sessions DESC 
;

SELECT 
    YEAR(created_at) AS created_yr,
    WEEK(created_at) as created_wk,
    min(date(created_at)) as week_start,
    COUNT(DISTINCT website_session_id) as sessions
FROM
    website_sessions
WHERE
    website_session_id BETWEEN 100000 AND 115000
GROUP BY YEAR(created_at),week(created_at);

SELECT 
    primary_product_id,
    count(distinct case when items_purchased=1 then order_id else null end) as orders_w_1_item,
    count(distinct case when items_purchased=2 then order_id else null end) as orders_w_2_item,
    count(distinct order_id) as total_orders
FROM
    orders
WHERE
    order_id BETWEEN 31000 AND 32000
group by 1
    ;
    
SELECT 
    min(date(created_at)) as week_start_date,
    count(distinct website_session_id) as sessions
FROM
    website_sessions as ws
WHERE
    ws.utm_source = 'gsearch'
	AND ws.utm_campaign = 'nonbrand'
	AND ws.created_at between '2012-03-19' and '2012-05-12'
group by week(created_at)
;




{{ config(materialized='table') }}

WITH
  pageview_with_sticked_user_id AS (
  SELECT
    id,
    visitor_id,
    device_type,
    timestamp,
    page,
    customer_id,
    COALESCE(FIRST_VALUE(customer_id IGNORE NULLS) OVER (PARTITION BY visitor_id ORDER BY visitor_id ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING),visitor_id) AS user_id
  FROM
    `analytics-engineers-club.web_tracking.pageviews` )
,

session_calculator as
(
SELECT
  *,
IF
  (timestamp_diff (timestamp,
      LAG(timestamp) OVER(PARTITION BY user_id ORDER BY timestamp ASC),
      second) >1800,1,0) AS session_number_increment
FROM
  pageview_with_sticked_user_id
)

select *,
concat (user_id,sum(session_number_increment) over (partition by user_id order by timestamp asc)) as session_id
from session_calculator

ORDER BY
  visitor_id,
  timestamp
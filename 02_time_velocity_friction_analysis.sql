with session_timestamps as (
  SELECT
  session_id,
  device_type,
  MIN(case when event_name = '2_view_configurator' then event_timestamp end) as configurator_time,
  MIN(case when event_name = '4_add_to_cart' then event_timestamp end) as add_to_cart_time
from user_events
  group by session_id, device_type)
  
SELECT device_type,
AVG((JULIANDAY(add_to_cart_time) - JULIANDAY(configurator_time)) * 1440)
from session_timestamps
group by device_type;

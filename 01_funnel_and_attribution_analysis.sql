-- =====================================================================
-- PART 1: E-COMMERCE CONVERSION FUNNEL & MARKETING ATTRIBUTION ANALYTICS
-- =====================================================================

-- Query 1: Segmented Volume Funnel & Micro-Conversions

with funnel_volumes as (
  SELECT device_type,
  count (DISTINCT case when event_name = '1_view_homepage' then user_id end) as 'unique_homepage_visitors',
  count (DISTINCT case when event_name = '2_view_configurator' then user_id end) as 'unique_configurator_visitors',
  count (DISTINCT case when event_name = '3_interact_customizer' then user_id end) as 'unique_customizer_visitor',
  count (DISTINCT case when event_name = '4_add_to_cart' then user_id end) as 'unique_cart_adders',
  count (DISTINCT case when event_name = '5_initiate_checkout' then user_id end) as 'unique_checkouts',
  COUNT (DISTINCT case when event_name = '6_purchase_complete' THEN user_id end) as 'unique_purchasers'
FROM user_events
GROUP BY device_type)

SELECT device_type, 
	unique_homepage_visitors as total_traffic,
	(cast(unique_purchasers as real) / unique_homepage_visitors) * 100 as macro_conversion_pct,
   (cast(unique_cart_adders as real) / unique_customizer_visitor) * 100 as customer_to_cart_pct
FROM funnel_volumes;

-- Query 2: First-Touch Marketing Traffic Attribution Performance

WITH funnel_volumes as (
  SELECT traffic_source,
  count (DISTINCT case WHEN event_name = '1_view_homepage' then user_id end) as 'unique_homepage_visitors',
  count (DISTINCT case when event_name = '2_view_configurator' then user_id end) as 'unique_configurator_visitors',
  count (DISTINCT case when event_name = '3_interact_customizer' then user_id end) as 'unique_customizer_visitor',
  count (DISTINCT case when event_name = '4_add_to_cart' then user_id end) as 'unique_cart_adders',
  count (DISTINCT case when event_name = '5_initiate_checkout' then user_id end) as 'unique_checkouts',
  COUNT (DISTINCT case when event_name = '6_purchase_complete' THEN user_id end) as 'unique_purchasers'
FROM user_events
GROUP BY traffic_source)

SELECT traffic_source, 
	unique_homepage_visitors as total_traffic,
	(cast(unique_purchasers as real) / unique_homepage_visitors) * 100 as macro_conversion_pct,
   (cast(unique_cart_adders as real) / unique_customizer_visitor) * 100 as customer_to_cart_pct
FROM funnel_volumes;

select
id,
c_recorder_id,
c_eu,
c_cluster_id1,
  -- Todo: Add the real cluster ID
CASE WHEN (c_cluster_id1 = '500' OR c_cluster_id1 = '600' OR c_cluster_id1 = '70')
    THEN 'Yes' ELSE 'No' END as "Is 1st line?",
c_gps_lat::text,
c_gps_lng::text,
c_gps_acc,
c_village_pop,
c_black_fly,
c_cluster_notes,
created_at

FROM public.oem_oemclusterv<%= xformVersion %>_<%= country %>

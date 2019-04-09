SELECT
  c_gps_lat,
  c_gps_lng,
  c_recorder_id,
  c_eu,
  c_cluster_id1,
  c_cluster_id2,
  c_village_pop,
  c_black_fly,
  c_cluster_notes
FROM oem_oemclusterv<%= xformVersion %>_<%= country %>
WHERE c_gps_lat IS NOT NULL

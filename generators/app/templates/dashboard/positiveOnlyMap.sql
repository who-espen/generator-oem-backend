SELECT * FROM(
  SELECT
  c_gps_lat,
  c_gps_lng,
  c_recorder_id,
  d_euid,
  c_cluster_id1,
  c_cluster_id2,
  c_village_pop,
  c_black_fly,
  c_cluster_notes,
  COUNT(CASE WHEN d_lab_ov16='Positive' THEN 1 ELSE null END) as positives
FROM public.oem_oemclusterv<%= xformVersion %>_<%= country %> c
  LEFT JOIN public.oemdiagnostictestresultsv<%= xformVersion %>_<%= country %> r on c.c_cluster_id1 = r.d_cluster_id

GROUP BY c_gps_lat, c_gps_lng, c_recorder_id, d_euid, c_eu, c_cluster_id1, c_cluster_id2, c_village_pop, c_black_fly, c_cluster_notes) s

WHERE s.c_gps_lat is not null AND s.positives > 0

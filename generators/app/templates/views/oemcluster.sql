CREATE VIEW oemclusterv<%= xformVersion %>_<%= country %> AS
SELECT
  id,
  c_start_time,
  c_end_time,
  c_recorder_id,
  r."RecorderName",
  c_district_id,
  c_eu,
  c_cluster_id1,
  c_cluster_id2,
  c."ClusterName",
  c_gps_lat,
  c_gps_lng,
  c_gps_alt,
  c_gps_acc,
  c_village_pop,
  c_black_fly,
  c_cluster_notes,
  created_at

FROM public.oem_oemclusterv<%= xformVersion %>_<%= country %> cl
  LEFT JOIN public.recorders r ON r."RecorderID" = cl.c_recorder_id
  LEFT JOIN public.cluster c ON c."ClusterCode" = cl.c_cluster_id1

SELECT
  d_cluster_id,
  "ClusterName",
  COUNT(CASE WHEN d_lab_ov16 = 'Positive' THEN 1 ELSE NULL END) as "# Positive",
  COUNT(CASE WHEN d_lab_ov16 = 'Invalid' THEN 1 ELSE NULL END) as "# Invalid",
  d_end_time::DATE AS end_time

FROM public.oemdiagnostictestresultsv<%= xformVersion %>_<%= country %>
  WHERE d_end_time::DATE = current_date

GROUP BY d_cluster_id, "ClusterName", end_time

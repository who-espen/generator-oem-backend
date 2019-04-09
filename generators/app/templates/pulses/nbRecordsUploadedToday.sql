SELECT
  p_cluster_id::INT cluster_id,
  p_cluster_name cluster_name,
  '# Participants' "Designation",
  count(id) as "Count"

FROM oemparticipantv<%= xformVersion %>_<%= country %> p

  WHERE created_at::DATE = current_date

GROUP BY cluster_id, cluster_name, "Designation"

UNION

SELECT
  d_cluster_id cluster_id,
  d_cluster_name cluster_name,
  '# RDT OV16 result' "Designation",
  count(id) as "Count"

FROM oemdiagnostictestresultsv<%= xformVersion %>_<%= country %> p

  WHERE created_at::DATE = current_date

GROUP BY cluster_id, cluster_name, "Designation"

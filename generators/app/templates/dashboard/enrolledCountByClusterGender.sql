 SELECT p_cluster_id AS "Cluster ID",
  p_euid,
  CASE WHEN (p_cluster_id = '100' OR p_cluster_id = '200' OR p_cluster_id = '300') THEN 'Yes' ELSE 'No' END as "Is 1st line?",
  COUNT(DISTINCT p_barcode_id) AS "# Participants" ,
  p_sex AS "Gender"
 FROM public.oem_oemparticipantv<%= xformVersion %>_<%= country %> GROUP BY p_cluster_id, p_euid, p_sex HAVING p_sex NOTNULL

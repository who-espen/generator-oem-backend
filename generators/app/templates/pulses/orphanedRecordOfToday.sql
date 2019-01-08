SELECT * FROM (
SELECT
  p.p_cluster_id:: int as cluster_id,
  c."ClusterName",
  'Participant missing results' "Orphaned survey",
  p.p_barcode_id barcode_id,
  p.p_recorder_id recorder_id,
  r."RecorderName",
  p.created_at

 FROM public.oem_oemparticipantv<%= xformVersion %>_<%= country %> p
 LEFT JOIN public.oem_oemdiagnostictestresultsv<%= xformVersion %>_<%= country %> d ON p.p_barcode_id = d.d_barcode_id
 LEFT JOIN public.recorders r ON r."RecorderID" = p.p_recorder_id
 LEFT JOIN public.cluster c ON c."ClusterCode" = p.p_cluster_id::INT
WHERE d.d_barcode_id ISNULL AND p.p_barcode_id IS NOT NULL AND p.created_at::DATE = current_date

  UNION ALL

SELECT
  d.d_cluster_id cluster_id,
  c."ClusterName",
  'Results missing participant' "Orphaned survey",
  d.d_barcode_id barcode_id,
  d.d_recorder_id  recorder_id,
  r."RecorderName",
  d.created_at

 FROM public.oem_oemparticipantv<%= xformVersion %>_<%= country %> p
 RIGHT JOIN public.oem_oemdiagnostictestresultsv<%= xformVersion %>_<%= country %> d ON p.p_barcode_id = d.d_barcode_id
 LEFT JOIN public.recorders r ON r."RecorderID" = d.d_recorder_id
 LEFT JOIN public.cluster c ON c."ClusterCode" = d.d_cluster_id::INT
WHERE p.p_barcode_id ISNULL AND d.created_at::DATE = current_date

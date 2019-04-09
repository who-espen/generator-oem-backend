Select * from (select
  src.p_cluster_id,
  cl."ClusterName",
  src.p_barcode_id BarcodeID,
  r."RecorderName",
  src.p_recorder_id,
  'Participant' Form,
  p_euid,
  created_at "Date"

from oem_oemparticipantv<%= xformVersion %>_<%= country %> src
  LEFT JOIN public.recorders r ON (r."RecorderID" = src.p_recorder_id)
  INNER JOIN public.cluster cl ON (cl."ClusterCode" = src.p_cluster_id::int)
where (select count(*) from oem_oemparticipantv<%= xformVersion %>_<%= country %> inr
where inr.p_barcode_id = src.p_barcode_id ) > 1

UNION ALL

SELECT
  p.p_cluster_id,
  cl."ClusterName",
  d_barcode_id BarcodeID,
  rec."RecorderName",
  p.p_recorder_id,
  'Surveys' Form,
  'Wamako' eu,
  src.created_at "Date"

FROM public.oem_oemdiagnostictestresultsv<%= xformVersion %>_<%= country %> src
  LEFT JOIN public.oem_oemparticipantv<%= xformVersion %>_<%= country %> p ON p.p_barcode_id = src.d_barcode_id
  LEFT JOIN cluster cl ON cl."ClusterCode" = p.p_cluster_id::int
  LEFT JOIN recorders rec ON rec."RecorderID" = p.p_recorder_id

WHERE (select count(*) from public.oem_oemdiagnostictestresultsv<%= xformVersion %>_<%= country %> inr
WHERE inr.d_barcode_id = src.d_barcode_id ) > 1 and src.d_barcode_id <> '' and d_lab_ov16 <> 'Invalid' and d_lab_ov162nd_test = 'No'
) s

order BY s."Date"

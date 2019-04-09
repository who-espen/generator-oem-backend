Select * from (
SELECT
  src.p_cluster_id::INT AS cluster_id,
  src.p_cluster_name AS cluster_name,
  src.p_barcode_id AS barcode_id,
  src.p_recorder_name AS recorder_name,
  src.p_recorder_id AS recorder_id,
  'Participant' AS Form,
  src.p_euid AS eu,
  src.created_at

from public.oemparticipantv4_ale src
where (select count(*) from oemparticipantv4_ale inr
where inr.p_barcode_id = src.p_barcode_id ) > 1

UNION ALL

SELECT
  src.d_cluster_id AS cluster_id,
  src.d_cluster_name AS cluster_name,
  src.d_barcode_id AS barcode_id,
  src.d_recorder_name AS recorder_name,
  src.d_recorder_id AS recorder_id,
  'Participant' AS Form,
  src.d_euid AS eu,
  src.created_at

FROM public.oemdiagnostictestresultsv4_ale src

WHERE (select count(*) from public.oemdiagnostictestresultsv4_ale inr
WHERE inr.d_barcode_id = src.d_barcode_id ) > 1 and src.d_barcode_id <> '' and d_lab_ov16 <> 'Invalid' and d_lab_ov162nd_test = 'No'
) s

order BY s.created_at

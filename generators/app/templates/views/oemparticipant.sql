CREATE VIEW oemparticipantv<%= xformVersion %>_<%= country %> AS

SELECT
  id,
  p_recorder_id,
  r."RecorderName",
  p_district_id,
  p_euid,
  p_cluster_id,
  c."ClusterName",
  p_consent,
  p_how_long_lived,
  p_sex,
  p_age_yrs,
  p_travel,
  p_ivm,
  p_ivm_where,
  p_id_method,
  CASE WHEN (p_generate_id ISNULL OR p_generate_id = '') THEN p_barcode_id ELSE p_generate_id END AS p_barcode_id,
  p_additional_notes,
  created_at

FROM public.oem_oemparticipantv<%= xformVersion %>_<%= country %> p
  LEFT JOIN public.recorders r ON r."RecorderID" = p.p_recorder_id
  LEFT JOIN public.cluster c ON c."ClusterCode" = p.p_cluster_id::INT

CREATE VIEW oemdiagnostictestresultsv<%= xformVersion %>_<%= country %> AS

SELECT
  id,
  d_start_time,
  d_end_time,
  d_recorder_id,
  r."RecorderName",
  d_district_id,
  d_euid,
  d_cluster_id,
  c."ClusterName",
  d_lab_ov162nd_test,
  d_lotnumber,
  d_id_type,
  d_barcode_id,
  d_generate_id,
  d_generate_id2,
  d_lab_ov16,
  d_lab_ov16_invalid,
  d_notes,
  created_at

  FROM public.oem_oemdiagnostictestresultsv<%= xformVersion %>_<%= country %> d

  LEFT JOIN public.recorders r ON r."RecorderID" = d.d_recorder_id
  LEFT JOIN public.cluster c ON c."ClusterCode" = d.d_cluster_id

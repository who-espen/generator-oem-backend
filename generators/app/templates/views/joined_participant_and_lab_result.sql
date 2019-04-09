CREATE VIEW joined_participant_and_lab_result AS

SELECT
  -- Participants --
  p.id p_id,
  p_recorder_id,
  p."RecorderName" p_recorder_name,
  p_district_id,
  p_euid,
  p_cluster_id,
  p."ClusterName" p_cluster_name,
  p_consent,
  p_how_long_lived,
  p_sex,
  p_age_yrs,
  p_travel,
  p_ivm,
  p_ivm_where,
  p_id_method,
  p_barcode_id,
  p_additional_notes,
  p.created_at p_created_at,

  -- Cluster --
  c.id c_id,
  c_start_time,
  c_end_time,
  c_recorder_id,
  c."RecorderName" c_recorder_name,
  c_district_id,
  c_eu,
  c_cluster_id1,
  c_cluster_id2,
  c."ClusterName" c_cluster_name,
  c_gps_lat,
  c_gps_lng,
  c_gps_alt,
  c_gps_acc,
  c_village_pop,
  c_black_fly,
  c_cluster_notes,
  c.created_at c_created_at,

  -- Results --
  d.id d_id,
  d_start_time,
  d_end_time,
  d_recorder_id,
  d."RecorderName" d_recorder_name,
  d_district_id,
  d_euid,
  d_cluster_id,
  c."ClusterName" d_cluster_name,
  d_lab_ov162nd_test,
  d_lotnumber,
  d_id_type,
  d_barcode_id,
  d_lab_ov16,
  d_lab_ov16_invalid,
  d_notes,
  d.created_at d_created_at

FROM public.oemparticipantv<%= xformVersion %>_<%= country %> p
  LEFT JOIN public.oemclusterv<%= xformVersion %>_<%= country %> c ON c.c_cluster_id1 = p.p_cluster_id::INT
  INNER JOIN public.oemdiagnostictestresultsv<%= xformVersion %>_<%= country %> d ON d.d_barcode_id = p.p_barcode_id

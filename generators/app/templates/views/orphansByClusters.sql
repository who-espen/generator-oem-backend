CREATE VIEW orphans_by_cluster AS

 SELECT
  r.d_euid euid,
  r.d_district_id district_id,
  'Results missing participant'::text AS orphaned_records,
  count(r.id) AS count
   FROM (oem_oemparticipantv<%= xformVersion %>_<%= country %> p
     RIGHT JOIN oem_oemdiagnostictestresultsv<%= xformVersion %>_<%= country %> r ON ((p.p_barcode_id = r.d_barcode_id)))
  WHERE (p.p_barcode_id IS NULL)
  GROUP BY d_euid, d_district_id

  UNION

   SELECT
  p.p_euid euid,
  p.p_district_id district_id,
  'Participant missing results'::text AS orphaned_records,
  count(p.id) AS count
   FROM (oem_oemparticipantv<%= xformVersion %>_<%= country %> p
     LEFT JOIN oem_oemdiagnostictestresultsv<%= xformVersion %>_<%= country %> r ON ((p.p_barcode_id = r.d_barcode_id)))
  WHERE (r.d_barcode_id IS NULL)
  GROUP BY p_euid, p_district_id

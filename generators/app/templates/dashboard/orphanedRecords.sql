SELECT * FROM (
SELECT p.p_cluster_id:: int as cluster_id,
  'Participant missing results' "Orphaned survey",
  count(p.id) count
  FROM public.oem_oemparticipantv<%= xformVersion %>_<%= country %> p
  LEFT JOIN public.oem_oemdiagnostictestresultsv<%= xformVersion %>_<%= country %> r ON p.p_barcode_id = r.d_barcode_id
WHERE r.d_barcode_id ISNULL
  GROUP BY cluster_id

  UNION

  SELECT r.d_cluster_id cluster_id,
  'Results missing participant' "Orphaned survey",
  count(r.id) count
  FROM public.oem_oemparticipantv<%= xformVersion %>_<%= country %> p
  RIGHT JOIN public.oem_oemdiagnostictestresultsv<%= xformVersion %>_<%= country %> r ON p.p_barcode_id = r.d_barcode_id
WHERE p.p_barcode_id ISNULL
  GROUP BY cluster_id
) s

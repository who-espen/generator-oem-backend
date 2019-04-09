SELECT
  s.d_lab_ov16 AS "Result",
  COUNT(s.d_barcode_id) AS "Count"
FROM public.oem_oemdiagnostictestresultsv<%= xformVersion %>_<%= country %> s

GROUP BY d_lab_ov16

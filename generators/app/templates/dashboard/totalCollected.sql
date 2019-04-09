SELECT
  'Examined by RDT OV16' "Designation",
  COUNT(s.d_barcode_id) AS "Count"
FROM oem_oemdiagnostictestresultsv<%= xformVersion %>_<%= country %> s

GROUP BY "Designation"

UNION

SELECT
  'DBS Collected' "Designation",
  COUNT(s.d_barcode_id) AS "Count"
FROM oem_oemdiagnostictestresultsv<%= xformVersion %>_<%= country %> s

GROUP BY "Designation"

UNION

SELECT
  'Participants' "Designation",
  COUNT(s.id) AS "Count"
FROM oem_oemparticipantv<%= xformVersion %>_<%= country %> s

group by "Designation"

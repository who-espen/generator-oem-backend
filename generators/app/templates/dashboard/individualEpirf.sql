 SELECT
  'Mapping - Individual level' "Type of survey",
  'Kebbi' "State",
  REPLACE( p_district_id, RIGHT(p_district_id, 7), '') "Name of administrative level 2",
  c."ClusterName" "Name of community surveyed",
  'November' "Month",
  '2018' "Year",
  cl.c_gps_lat::text "Latitude",
  cl.c_gps_lng::text "Longitude",
  'RDT' "Diagnostic for serology",
  CASE WHEN (cl.c_cluster_id1 = 500 OR cl.c_cluster_id1 = 600 OR cl.c_cluster_id1 = 700 OR cl.c_cluster_id1 = 900) THEN 'Convenient' ELSE 'Cluster' END AS "Sampling Methods",
  1 "Number of people examined",
   CASE WHEN p.p_age_yrs BETWEEN 5 AND 9 THEN '5 - 9'
     WHEN p.p_age_yrs BETWEEN 10 AND 14 THEN '10 - 14'
     WHEN p.p_age_yrs BETWEEN 15 AND 19 THEN '15 - 19'
     WHEN p.p_age_yrs BETWEEN 20 AND 29 THEN '20 - 29'
     WHEN p.p_age_yrs BETWEEN 30 AND 39 THEN '30 - 39'
     WHEN p.p_age_yrs BETWEEN 40 AND 49 THEN '40 - 49'
     WHEN p.p_age_yrs BETWEEN 50 AND 59 THEN '50 - 59'
     WHEN p.p_age_yrs > 59 THEN '> 59' END AS "Age group surveyed(Min - Max)",
  (CASE WHEN r.d_lab_ov16 = 'Positive' THEN 1 ELSE 0 END) "Positive",
  (CASE WHEN p.p_sex = 'Female' THEN 'F' ELSE 'M' END) "% Female",
  (CASE WHEN r.d_lab_ov16 = 'Positive' THEN 100 ELSE 0 END) "% Positive"


FROM public.oem_oemparticipantv<%= xformVersion %>_<%= country %> p
  INNER JOIN public.cluster c ON (c."ClusterCode" = p.p_cluster_id::INT)
  LEFT JOIN public.oem_oemclusterv<%= xformVersion %>_<%= country %> cl ON (cl.c_cluster_id1 = p.p_cluster_id::INT)
  LEFT OUTER JOIN (SELECT DISTINCT d_barcode_id, d_lab_ov16 FROM public.oem_oemdiagnostictestresultsv<%= xformVersion %>_<%= country %> WHERE d_lab_ov16 <> 'Invalid') r ON (r.d_barcode_id = p.p_barcode_id)


select CONCAT(COUNT(CASE WHEN d_lab_ov16 = 'Positive' THEN 1 ELSE NULL END), ' (', CASE WHEN COUNT(d_barcode_id) > 0 THEN round(COUNT(CASE WHEN d_lab_ov16 = 'Positive' THEN 1 ELSE NULL END)*100/COUNT(d_barcode_id)::decimal,2) ELSE 0 END,' %)')

  from public.oemdiagnostictestresultsv<%= xformVersion %>_<%= country %>

-- Todo Place condition 2nd line village column
--where (d_cluster_id <> 100 AND d_cluster_id <> 200 AND d_cluster_id <> 300 AND d_cluster_id <> 500 AND d_cluster_id <> 600 AND d_cluster_id <> 700 AND d_cluster_id <> 900)

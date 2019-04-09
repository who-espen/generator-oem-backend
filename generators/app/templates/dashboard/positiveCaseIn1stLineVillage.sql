
select CONCAT(COUNT(CASE WHEN d_lab_ov16 = 'Positive' THEN 1 ELSE NULL END), ' (', CASE WHEN COUNT(d_barcode_id) > 0 THEN round(COUNT(CASE WHEN d_lab_ov16 = 'Positive' THEN 1 ELSE NULL END)*100/COUNT(d_barcode_id)::decimal,2) ELSE 0 END,' %)')

  from public.oemdiagnostictestresultsv<%= xformVersion %>_<%= country %>
-- Todo Place condition 1st line village column
--where (d_cluster_id = 100 OR d_cluster_id = 200 OR d_cluster_id = 300 OR d_cluster_id = 500 OR d_cluster_id = 600 OR d_cluster_id = 700 OR d_cluster_id = 900)

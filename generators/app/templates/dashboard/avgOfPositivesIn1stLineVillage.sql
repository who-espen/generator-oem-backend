
select CONCAT(AVG(p_age_yrs)::int, ' (', median(p_age_yrs)::int, ')')

  from public.joined_participant_and_lab_result
where d_lab_ov16 = 'Positive'
  -- Todo: Add filter for 1st line village
  -- and (p_cluster_id = '100' OR p_cluster_id = '200' OR p_cluster_id ='300' OR p_cluster_id = '500' OR p_cluster_id = '600' OR p_cluster_id = '700' OR p_cluster_id = '900') 

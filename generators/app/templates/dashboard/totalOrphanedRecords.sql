 SELECT
  orphaned_records,
  sum("count") count
  FROM orphans_by_cluster
  group BY orphaned_records

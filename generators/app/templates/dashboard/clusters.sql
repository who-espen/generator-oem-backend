SELECT "public"."cluster"."ClusterCode" AS "ClusterCode",
  "public"."cluster"."ClusterName" AS "ClusterName",
-- Todo: Update condition for first line village
  CASE WHEN ("ClusterCode" = '100' OR "ClusterCode" = '200' OR "ClusterCode" = '300' OR "ClusterCode" = '500' OR "ClusterCode" = '600' OR "ClusterCode" = '700')
    THEN 'Yes' ELSE 'No' END as "Is 1st line?"
FROM "public"."cluster"

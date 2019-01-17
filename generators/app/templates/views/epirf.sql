CREATE VIEW eirf AS
   SELECT
    'Mapping'::text AS "Type of survey",
    'Kebbi'::text AS "State",
    replace(p.p_district_id, "right"(p.p_district_id, 7), ''::text) AS "Name of administrative level 2",
    c."ClusterName" AS "Name of community surveyed",
    'November'::text AS "Month",
    '2018'::text AS "Year",
    round(cl.c_gps_lat, 5) AS "Latitude",
    round(cl.c_gps_lng, 5) AS "Longitude",
    'RDT'::text AS "Diagnostic for serology",
    CASE WHEN ((cl.c_cluster_id1 = 500) OR (cl.c_cluster_id1 = 600) OR (cl.c_cluster_id1 = 700) OR (cl.c_cluster_id1 = 900)) THEN 'Convenient'::text
                    ELSE 'Cluster'::text END AS "Sampling Methods",
    count(p.id) AS "Number of people examined",
    min(p.p_age_yrs) AS "Age Min",
    max(p.p_age_yrs) AS "Age Max",
    count(CASE WHEN (r.d_lab_ov16 = 'Positive'::text) THEN 1 ELSE NULL::integer END) AS "Positive",
    (((count(CASE WHEN (r.d_lab_ov16 = 'Positive'::text) THEN 1 ELSE NULL::integer END) * 100))::numeric / (count(p.p_barcode_id))::numeric) AS "% Positive"

    FROM (((oem_oemparticipantv<%= xformVersion %>_<%= country %> p
      JOIN cluster c ON ((c."ClusterCode" = ((p.p_cluster_id)::integer)::numeric)))
      LEFT JOIN oem_oemclusterv<%= xformVersion %>_<%= country %> cl ON ((cl.c_cluster_id1 = (p.p_cluster_id)::integer)))
      LEFT JOIN ( SELECT DISTINCT oem_oemdiagnostictestresultsv<%= xformVersion %>_<%= country %>.d_barcode_id,
                     oem_oemdiagnostictestresultsv<%= xformVersion %>_<%= country %>.d_lab_ov16
                   FROM oem_oemdiagnostictestresultsv<%= xformVersion %>_<%= country %>
                   WHERE (oem_oemdiagnostictestresultsv<%= xformVersion %>_<%= country %>.d_lab_ov16 <> 'Invalid'::text)) r ON ((r.d_barcode_id = p.p_barcode_id)))
     GROUP BY (replace(p.p_district_id, "right"(p.p_district_id, 7), ''::text)), c."ClusterName", (round(cl.c_gps_lat, 5)), (round(cl.c_gps_lng, 5)), cl.c_cluster_id1

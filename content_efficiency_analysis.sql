SELECT
  term,
  rank,
  refresh_date
FROM
  `bigquery-public-data.google_trends.top_terms`
WHERE
  (LOWER(term) LIKE '%vacation%' 
   OR LOWER(term) LIKE '%food%' 
   OR LOWER(term) LIKE '%travel%')
  AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 30 DAY)
ORDER BY
  refresh_date DESC, rank ASC
LIMIT 100;

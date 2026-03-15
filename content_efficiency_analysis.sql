-- GOAL: Identify "High-Efficiency" content that drives engagement with low view counts.
-- This mirrors the logic of finding "High-Value" delivery zones in a city.

SELECT 
    video_category,
    SUM(view_count) AS total_views,
    ROUND(AVG(like_count / view_count) * 100, 2) AS engagement_rate_percentage,
    SUM(comment_count) AS total_feedback
FROM `public_datasets.youtube_video_metadata`
WHERE publish_date >= '2024-01-01'
GROUP BY video_category
HAVING total_views > 10000
ORDER BY engagement_rate_percentage DESC;

-- GOAL: Subscriber Conversion Logic
-- Finding which videos actually "scale" the business (gain subscribers).

SELECT 
    video_id,
    title,
    subscribers_gained,
    view_count,
    (subscribers_gained / view_count) * 100 AS conversion_velocity
FROM `public_datasets.youtube_video_metadata`
ORDER BY conversion_velocity DESC
LIMIT 10;

USE sql_course;

SELECT
    s.skills,
    COUNT(sj.job_id) AS demand_count
FROM skills_job_dim AS sj
JOIN skills_dim AS s
    ON sj.skill_id = s.skill_id
JOIN job_postings_fact AS j
    ON sj.job_id = j.job_id
WHERE j.job_title_short = 'Data Analyst'
GROUP BY s.skills
ORDER BY demand_count DESC
LIMIT 10;
USE sql_course;

SELECT
    s.skills,
    COUNT(sj.job_id) AS demand_count,
    ROUND(AVG(j.salary_year_avg), 0) AS avg_salary
FROM skills_job_dim AS sj
INNER JOIN skills_dim AS s
    ON sj.skill_id = s.skill_id
INNER JOIN job_postings_fact AS j
    ON sj.job_id = j.job_id
WHERE j.job_title_short = 'Data Analyst'
    AND j.salary_year_avg IS NOT NULL
GROUP BY s.skills
HAVING COUNT(sj.job_id) >= 20
ORDER BY demand_count DESC, avg_salary DESC
LIMIT 10;
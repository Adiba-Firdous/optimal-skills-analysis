USE sql_course;

-- Project Question #1:
-- What are the highest-paying Data Analyst jobs?

SELECT
    j.job_id,
    j.job_title,
    c.name AS company_name,
    j.job_location,
    j.salary_year_avg
FROM job_postings_fact AS j
LEFT JOIN company_dim AS c
    ON j.company_id = c.company_id
WHERE j.job_title_short = 'Data Analyst'
    AND j.salary_year_avg IS NOT NULL
ORDER BY j.salary_year_avg DESC
LIMIT 10;
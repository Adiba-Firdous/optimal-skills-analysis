SELECT
    j.job_id,
    j.job_title,
    j.salary_year_avg,
    s.skills
FROM (
    SELECT
        job_id,
        job_title,
        salary_year_avg
    FROM job_postings_fact
    WHERE job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
) AS j
INNER JOIN skills_job_dim AS sj
    ON j.job_id = sj.job_id
INNER JOIN skills_dim AS s
    ON sj.skill_id = s.skill_id
ORDER BY j.salary_year_avg DESC, s.skills;
USE sql_course;

-- 1. Company dimension table
CREATE TABLE company_dim (
    company_id INT PRIMARY KEY,
    name TEXT,
    link TEXT,
    link_google TEXT,
    thumbnail TEXT
);

-- 2. Skills dimension table
CREATE TABLE skills_dim (
    skill_id INT PRIMARY KEY,
    skills TEXT,
    type TEXT
);

-- 3. Job postings fact table
CREATE TABLE job_postings_fact (
    job_id INT PRIMARY KEY,
    company_id INT,
    job_title_short VARCHAR(255),
    job_title TEXT,
    job_location TEXT,
    job_via TEXT,
    job_schedule_type TEXT,
    job_work_from_home BOOLEAN,
    search_location TEXT,
    job_posted_date DATETIME,
    job_no_degree_mention BOOLEAN,
    job_health_insurance BOOLEAN,
    job_country TEXT,
    salary_rate TEXT,
    salary_year_avg DECIMAL(12,2),
    salary_hour_avg DECIMAL(12,2),

    FOREIGN KEY (company_id)
        REFERENCES company_dim(company_id)
);

-- 4. Job-Skills bridge table
CREATE TABLE skills_job_dim (
    job_id INT,
    skill_id INT,

    PRIMARY KEY (job_id, skill_id),

    FOREIGN KEY (job_id)
        REFERENCES job_postings_fact(job_id),

    FOREIGN KEY (skill_id)
        REFERENCES skills_dim(skill_id)
);

-- Indexes for faster joins
CREATE INDEX idx_company_id
ON job_postings_fact(company_id);

CREATE INDEX idx_skill_id
ON skills_job_dim(skill_id);

CREATE INDEX idx_job_id
ON skills_job_dim(job_id);
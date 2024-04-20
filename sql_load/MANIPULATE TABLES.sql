MANIPULATE TABLES 

/* 
Create a table named data_science_jobs that will hold information about job postings. 
Include the following columns: job_id (integer and primary key), job_title (text), 
company_name (text), and post_date (date).

*/
CREATE TABLE data_science_jobs (
    job_id INT PRIMARY KEY,
    job_title TEXT,
    company_name TEXT,
    post_date DATE
);

/*
Insert three job postings into the data_science_jobs table. Make sure each job posting has a unique job_id, a job_title, a company_name, and a post_date.
*/
INSERT INTO data_science_jobs 
(job_id, job_title, company_name, post_date)
VALUES
(1, 'Data Scientist', 'Tech Innovations', '2023-01-01'),
(2, 'Machine Learning Engineer', 'Data Driven Co', '2023-01-15'),
(3, 'AI Specialist', 'Future Tech', '2023-02-01');

/*
Alter the data_science_jobs table to add a new Boolean column (uses True or False values) named remote.
*/

ALTER TABLE data_science_jobs 
ADD COLUMN remote BOOLEAN;

/*
Rename the post_date column to posted_on from the data_science_job table.
*/

ALTER TABLE data_science_jobs 
RENAME COLUMN post_date TO posted_on;
/*
Modify the remote column so that it defaults to FALSE in the data_science_job table .


*/

ALTER TABLE data_science_jobs 
ALTER COLUMN remote SET DEFAULT FALSE;

-- Note: We won't be inserting anything into remote due to how the default value works
INSERT INTO data_science_jobs (job_id, job_title, company_name, posted_on)
VALUES
(4, 'Data Scientist', 'Google', '2023-02-05');

/*
Drop the company_name column from the data_science_jobs table.
*/

ALTER TABLE data_science_jobs 
DROP COLUMN company_name;

/*
pdate the job posting with the job_id = 2 . Update the remote column for this job posting to TRUE in data_science_jobs.
*/

UPDATE data_science_jobs 
SET remote = TRUE WHERE job_id = 2;

/*
Drop the data_science_jobs table.

*/

DROP TABLE data_science_jobs;

/*
Create separate table form the first 3 month from the date column

*/

CREATE TABLE january_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1
/*

*/


/*

*/
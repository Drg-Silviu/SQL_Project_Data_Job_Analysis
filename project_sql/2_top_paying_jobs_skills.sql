/*
Question: What are the top-paying data analyst jobs, and what skills are required?
- Identify the top 10 highest-paying Data Analyst jobs and the specific skills required for these roles.
- Filters for roles with specified salaries that are remote
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS
(
SELECT
    job_id,
	job_title,
	salary_year_avg,
	name AS company_name 
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE   
 	job_location = 'United Kingdom' AND
 	salary_year_avg IS NOT NULL AND
	job_title_short = 'Data Analyst'

ORDER BY
	salary_year_avg DESC
LIMIT 10
)

SELECT
    top_paying_jobs.job_id,
    top_paying_jobs.company_name,
    job_title,
    salary_year_avg,
    skills
FROM
    top_paying_jobs
INNER JOIN
    skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*
Here's the breakdown of the most demanded skills for data analysts in 2023 in United Kingdom, based on job postings:
-finding 1
-finding 2
etc

JSON CODE:
[
  {
    "job_id": 1401033,
    "company_name": "Deutsche Bank",
    "job_title": "Market Data Lead Analyst",
    "salary_year_avg": "180000.0",
    "skills": "excel"
  },
  {
    "job_id": 1813715,
    "company_name": "Shell",
    "job_title": "Data Architect - Trading and Supply",
    "salary_year_avg": "156500.0",
    "skills": "shell"
  },
  {
    "job_id": 1813715,
    "company_name": "Shell",
    "job_title": "Data Architect - Trading and Supply",
    "salary_year_avg": "156500.0",
    "skills": "express"
  },
  {
    "job_id": 1813715,
    "company_name": "Shell",
    "job_title": "Data Architect - Trading and Supply",
    "salary_year_avg": "156500.0",
    "skills": "excel"
  },
  {
    "job_id": 1813715,
    "company_name": "Shell",
    "job_title": "Data Architect - Trading and Supply",
    "salary_year_avg": "156500.0",
    "skills": "flow"
  },
  {
    "job_id": 694461,
    "company_name": "Hasbro",
    "job_title": "Sr Data Analyst",
    "salary_year_avg": "118140.0",
    "skills": "sql"
  },
  {
    "job_id": 694461,
    "company_name": "Hasbro",
    "job_title": "Sr Data Analyst",
    "salary_year_avg": "118140.0",
    "skills": "python"
  },
  {
    "job_id": 694461,
    "company_name": "Hasbro",
    "job_title": "Sr Data Analyst",
    "salary_year_avg": "118140.0",
    "skills": "jupyter"
  },
  {
    "job_id": 694461,
    "company_name": "Hasbro",
    "job_title": "Sr Data Analyst",
    "salary_year_avg": "118140.0",
    "skills": "tableau"
  },
  {
    "job_id": 694461,
    "company_name": "Hasbro",
    "job_title": "Sr Data Analyst",
    "salary_year_avg": "118140.0",
    "skills": "power bi"
  },
  {
    "job_id": 694461,
    "company_name": "Hasbro",
    "job_title": "Sr Data Analyst",
    "salary_year_avg": "118140.0",
    "skills": "looker"
  },
  {
    "job_id": 377642,
    "company_name": "esure Group",
    "job_title": "Fraud Data Analyst",
    "salary_year_avg": "109000.0",
    "skills": "sql"
  },
  {
    "job_id": 377642,
    "company_name": "esure Group",
    "job_title": "Fraud Data Analyst",
    "salary_year_avg": "109000.0",
    "skills": "python"
  },
  {
    "job_id": 377642,
    "company_name": "esure Group",
    "job_title": "Fraud Data Analyst",
    "salary_year_avg": "109000.0",
    "skills": "sas"
  },
  {
    "job_id": 377642,
    "company_name": "esure Group",
    "job_title": "Fraud Data Analyst",
    "salary_year_avg": "109000.0",
    "skills": "excel"
  },
  {
    "job_id": 377642,
    "company_name": "esure Group",
    "job_title": "Fraud Data Analyst",
    "salary_year_avg": "109000.0",
    "skills": "tableau"
  },
  {
    "job_id": 377642,
    "company_name": "esure Group",
    "job_title": "Fraud Data Analyst",
    "salary_year_avg": "109000.0",
    "skills": "sas"
  },
  {
    "job_id": 1315562,
    "company_name": "Syngenta Group",
    "job_title": "Project Data Analyst - Operational Excellence",
    "salary_year_avg": "105000.0",
    "skills": "tableau"
  },
  {
    "job_id": 150907,
    "company_name": "Flagship Pioneering, Inc.",
    "job_title": "Senior Scientist, Computational Biology",
    "salary_year_avg": "89100.0",
    "skills": "python"
  },
  {
    "job_id": 150907,
    "company_name": "Flagship Pioneering, Inc.",
    "job_title": "Senior Scientist, Computational Biology",
    "salary_year_avg": "89100.0",
    "skills": "go"
  },
  {
    "job_id": 150907,
    "company_name": "Flagship Pioneering, Inc.",
    "job_title": "Senior Scientist, Computational Biology",
    "salary_year_avg": "89100.0",
    "skills": "jupyter"
  },
  {
    "job_id": 150907,
    "company_name": "Flagship Pioneering, Inc.",
    "job_title": "Senior Scientist, Computational Biology",
    "salary_year_avg": "89100.0",
    "skills": "git"
  },
  {
    "job_id": 150907,
    "company_name": "Flagship Pioneering, Inc.",
    "job_title": "Senior Scientist, Computational Biology",
    "salary_year_avg": "89100.0",
    "skills": "unify"
  },
  {
    "job_id": 985232,
    "company_name": "Campari Group",
    "job_title": "Global IT Data Analytics Solutions Expert",
    "salary_year_avg": "86400.0",
    "skills": "python"
  },
  {
    "job_id": 985232,
    "company_name": "Campari Group",
    "job_title": "Global IT Data Analytics Solutions Expert",
    "salary_year_avg": "86400.0",
    "skills": "r"
  },
  {
    "job_id": 985232,
    "company_name": "Campari Group",
    "job_title": "Global IT Data Analytics Solutions Expert",
    "salary_year_avg": "86400.0",
    "skills": "azure"
  },
  {
    "job_id": 985232,
    "company_name": "Campari Group",
    "job_title": "Global IT Data Analytics Solutions Expert",
    "salary_year_avg": "86400.0",
    "skills": "databricks"
  },
  {
    "job_id": 985232,
    "company_name": "Campari Group",
    "job_title": "Global IT Data Analytics Solutions Expert",
    "salary_year_avg": "86400.0",
    "skills": "sap"
  },
  {
    "job_id": 227038,
    "company_name": "Nominet",
    "job_title": "Data Analyst",
    "salary_year_avg": "77017.5",
    "skills": "sql"
  },
  {
    "job_id": 227038,
    "company_name": "Nominet",
    "job_title": "Data Analyst",
    "salary_year_avg": "77017.5",
    "skills": "python"
  },
  {
    "job_id": 227038,
    "company_name": "Nominet",
    "job_title": "Data Analyst",
    "salary_year_avg": "77017.5",
    "skills": "r"
  },
  {
    "job_id": 1059513,
    "company_name": "Informa Group Plc.",
    "job_title": "Data Analyst - Customer Services",
    "salary_year_avg": "75550.0",
    "skills": "typescript"
  },
  {
    "job_id": 1059513,
    "company_name": "Informa Group Plc.",
    "job_title": "Data Analyst - Customer Services",
    "salary_year_avg": "75550.0",
    "skills": "vba"
  },
  {
    "job_id": 1059513,
    "company_name": "Informa Group Plc.",
    "job_title": "Data Analyst - Customer Services",
    "salary_year_avg": "75550.0",
    "skills": "excel"
  },
  {
    "job_id": 1059513,
    "company_name": "Informa Group Plc.",
    "job_title": "Data Analyst - Customer Services",
    "salary_year_avg": "75550.0",
    "skills": "power bi"
  },
  {
    "job_id": 1059513,
    "company_name": "Informa Group Plc.",
    "job_title": "Data Analyst - Customer Services",
    "salary_year_avg": "75550.0",
    "skills": "notion"
  },
  {
    "job_id": 453109,
    "company_name": "CHANEL",
    "job_title": "Global Mobility Data Analyst",
    "salary_year_avg": "75067.5",
    "skills": "excel"
  }
]
*/
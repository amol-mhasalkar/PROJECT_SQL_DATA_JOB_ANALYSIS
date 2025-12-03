/*
Jira-1101: What are the top-paying data analyst jobs?

- Identify the top 10 highest-paying Data Analyst roles that are available remotely.

- Focus on job postings with specified salaries (remove NULLs).

- Why? Highlight the top-paying opportunities for Data Analysts, optimal skills,
   and roles to pursue as a Data Analyst.

*/

SELECT
        JOB_ID
        , JOB_TITLE
        , JOB_COUNTRY
        , JOB_SCHEDULE_TYPE
        , SALARY_YEAR_AVG
        , NAME AS COMPANY_NAME
FROM
        JOB_POSTINGS_FACT JOB
JOIN    COMPANY_DIM COMP
        ON JOB.COMPANY_ID = COMP.COMPANY_ID
WHERE   
        JOB_TITLE_SHORT = 'Data Analyst'
        AND SALARY_YEAR_AVG IS NOT NULL
        AND JOB_LOCATION = 'Anywhere'           -- ONLY REMOTE JOBS
ORDER BY
        SALARY_YEAR_AVG DESC
LIMIT 10;
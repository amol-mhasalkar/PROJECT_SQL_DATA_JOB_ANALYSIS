/* 
Question: What skills are required for the top-paying Data Analyst jobs?

- Utilize the top 10 highest-paying Data Analyst jobs from the first query.

- Include the specific skills required for these roles.

- Why? This provides a detailed look at which high-paying jobs demand certain skills,
 helping job seekers understand which skills to develop to align with top salaries. 
 */

WITH TOP_PAYING_JOBS AS
(
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
    -- LIMIT 10
)
SELECT  TOP_PAYING_JOBS.*
        , SKILLS
FROM    TOP_PAYING_JOBS
JOIN    SKILLS_JOB_DIM AS SILLS_JOB ON  SILLS_JOB.JOB_ID = TOP_PAYING_JOBS.JOB_ID
JOIN    SKILLS_DIM AS SKILLS ON  SKILLS.SKILL_ID = SILLS_JOB.SKILL_ID
ORDER BY
        SALARY_YEAR_AVG DESC
        , SKILLS ;


/* Top Skills
Here is the breakdown of the most demanded skils for the post of "Data Analyst"
for "remote" jobs only. 
Based on the jobs postings:
SQL is top demanding skill with 398 times.
Excel is 256 times followed by python and tableau 236 and 230 respectively.
Also needed R, SAS Power BI skills as they appeared 148, 126 and 110 times.
Rest all skills demand is lesser than 25% overall skills as all rest skills
are less than 100.
*/
/*
Jira 1104: What are the top skills based on salary?
- Examine the average salary associated with each skill for Data Analyst positions.
- Focus on roles with specified salaries, regardless of location.

Why? This reveals how different skills impact salary levels for Data Analysts 
and helps identify the most financially rewarding skills to acquire for improvement.
*/


SELECT
        SKILLS
        , ROUND(AVG(SALARY_YEAR_AVG)) AVG_SALARY
FROM
        JOB_POSTINGS_FACT   JP
JOIN    SKILLS_JOB_DIM      SJ  ON SJ.JOB_ID = JP.JOB_ID
JOIN    SKILLS_DIM          S   ON S.SKILL_ID = SJ.SKILL_ID
WHERE   1=1
AND     SALARY_YEAR_AVG     IS NOT NULL
AND     JOB_TITLE_SHORT     = 'Data Analyst'
--    AND JOB_WORK_FROM_HOME  = TRUE
GROUP BY SKILLS
ORDER BY AVG_SALARY     DESC
LIMIT 50;


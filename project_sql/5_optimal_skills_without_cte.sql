SELECT
        S.SKILL_ID "Skill Id"
        , S.SKILLS "Skill Name"
        , COUNT(SK.JOB_ID) "Job Count"
        , ROUND(AVG(J.SALARY_YEAR_AVG)) "AVG Salary"        
FROM
        JOB_POSTINGS_FACT   J
JOIN    SKILLS_JOB_DIM  SK ON SK.JOB_ID = J.JOB_ID
JOIN    SKILLS_DIM  S ON S.SKILL_ID = SK.SKILL_ID
WHERE   1=1
AND     J.JOB_TITLE_SHORT = 'Data Analyst'
AND     J.JOB_WORK_FROM_HOME = TRUE
AND     J.SALARY_YEAR_AVG IS NOT NULL
GROUP BY
        S.SKILL_ID
HAVING 
        COUNT(SK.JOB_ID) > 10
ORDER BY
        "Job Count" DESC
        , "AVG Salary" DESC
        
LIMIT
        25;
       


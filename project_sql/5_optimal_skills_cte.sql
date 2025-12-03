/*
Jira-1105: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis


*/


-- Job Title    ==> Data Analyst
-- Remote       ==> Yes
-- Show         ==> For Entire Data


WITH SKILLS_DEMAND AS (
    SELECT
            S.SKILL_ID
            , S.SKILLS
            , COUNT(SJ.JOB_ID) JOB_DEMAND
    FROM
            JOB_POSTINGS_FACT JPF
    JOIN    SKILLS_JOB_DIM  SJ ON SJ.JOB_ID = JPF.job_id
    JOIN    SKILLS_DIM S ON S.SKILL_ID = SJ.SKILL_ID
    WHERE   1=1
    AND     SALARY_YEAR_AVG     IS NOT NULL
    AND     JOB_TITLE_SHORT     = 'Data Analyst'
    AND     JOB_WORK_FROM_HOME  = TRUE
    GROUP BY
            S.SKILL_ID
),

AVG_SALARY AS (
    SELECT
            S.SKILL_ID
            , ROUND(AVG(SALARY_YEAR_AVG)) AVG_SALARY
    FROM
            JOB_POSTINGS_FACT   JP
    JOIN    SKILLS_JOB_DIM      SJ  ON SJ.JOB_ID = JP.JOB_ID
    JOIN    SKILLS_DIM          S   ON S.SKILL_ID = SJ.SKILL_ID
    WHERE   1=1
    AND     SALARY_YEAR_AVG     IS NOT NULL
    AND     JOB_TITLE_SHORT     = 'Data Analyst'
    AND     JOB_WORK_FROM_HOME  = TRUE
    GROUP BY 
            S.SKILL_ID
)

SELECT  DISTINCT
        D.SKILL_ID         "Skill Id"
        , D.SKILLS         "Skill Name"
        , D.JOB_DEMAND     "Number of Jobs "
        , SAL.AVG_SALARY   "Avg Salary"
FROM 
        SKILLS_DEMAND D
JOIN    
        AVG_SALARY SAL  ON SAL.SKILL_ID = D.SKILL_ID
WHERE   
        D.JOB_DEMAND > 10
ORDER BY
        JOB_DEMAND DESC
        , AVG_SALARY DESC
LIMIT   
        25
;
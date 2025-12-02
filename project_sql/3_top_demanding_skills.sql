/*
 Question: What are the most "in-demand" SKILLS for "Data Analysts"?

- Join job postings using an inner join similar to query #2.
- Identify the top 5 in-demand skills for a Data Analyst.
- Focus on all job postings.

- Why? Retrieve the top 5 skills with the highest demand in 
the job market, providing insights into the most valuable 
skills for job seekers.
*/

SELECT 
        SKILLS                          SKILL_NAME
        , COUNT(SKILLS_JOB.SKILL_ID)    SKILL_COUNT
FROM    
        SKILLS_JOB_DIM  SKILLS_JOB
JOIN    
        SKILLS_DIM AS SKILLS 
    ON  SKILLS.SKILL_ID = SKILLS_JOB.SKILL_ID
JOIN    JOB_POSTINGS_FACT AS JOB 
    ON  JOB.JOB_ID = SKILLS_JOB.JOB_ID
WHERE   
        JOB_TITLE_SHORT = 'Data Analyst'
GROUP BY
        SKILLS.SKILLS
ORDER BY 
        SKILL_COUNT DESC
LIMIT   5        ;

/*
For the Data Analyst post, SQL is must skill appearing it 92628 times


*/
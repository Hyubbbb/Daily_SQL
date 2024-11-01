SELECT CON.contest_id, CON.hacker_id, CON.name,
    SUM(sum_submissions), 
    SUM(sum_accepted_submissions), 
    SUM(sum_views), 
    SUM(sum_unique_views)
    
FROM CONTESTS CON

JOIN COLLEGES COL
    ON CON.contest_id = COL.contest_id
    
JOIN CHALLENGES CHA
    ON COL.college_id = CHA.college_id
    
LEFT JOIN (SELECT challenge_id,
        SUM(total_views) AS sum_views,
        SUM(total_unique_views) AS sum_unique_views
      FROM VIEW_STATS
      GROUP BY challenge_id) VIEW
    ON CHA.challenge_id = VIEW.challenge_id
    
LEFT JOIN (SELECT challenge_id,
        SUM(total_submissions) AS sum_submissions,
        SUM(total_accepted_submissions) AS sum_accepted_submissions
       FROM SUBMISSION_STATS
      GROUP BY challenge_id) SUB
    ON CHA.challenge_id = SUB.challenge_id
    
GROUP BY CON.contest_id, CON.hacker_id, CON.name 
    HAVING SUM(sum_submissions) != 0 OR
          SUM(sum_accepted_submissions) != 0 OR
          SUM(sum_views) != 0 OR
          SUM(sum_unique_views) != 0
          
ORDER BY CON.contest_id

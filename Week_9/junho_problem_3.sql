SELECT con.contest_id, con.hacker_id, con.name, sum(total_submissions), sum(total_accepted_submissions), sum(total_views), sum(total_unique_views)
FROM contests as con
JOIN colleges as col
ON con.contest_id = col.contest_id
JOIN challenges as cha
ON col.college_id = cha.college_id
LEFT JOIN (SELECT challenge_id,
          SUM(total_views) as total_views,
          SUM(total_unique_views) as total_unique_views
          FROM view_stats
          GROUP BY challenge_id) v
ON cha.challenge_id = v.challenge_id
LEFT JOIN (SELECT challenge_id,
          SUM(total_submissions) as total_submissions,
          SUM(total_accepted_submissions) as total_accepted_submissions
          FROM submission_stats
          GROUP BY challenge_id) s
ON cha.challenge_id = s.challenge_id
GROUP BY 1,2,3
ORDER BY con.contest_id;

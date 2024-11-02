SELECT 
    I.REST_ID, I.REST_NAME, I.FOOD_TYPE, I.FAVORITES, I.ADDRESS, 
    ROUND(AVG(R.REVIEW_SCORE),2) AS AVG_SCORE
FROM 
    REST_INFO AS I
JOIN 
    REST_REVIEW AS R
ON 
    I.REST_ID = R.REST_ID
WHERE
    I.ADDRESS LIKE '서울%'
GROUP BY 
    I.REST_ID
ORDER BY
    AVG_SCORE DESC, FAVORITES DESC;
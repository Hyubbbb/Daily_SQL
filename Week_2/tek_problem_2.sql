/* LeetCode 1683. Invalid Tweets
https://leetcode.com/problems/invalid-tweets/?envType=study-plan-v2&envId=top-sql-50 */

SELECT tweet_id
FROM Tweets
Where length(content) > 15

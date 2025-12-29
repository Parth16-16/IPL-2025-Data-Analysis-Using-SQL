use [IPL 2025 Analysis]

-- 1. Which team has won the most matches?
SELECT match_winner, COUNT(*) AS wins
FROM Matches
WHERE match_winner IS NOT NULL
GROUP BY match_winner
ORDER BY wins DESC;


-- 2. What is the average first innings score in each stadium?
SELECT venue, AVG(first_ings_score) AS avg_first_innings_score
FROM Matches
GROUP BY venue
ORDER BY avg_first_innings_score DESC;


-- 3. Which match had the highest combined score (first + second innings)? 
SELECT top 10 match_id, team1, team2, first_ings_score, second_ings_score, first_ings_score + second_ings_score AS total_score
FROM Matches
ORDER BY total_score DESC;


-- 4. Who are the top 5 highest individual scorers in a match?
SELECT TOP 5 top_scorer, highscore
FROM Matches
ORDER BY highscore DESC;


-- 5. Compare the win ratio of teams batting first vs. bowling first.

SELECT toss_decision, COUNT(*) AS total_matches,
       SUM(CASE WHEN toss_winner = match_winner THEN 1 ELSE 0 END) AS wins,
       ROUND(
           100.0 * SUM(CASE WHEN toss_winner = match_winner THEN 1 ELSE 0 END) / COUNT(*), 2
       ) AS win_percentage
FROM Matches
GROUP BY toss_decision;


-- 6. What is the average score made by teams when they win the match?

SELECT 
    ROUND(AVG(first_ings_score), 2) AS avg_score_batting_first,
    ROUND(AVG(second_ings_score), 2) AS avg_score_batting_second
FROM Matches
WHERE match_winner IS NOT NULL;


-- 7. Which venue has hosted the most matches? 
SELECT venue, COUNT(*) AS match_count
FROM matches
GROUP BY venue
ORDER BY match_count DESC;
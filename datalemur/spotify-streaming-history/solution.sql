SELECT F.user_id, F.song_id, SUM(F.song_plays) AS 'song_count' FROM
(SELECT * FROM
(
(SELECT user_id, song_id, song_plays FROM songs_history)
UNION ALL
(SELECT user_id, song_id, COUNT(listen_time) AS 'song_plays' FROM songs_weekly 
WHERE listen_time<'2022-08-05' GROUP BY user_id, song_id)
) AS final) F
GROUP BY F.user_id, F.song_id ORDER BY song_count DESC

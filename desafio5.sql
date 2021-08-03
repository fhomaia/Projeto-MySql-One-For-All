CREATE VIEW top_2_hits_do_momento AS 
SELECT s.title cancao, COUNT(hr.song_id) reproducoes
FROM SpotifyClone.history_of_replays hr
INNER JOIN SpotifyClone.songs  s ON s.song_id = hr.song_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;

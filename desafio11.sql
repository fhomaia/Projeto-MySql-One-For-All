CREATE VIEW cancoes_premium AS
SELECT s.title nome, COUNT(hr.song_id) reproducoes
FROM SpotifyClone.songs s
INNER JOIN SpotifyClone.history_of_replays hr ON hr.song_id = s.song_id
INNER JOIN SpotifyClone.users u ON hr.user_id = u.user_id
INNER JOIN SpotifyClone.plans p ON u.plan_id = p.plan_id
WHERE p.type IN ('familiar', 'universitário')
GROUP BY title
ORDER BY title;

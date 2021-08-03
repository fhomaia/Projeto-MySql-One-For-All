CREATE VIEW historico_reproducao_usuarios AS
SELECT u.name AS usuario, s.title AS nome FROM SpotifyClone.history_of_replays hr
LEFT JOIN SpotifyClone.users u ON hr.user_id = u.user_id
LEFT JOIN SpotifyClone.songs s ON hr.song_id = s.song_id
ORDER BY usuario;

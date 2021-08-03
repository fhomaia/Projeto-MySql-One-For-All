CREATE VIEW estatisticas_musicais AS
SELECT COUNT(song_id) AS cancoes, 
(SELECT COUNT(*) FROM SpotifyClone.artists) AS artistas,
COUNT(DISTINCT album_id) AS albuns
FROM SpotifyClone.songs;

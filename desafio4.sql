CREATE VIEW top_3_artistas AS
SELECT a.name artista, COUNT(fa.artist_id) seguidores
FROM SpotifyClone.following_artists fa
INNER JOIN SpotifyClone.artists  a ON a.artist_id = fa.artist_id
GROUP BY artista
ORDER BY seguidores DESC, artista
LIMIT 3;

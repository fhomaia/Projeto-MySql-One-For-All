CREATE VIEW perfil_artistas AS
SELECT a.name artista,
al.title album,
COUNT(fa.user_id) seguidores
FROM SpotifyClone.artists a
INNER JOIN SpotifyClone.albums al ON al.artist_id = a.artist_id
INNER JOIN SpotifyClone.following_artists fa ON fa.artist_id = a.artist_id
GROUP BY album, artista
ORDER BY seguidores DESC, artista, album;
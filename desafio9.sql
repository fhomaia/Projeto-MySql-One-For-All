DROP PROCEDURE IF EXISTS `albuns_do_artista`;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artist_name VARCHAR(25))
BEGIN
SELECT a.name artista, al.title album
FROM SpotifyClone.artists a
INNER JOIN SpotifyClone.albums al ON al.artist_id = a.artist_id
WHERE a.name = artist_name
ORDER BY album;
END $$
DELIMITER ;

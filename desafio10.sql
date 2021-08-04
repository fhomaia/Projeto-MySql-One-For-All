DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico (`user` INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE quantidade_musicas_no_historico INT;
SELECT COUNT(song_id) FROM SpotifyClone.history_of_replays
WHERE user_id = `user`
INTO  quantidade_musicas_no_historico;
RETURN quantidade_musicas_no_historico;
END $$
DELIMITER ;

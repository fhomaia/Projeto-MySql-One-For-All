DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.users
FOR EACH ROW
BEGIN
DELETE FROM SpotifyClone.history_of_replays hr
WHERE user_id = OLD.user_id;
DELETE FROM SpotifyClone.following_artists fa
WHERE user_id = OLD.user_id;
END $$
DELIMITER ;

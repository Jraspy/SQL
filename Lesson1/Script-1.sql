DROP TABLE IF EXISTS users;

CREATE TABLE users (
	id INT UNSIGNED,
	name VARCHAR(255) COMMENT 'Пользователи'
) COMMENT = 'ДЗ_2';

select * from users
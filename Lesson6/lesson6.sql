-- 1. Проанализировать запросы, которые выполнялись на занятии, определить возможные корректировки и/или улучшения (JOIN пока не применять)
--  В логе урока в примере коррелированного подзапроса опечатка в запросе: дважды одно и тоже условие WHERE p.user_id = m.from_user_id 
-- найдем в таблице профилей полное имя пользователя, получившего сообщение
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles p 
		WHERE p.user_id = m.to_user_id -- вот так верно
	) AS to_user_name,

 
-- 2. Пусть задан некоторый пользователь. 
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

-- Больше всех с пользователем 1 общался тот, у которого больше других сообщений с пользователем 1
-- считаем кол-во сообщений к пользователю 1 от каждого пользователя. Группируем по имени отправителя, сортируем и выбираем первого.

SELECT
		COUNT(id) AS m_count,
		(
	SELECT
			concat_ws(' ', first_name, last_name)
	FROM
			profiles prof
	WHERE
			prof.user_id = m.from_user_id
	) AS sender
FROM
		messages m
WHERE
		to_user_id = 1
GROUP BY
		from_user_id
ORDER BY
		m_count DESC
LIMIT 1; -- отсекам все прочие, кроме первого

	

-- 3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
WITH most_young AS (
-- выбираем самых молодых
SELECT
	user_id
FROM
	profiles p
ORDER BY
	birth_date DESC
LIMIT 10) -- в кол-ве 10 штук
SELECT
	COUNT(l.id) AS likes_count
FROM
	likes l,
	most_young m
WHERE
	l.id = m.user_id;


	
-- 4. Определить кто больше поставил лайков (всего) - мужчины или женщины?		
SELECT
	(
	SELECT
		p.gender
	FROM
		profiles p
	WHERE
		p.id = l.from_user_id -- коррелированный подзапрос: собираем всех участников в лайках
) AS gender
FROM
	likes l
GROUP BY
	gender	-- групппируем
ORDER BY
	count(l.id) DESC -- сортируем по кол-ву лайков на каждый пол
LIMIT 1; -- оставляем только макс

	
	
-- 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
-- Пусть наименьшая активность определятеся минимальной суммой кол-ва сообщений, постов, лайков:
SELECT
	concat_ws(' ', p.first_name, p.last_name) AS usr_name,
	(
	SELECT
		count(id)
	FROM
		posts
	WHERE
		posts.user_id = p.user_id ) AS usr_posts,
	(
	SELECT
		count(id)
	FROM
		messages
	WHERE
		messages.from_user_id = p.user_id) AS usr_msgs,
	(
	SELECT
		count(id)
	FROM
		likes
	WHERE
		likes.from_user_id = p.user_id) AS usr_likes,
	(
	SELECT
		usr_posts + usr_msgs + usr_likes) AS total
FROM
	profiles p
ORDER BY
	total
LIMIT 10
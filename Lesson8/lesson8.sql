-- 1. ����� ����� ��������� ������������. �� ���� ������ ����� ������������ ������� ��������, ������� ������ ���� ������� � ����� �������������.
WITH friends_messages AS (
	WITH friends AS (
SELECT
				friend_id
FROM
				friendship
WHERE
				user_id = 1
	AND friendship_status = 1
	AND confirmed_at IS NOT NULL
UNION
SELECT
				user_id
FROM
				friendship
WHERE
				friend_id = 1
	AND friendship_status = 1
	AND confirmed_at IS NOT NULL
		)
SELECT
		concat_ws(' ', p.first_name, p.last_name) AS other_user_name
FROM
		profiles p
INNER JOIN 
		messages m
	ON 
	p.user_id = m.from_user_id
	AND
			m.from_user_id IN (
	SELECT
			friend_id
	FROM
			friends
			)
	AND
			m.to_user_id = 1
UNION ALL
SELECT
	concat_ws(' ', p.first_name, p.last_name) AS other_user_name
FROM
		profiles p
INNER JOIN 
		messages m
	ON 
	p.user_id = m.to_user_id
	AND
		m.from_user_id = 1
	AND m.to_user_id IN (
	SELECT
			friend_id
	FROM
			friends
		)
)
SELECT
	COUNT(other_user_name) AS messages_number,
	other_user_name
FROM
	friends_messages
GROUP BY
	other_user_name
ORDER BY
	messages_number DESC
LIMIT 1;


-- 2. ���������� ����� ���������� ������, ������� �������� 10 ����� ������� �������������.
WITH youngest AS (
SELECT
		user_id,
		birth_date,
		TO_DAYS(NOW()) - TO_DAYS(birth_date) AS days_from_birt
FROM
			profiles
ORDER BY
			birth_date DESC
LIMIT 10
)
SELECT
	SUM(1) AS total_likes
FROM
	likes l
INNER JOIN youngest y ON
	l.entity_id = y.user_id
	AND l.entity_name = 'user';


-- 3. ���������� ��� ������ �������� ������ (�����) - ������� ��� �������?
SELECT
	SUM(1) AS total_likes,
	p.gender AS gender
FROM
	likes l
LEFT JOIN profiles p ON
	p.user_id = l.from_user_id
GROUP BY
	gender
ORDER BY
	total_likes DESC
LIMIT 1;


-- 4. ����� 10 �������������, ������� ��������� ���������� ���������� � ������������� ���������� ���� (���� ������� ��������, �� �������� �� ���������� ���������� � �������

WITH activities AS (
SELECT
		SUM(1) AS activity,
		p1.user_id AS user_id
FROM
		posts p1
INNER JOIN
		profiles p2
		ON
	p1.user_id = p2.user_id
GROUP BY
		p1.user_id
UNION ALL
SELECT
		SUM(1) AS activity,
		l.from_user_id AS user_id
FROM
		likes l
INNER JOIN
		profiles p
		ON
	l.from_user_id = p.user_id
GROUP BY
		l.from_user_id
UNION ALL
SELECT
		SUM(1) AS activity,
		m.from_user_id AS user_id
FROM
		messages m
INNER JOIN
		profiles p
		ON
	m.from_user_id = p.user_id
GROUP BY
		m.from_user_id
ORDER BY
		user_id
)
SELECT
	SUM(a.activity)
		AS total_activity,
		concat_ws(' ', p.first_name, p.last_name) AS user_name
FROM
	activities a
INNER JOIN profiles p
ON
	p.user_id = a.user_id
GROUP BY
	user_name
ORDER BY
	total_activity
LIMIT 10;
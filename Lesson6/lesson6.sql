-- 1. ���������������� �������, ������� ����������� �� �������, ���������� ��������� ������������� �/��� ��������� (JOIN ���� �� ���������)
--  � ���� ����� � ������� ���������������� ���������� �������� � �������: ������ ���� � ���� ������� WHERE p.user_id = m.from_user_id 
-- ������ � ������� �������� ������ ��� ������������, ����������� ���������
		SELECT concat_ws(' ', first_name, last_name) 
		FROM profiles p 
		WHERE p.user_id = m.to_user_id -- ��� ��� �����
	) AS to_user_name,

 
-- 2. ����� ����� ��������� ������������. 
-- �� ���� ������ ����� ������������ ������� ��������, ������� ������ ���� ������� � ����� �������������.

-- ������ ���� � ������������� 1 ������� ���, � �������� ������ ������ ��������� � ������������� 1
-- ������� ���-�� ��������� � ������������ 1 �� ������� ������������. ���������� �� ����� �����������, ��������� � �������� �������.

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
LIMIT 1; -- ������� ��� ������, ����� �������

	

-- 3. ���������� ����� ���������� ������, ������� �������� 10 ����� ������� �������������.
WITH most_young AS (
-- �������� ����� �������
SELECT
	user_id
FROM
	profiles p
ORDER BY
	birth_date DESC
LIMIT 10) -- � ���-�� 10 ����
SELECT
	COUNT(l.id) AS likes_count
FROM
	likes l,
	most_young m
WHERE
	l.id = m.user_id;


	
-- 4. ���������� ��� ������ �������� ������ (�����) - ������� ��� �������?		
SELECT
	(
	SELECT
		p.gender
	FROM
		profiles p
	WHERE
		p.id = l.from_user_id -- ��������������� ���������: �������� ���� ���������� � ������
) AS gender
FROM
	likes l
GROUP BY
	gender	-- �����������
ORDER BY
	count(l.id) DESC -- ��������� �� ���-�� ������ �� ������ ���
LIMIT 1; -- ��������� ������ ����

	
	
-- 5. ����� 10 �������������, ������� ��������� ���������� ���������� � ������������� ���������� ����.
-- ����� ���������� ���������� ������������ ����������� ������ ���-�� ���������, ������, ������:
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
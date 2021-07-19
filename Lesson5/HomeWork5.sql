-- Практическое задание теме «Агрегация данных»
-- Подсчитайте средний возраст пользователей в таблице users.
SELECT
  AVG((TIMESTAMPDIFF(YEAR, birth_date, NOW()))) AS averege_age
FROM
  profiles;
  
-- ------------------------------------------------------------------
-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.
SELECT
  COUNT(id) AS birth_days_count,
  DAYNAME(CONCAT((YEAR(NOW())), (DATE_FORMAT(birth_date, '-%m-%d')))) as weekDayBith
FROM
  profiles
GROUP BY weekDayBith;

-- ------------------------------------------------------------------
-- (по желанию) Подсчитайте произведение чисел в столбце таблицы.

-- id! факториал
SELECT
  EXP(SUM(LN(id)))
FROM
  profiles
WHERE ID <= 3;
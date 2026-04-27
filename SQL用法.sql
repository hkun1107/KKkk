==== SELECT statement ====
-- 基本用法
SELECT column1, column2 FROM table_name;
-- 相关函数: DISTINCT, LIMIT, CASE

==== INSERT statement ====
-- 基本用法
INSERT INTO table_name (column1, column2) VALUES (value1, value2);
-- 相关函数: INSERT INTO SELECT, DEFAULT

==== UPDATE statement ====
-- 基本用法
UPDATE table_name SET column1 = value1 WHERE condition;
-- 相关函数: CONCAT, UPPER/LOWER, REPLACE

==== DELETE statement ====
-- 基本用法
DELETE FROM table_name WHERE condition;
-- 相关函数: DELETE with JOIN, TRUNCATE

==== WHERE clause ====
-- 基本用法
SELECT * FROM table_name WHERE condition;
-- 相关函数: LIKE, IN, BETWEEN, IS NULL

==== JOIN operations ====
-- 基本用法
SELECT columns FROM table1 JOIN table2 ON condition;
-- 相关函数: LEFT JOIN, RIGHT JOIN, INNER JOIN, FULL JOIN

==== GROUP BY ====
-- 基本用法
SELECT column1, COUNT(*) FROM table_name GROUP BY column1;
-- 相关函数: COUNT, SUM, AVG, MAX/MIN, HAVING

==== ORDER BY ====
-- 基本用法
SELECT * FROM table_name ORDER BY column1;
-- 相关函数: DESC, Multiple fields, RAND, LENGTH
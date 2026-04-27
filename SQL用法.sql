==== SELECT statement ====
-- 基本用法
SELECT column1, column2 FROM table_name;
-- 相关函数: DISTINCT, LIMIT, CASE

-- DISTINCT: 去除重复的行
-- 用法：SELECT DISTINCT department FROM employees;
-- 注释：返回所有不同的部门名称，排除重复项

-- LIMIT: 限制返回的行数
-- 用法：SELECT * FROM students LIMIT 10;
-- 注释：只返回前10条记录

-- CASE: 条件判断语句
-- 用法：SELECT name, CASE WHEN age >= 18 THEN '成人' ELSE '未成年' END AS age_group FROM users;
-- 注释：根据年龄判断是否成人，并创建新列

==== INSERT statement ====
-- 基本用法
INSERT INTO table_name (column1, column2) VALUES (value1, value2);
-- 相关函数: INSERT INTO SELECT, DEFAULT

-- INSERT INTO SELECT: 从另一个表中插入数据
-- 用法：INSERT INTO backup_employees SELECT * FROM employees WHERE salary > 50000;
-- 注释：将薪资超过50000的员工信息备份到backup_employees表

-- DEFAULT: 使用默认值
-- 用法：INSERT INTO products (name, price, status) VALUES ('iPhone', 999, DEFAULT);
-- 注释：status列将使用表定义中的默认值

==== UPDATE statement ====
-- 基本用法
UPDATE table_name SET column1 = value1 WHERE condition;
-- 相关函数: CONCAT, UPPER/LOWER, REPLACE

-- CONCAT: 连接字符串
-- 用法：UPDATE users SET full_name = CONCAT(first_name, ' ', last_name) WHERE id = 1;
-- 注释：将名字和姓氏连接成完整名字

-- UPPER/LOWER: 转换大小写
-- 用法：UPDATE emails SET email = LOWER(email) WHERE email LIKE '%gmail%';
-- 注释：将所有Gmail邮箱地址转换为小写

-- REPLACE: 替换字符串
-- 用法：UPDATE articles SET content = REPLACE(content, '旧词', '新词') WHERE category = 'tech';
-- 注释：将文章内容中的旧词替换为新词

==== DELETE statement ====
-- 基本用法
DELETE FROM table_name WHERE condition;
-- 相关函数: DELETE with JOIN, TRUNCATE

-- DELETE with JOIN: 根据关联条件删除
-- 用法：DELETE t1 FROM table1 t1 JOIN table2 t2 ON t1.id = t2.id WHERE t2.status = 'inactive';
-- 注释：删除与table2中非活跃记录关联的table1中的记录

-- TRUNCATE: 快速删除所有数据
-- 用法：TRUNCATE TABLE temp_logs;
-- 注释：删除temp_logs表中的所有数据，比DELETE更快，但无法使用WHERE条件

==== WHERE clause ====
-- 基本用法
SELECT * FROM table_name WHERE condition;
-- 相关函数: LIKE, IN, BETWEEN, IS NULL

-- LIKE: 模糊匹配
-- 用法：SELECT * FROM customers WHERE email LIKE '%@gmail.com';
-- 注释：查找所有Gmail邮箱的客户（%表示任意个字符）

-- IN: 列表匹配
-- 用法：SELECT * FROM orders WHERE status IN ('pending', 'confirmed', 'shipped');
-- 注释：查找状态为pending、confirmed或shipped的订单

-- BETWEEN: 范围匹配
-- 用法：SELECT * FROM sales WHERE sale_date BETWEEN '2024-01-01' AND '2024-12-31';
-- 注释：查找2024年全年的销售记录

-- IS NULL: 空值判断
-- 用法：SELECT * FROM users WHERE phone IS NULL;
-- 注释：查找没有填写电话号码的用户

==== JOIN operations ====
-- 基本用法
SELECT columns FROM table1 JOIN table2 ON condition;
-- 相关函数: LEFT JOIN, RIGHT JOIN, INNER JOIN, FULL JOIN

-- INNER JOIN: 内连接，只返回两个表都匹配的记录
-- 用法：SELECT e.name, d.dept_name FROM employees e INNER JOIN departments d ON e.dept_id = d.id;
-- 注释：返回员工及其所在部门，只显示有部门的员工

-- LEFT JOIN: 左外连接，返回左表全部和右表匹配的记录
-- 用法：SELECT c.name, o.order_id FROM customers c LEFT JOIN orders o ON c.id = o.customer_id;
-- 注释：显示所有客户及其订单，没有订单的客户order_id为NULL

-- RIGHT JOIN: 右外连接，返回右表全部和左表匹配的记录
-- 用法：SELECT e.name, p.project_name FROM employees e RIGHT JOIN projects p ON e.id = p.lead_id;
-- 注释：显示所有项目及其负责人，没有负责人的项目name为NULL

-- FULL JOIN: 全外连接，返回两个表的并集（MySQL不直接支持，需用UNION）
-- 用法：SELECT * FROM table1 t1 LEFT JOIN table2 t2 ON t1.id = t2.id UNION SELECT * FROM table1 t1 RIGHT JOIN table2 t2 ON t1.id = t2.id;
-- 注释：返回两个表中的所有记录

==== GROUP BY ====
-- 基本用法
SELECT column1, COUNT(*) FROM table_name GROUP BY column1;
-- 相关函数: COUNT, SUM, AVG, MAX/MIN, HAVING

-- COUNT: 计数函数
-- 用法：SELECT department, COUNT(*) AS emp_count FROM employees GROUP BY department;
-- 注释：统计每个部门的员工数量

-- SUM: 求和函数
-- 用法：SELECT customer_id, SUM(amount) AS total_spent FROM orders GROUP BY customer_id;
-- 注释：统计每个客户的总消费金额

-- AVG: 平均值函数
-- 用法：SELECT product_category, AVG(price) AS avg_price FROM products GROUP BY product_category;
-- 注释：计算每个分类商品的平均价格

-- MAX/MIN: 最大值/最小值函数
-- 用法：SELECT department, MAX(salary) AS highest_salary, MIN(salary) AS lowest_salary FROM employees GROUP BY department;
-- 注释：显示每个部门的最高和最低薪资

-- HAVING: 对分组结果进行过滤
-- 用法：SELECT department, COUNT(*) AS emp_count FROM employees GROUP BY department HAVING COUNT(*) > 5;
-- 注释：只显示员工数量超过5人的部门

==== ORDER BY ====
-- 基本用法
SELECT * FROM table_name ORDER BY column1;
-- 相关函数: DESC, Multiple fields, RAND, LENGTH

-- DESC: 降序排序
-- 用法：SELECT * FROM products ORDER BY price DESC;
-- 注释：按价格从高到低排序商品

-- Multiple fields: 多字段排序
-- 用法：SELECT * FROM students ORDER BY grade DESC, name ASC;
-- 注释：先按成绩降序排，成绩相同的按名字升序排

-- RAND: 随机排序
-- 用法：SELECT * FROM questions ORDER BY RAND() LIMIT 5;
-- 注释：随机抽取5道题目

-- LENGTH: 按字符串长度排序
-- 用法：SELECT * FROM articles ORDER BY LENGTH(title) DESC;
-- 注释：按文章标题长度从长到短排序
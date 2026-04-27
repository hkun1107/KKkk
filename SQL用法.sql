-- SELECT 语句：用于从数据库中查询数据
-- Excel案例：在Excel中可以使用“数据”选项中的“从文本/CSV”来导入数据，并使用VLOOKUP等函数
SELECT * FROM 表名;

-- INSERT 语句：用于向数据库中插入新数据
-- Excel案例：在Excel表格中可以添加新行以插入数据
INSERT INTO 表名 (列1, 列2) VALUES (值1, 值2);

-- UPDATE 语句：用于修改数据库中已存在的数据
-- Excel案例：在Excel中可以直接编辑单元格以更新数据
UPDATE 表名 SET 列1 = 新值 WHERE 条件;

-- DELETE 语句：用于删除数据库中的数据
-- Excel案例：在Excel中可以选中某行并右键选择“删除”来删除数据
DELETE FROM 表名 WHERE 条件;

-- WHERE 子句：用于指定查询条件
-- Excel案例：在Excel中可以使用过滤器功能来筛选数据
SELECT * FROM 表名 WHERE 列名 = 值;

-- JOIN操作：用于合并来自两个或多个表的数据
-- Excel案例：在Excel中可以使用VLOOKUP等函数来连接数据
SELECT * FROM 表1 JOIN 表2 ON 表1.列名 = 表2.列名;

-- GROUP BY：用于将查询结果按照某列分组
-- Excel案例：在Excel中可以使用“数据透视表”功能进行分组
SELECT 列名, COUNT(*) FROM 表名 GROUP BY 列名;

-- ORDER BY：用于对查询结果进行排序
-- Excel案例：在Excel中可以使用“数据”选项中的“排序”功能
SELECT * FROM 表名 ORDER BY 列名 ASC;
语句一
SELECT SUM(lo_revenue) AS revenue FROM lineorder 
LEFT JOIN dates ON lo_orderdate = d_datekey
WHERE d_year = 1993;

语句二
SELECT SUM(lo_revenue) AS revenue FROM lineorder 
Left JOIN dates ON lo_orderdate = d_datekey
WHERE d_yearmonthnum = 199401;

语句三
SELECT SUM(lo_revenue) AS revenue FROM lineorder 
left JOIN dates ON lo_orderdate = d_datekey
WHERE d_year = 1994 AND d_weeknuminyear = 6;

语句四
SELECT SUM(lo_revenue) AS lo_revenue, d_year, p_brand FROM lineorder 
left JOIN dates ON lo_orderdate = d_datekey 
left JOIN part ON lo_partkey = p_partkey 
left JOIN supplier ON lo_suppkey = s_suppkey
WHERE p_category = 'MFGR#41' AND s_region = 'AMERICA'
GROUP BY d_year, p_brand
ORDER BY d_year, p_brand;

语句五
SELECT d_year, p_brand, SUM(lo_revenue) AS lo_revenue FROM lineorder 
left  JOIN dates ON lo_orderdate = d_datekey 
left JOIN part ON lo_partkey = p_partkey 
left JOIN supplier ON lo_suppkey = s_suppkey
WHERE p_brand BETWEEN 'MFGR#2221' AND 'MFGR#2225' AND s_region = 'ASIA'
GROUP BY d_year, p_brand
ORDER BY d_year, p_brand;

语句六
SELECT d_year, p_brand, SUM(lo_revenue) AS lo_revenue FROM lineorder 
left JOIN dates ON lo_orderdate = d_datekey 
left JOIN part ON lo_partkey = p_partkey 
left JOIN supplier ON lo_suppkey = s_suppkey
WHERE p_brand = 'MFGR#1110' AND s_region = 'EUROPE'
GROUP BY d_year, p_brand
ORDER BY d_year, p_brand;

语句七
SELECT d_year, c_nation, s_nation, SUM(lo_revenue) AS lo_revenue FROM lineorder 
LEFT JOIN dates ON lo_orderdate = d_datekey 
LEFT JOIN customer ON lo_custkey = c_custkey 
LEFT JOIN supplier ON lo_suppkey = s_suppkey
WHERE c_region = 'ASIA'
    AND s_region = 'ASIA'
    AND d_year >= 1992
    AND d_year <= 1997
GROUP BY c_nation, s_nation, d_year
ORDER BY d_year ASC, lo_revenue DESC;

语句八
SELECT d_year, c_city, s_city, SUM(lo_revenue) AS lo_revenue FROM lineorder 
LEFT JOIN dates ON lo_orderdate = d_datekey 
LEFT JOIN customer ON lo_custkey = c_custkey 
LEFT JOIN supplier ON lo_suppkey = s_suppkey
WHERE c_nation = 'UNITED STATES'
    AND s_nation = 'UNITED STATES'
    AND d_year >= 1992
    AND d_year <= 1997
GROUP BY c_city, s_city, d_year
ORDER BY d_year ASC, lo_revenue DESC;

语句九
SELECT c_city, s_city, d_year, SUM(lo_revenue) AS lo_revenue FROM lineorder 
LEFT JOIN dates ON lo_orderdate = d_datekey 
LEFT JOIN customer ON lo_custkey = c_custkey 
LEFT JOIN supplier ON lo_suppkey = s_suppkey
WHERE (c_city = 'CHINA    1' OR c_city = 'CHINA    9')
    AND (s_city = 'EGYPT    1' OR s_city = 'EGYPT    9')
    AND d_year >= 1992
    AND d_year <= 1997
GROUP BY c_city, s_city, d_year
ORDER BY d_year ASC, lo_revenue DESC;

语句十
SELECT c_city, s_city, d_year, SUM(lo_revenue) AS lo_revenue FROM lineorder 
LEFT JOIN dates ON lo_orderdate = d_datekey 
LEFT JOIN customer ON lo_custkey = c_custkey 
LEFT JOIN supplier ON lo_suppkey = s_suppkey
WHERE(c_city = 'CHINA    1'  OR c_city = 'CHINA    2')
    AND (s_city = 'EGYPT    1'  OR s_city = 'EGYPT   3')
    AND d_yearmonth LIKE '%1997'
GROUP BY c_city, s_city, d_year
ORDER BY d_year ASC, lo_revenue DESC;

语句十一
SELECT d_year, c_nation, SUM(lo_revenue) - SUM(lo_supplycost) AS profit FROM lineorder 
LEFT JOIN dates ON lo_orderdate = d_datekey 
LEFT JOIN customer ON lo_custkey = c_custkey 
LEFT JOIN supplier ON lo_suppkey = s_suppkey 
LEFT JOIN part ON lo_partkey = p_partkey
WHERE c_region = 'AMERICA'
    AND s_region = 'AMERICA'
    AND (p_mfgr = 'MFGR#1' OR p_mfgr = 'MFGR#2')
GROUP BY d_year, c_nation
ORDER BY d_year, c_nation;

语句十二
SELECT d_year, s_nation, p_category, SUM(lo_revenue) - SUM(lo_supplycost) AS profit FROM lineorder 
LEFT JOIN dates ON lo_orderdate = d_datekey 
LEFT JOIN customer ON lo_custkey = c_custkey 
LEFT JOIN supplier ON lo_suppkey = s_suppkey 
LEFT JOIN part ON lo_partkey = p_partkey
WHERE c_region = 'AMERICA'
    AND s_region = 'AMERICA'
    AND (d_year = 1997 OR d_year = 1998)
    AND (p_mfgr = 'MFGR#1' OR p_mfgr = 'MFGR#2')
GROUP BY d_year, s_nation, p_category
ORDER BY d_year, s_nation, p_category;

语句十三
SELECT d_year, s_city, p_brand, SUM(lo_revenue) - SUM(lo_supplycost) AS profit FROM lineorder 
LEFT JOIN dates ON lo_orderdate = d_datekey 
LEFT JOIN customer ON lo_custkey = c_custkey 
LEFT JOIN supplier ON lo_suppkey = s_suppkey 
LEFT JOIN part ON lo_partkey = p_partkey
WHERE c_region = 'AFRICA'
    AND s_nation = 'UNITED STATES'
    AND (d_year = 1997 OR d_year = 1998)
    AND p_category = 'MFGR#11'
GROUP BY d_year, s_city, p_brand
ORDER BY d_year, s_city, p_brand;

CREATE DATABASE ServiceRequests

use ServiceRequests

select * from ServiceReq

SELECT COUNT(*) AS Row_Count
FROM ServiceReq

--Q1 Validation by Year & Month
SELECT YEAR(CREATION_DATE) AS Year_Request, COUNT(*) AS Count_Request
FROM ServiceReq
WHERE YEAR([CREATION_DATE]) BETWEEN 2018 AND 2021
GROUP BY YEAR([CREATION_DATE])
ORDER BY Year_Request;

--Q1 Validation by Month
SELECT YEAR([CREATION_DATE]) AS Year_Request, MONTH([CREATION_DATE]) AS Month_Request, COUNT(*) AS Count_Request
FROM ServiceReq
WHERE YEAR([CREATION_DATE]) BETWEEN 2018 AND 2021
GROUP BY YEAR([CREATION_DATE]),MONTH([CREATION_DATE])
ORDER BY Year_Request, Month_Request;


--Q2 Volume of req from sources
SELECT [SOURCE], COUNT(*) AS Count_Request
FROM ServiceReq
GROUP BY [SOURCE]
ORDER BY Count_Request DESC;


--Q3 Volume of req by department
SELECT [DEPARTMENT], COUNT(*) AS Count_Request
FROM ServiceReq
GROUP BY [DEPARTMENT]
ORDER BY Count_Request DESC;

--Q5 Top 10 areas for most requests
SELECT TOP 10 [NEIGHBORHOOD] , COUNT(*) AS Count_Request
FROM ServiceReq
GROUP BY [NEIGHBORHOOD]
ORDER BY Count_Request DESC;

--Q6 department and work group
SELECT [DEPARTMENT], [WORK GROUP], COUNT(*) AS Workload_Count
FROM ServiceReq
GROUP BY [DEPARTMENT],[WORK GROUP]
ORDER BY Workload_Count DESC , [DEPARTMENT] 


--Q8 Service req status composition
SELECT YEAR([CREATION_DATE]) AS Year_Request, [STATUS], COUNT(*) AS Status_Count
FROM ServiceReq
WHERE YEAR([CREATION_DATE]) BETWEEN 2018 AND 2021
GROUP BY YEAR([CREATION_DATE]),[STATUS]
ORDER BY Year_Request, [STATUS];

--Q9 avg day to close service req for category1
SELECT TOP 10 [CATEGORY1], AVG([DAYS TO CLOSE]) AS Avg_Days_To_Close
FROM ServiceReq
WHERE [DAYS TO CLOSE] IS NOT NULL
GROUP BY [CATEGORY1]
ORDER BY Avg_Days_To_Close DESC;

--Q10
SELECT [DEPARTMENT],COUNT(DISTINCT [CASE ID]) AS CaseCount, COUNT(*) AS Workload, AVG([DAYS TO CLOSE]) AS AvgDaysToClose
FROM ServiceReq
WHERE [DAYS TO CLOSE] IS NOT NULL 
GROUP BY [DEPARTMENT];


USE TestCorona -- Connecting to The DB 

-- QUERY NUM 1 - Return the ID and first name of all residents.
SELECT R.residentID, R.residentFirstName
FROM Resident AS R


-- QUERY NUM 2 - Return the ID numbers of residents who entered isolation.
SELECT IOR.residentID
FROM InsulationOfAResident AS IOR


-- QUERY NUM 3 - Return all the details of businesses stored in the system.
SELECT *
FROM Business


-- QUERY NUM 4 - Return the ID, full name, and age of residents who registered in the system.
SELECT R.residentID, R.residentFirstName + ' ' + R.residentSurName AS 'Residnt FullName', DATEDIFF(YEAR,R.residentBirthDate, GETDATE()) AS 'AGE'
FROM Resident AS R


-- QUERY NUM 5 - Return the ID numbers of residents currently in isolation.
SELECT IOR.residentID
FROM InsulationOfAResident AS IOR
WHERE IOR.EndDateTime IS NULL


-- QUERY NUM 6 - Return the business numbers visited by a sick person in the last 30 days. 
SELECT SRVB.businessNum
FROM SickResidentVisitsInBusiness AS SRVB
WHERE DATEDIFF(DAY,SRVB.visitStartDateTime, GETDATE()) <= 1400  -- Modify it to 1400 beacause of the dates in the DB.


-- QUERY NUM 7 - Return the ID numbers of sick residents who recovered within less than two weeks.
SELECT SR.residentID
FROM SickResident as SR INNER JOIN InsulationOfAResident AS IOR ON SR.residentID = IOR.residentID
WHERE SR.status = 'R' AND DATEDIFF(DAY, IOR.StartDateTime, IOR.EndDateTime) <= 14


-- QUERY NUM 8 - Return the ID numbers of residents whose last name starts with 'b' and ends with 'r'.
SELECT R.residentID, R.residentSurName
FROM Resident AS R
WHERE R.residentSurName LIKE 'b%r'


-- QUERY NUM 9 - Return the details of male residents born in the 1990s.
SELECT *
FROM Resident AS R
WHERE R.gender = 'M' AND YEAR(R.residentBirthDate) BETWEEN 1990 AND 1999


-- QUERY NUM 10 - Return the ID numbers of residents who entered isolation on April 1st, 2021, or April 10th, 2021.
SELECT IOR.residentID
FROM InsulationOfAResident AS IOR 
WHERE IOR.StartDateTime = '2021-04-01' OR IOR.StartDateTime = '2021-04-10'

--#2 Solution
SELECT IOR.residentID
FROM InsulationOfAResident AS IOR 
WHERE IOR.StartDateTime  IN ('2021-04-01','2021-04-10')


-- QUERY NUM 11 - Return the ID numbers of residents who did not enter isolation on April 1st or April 10th, 2021.
SELECT IOR.residentID
FROM InsulationOfAResident AS IOR 
WHERE IOR.StartDateTime NOT IN ('2021-04-01','2021-04-10')


-- QUERY NUM 12 - Return the ID numbers of residents who are currently sick or in isolation.
SELECT IOR.residentID
FROM InsulationOfAResident AS IOR
WHERE IOR.EndDateTime IS NULL 
UNION							--We use UNION, Because the result of the JOIN will be records that exist in both tables ONLY.
SELECT SR.residentID
FROM SickResident AS SR 
WHERE SR.status = 'S'


-- QUERY NUM 13 - Return the business numbers of businesses within 1,500 meters of another business.
SELECT N.businessNum1
FROM Near AS N
WHERE distance <= 1500
UNION					-- UNION -> NO DUPLICATES
SELECT N.businessNum2
FROM Near AS N
WHERE distance <= 1500


-- QUERY NUM 14 - Write a query that returns the ID numbers and full names of sick residents.
SELECT SR.residentID, R.residentFirstName + ' ' + R.residentSurName AS 'FullName', DATEDIFF(YEAR, R.residentBirthDate, GETDATE()) AS 'AGE'
FROM SickResident AS SR INNER JOIN Resident AS R ON R.residentID = SR.residentID
WHERE SR.status = 'S'


-- QUERY NUM 15 - Write a query that returns the birth year of people living in Haifa.
SELECT DATEDIFF(YEAR, R.residentBirthDate, GETDATE()) AS 'AGE'
FROM Resident AS R INNER JOIN city AS C ON R.citynum = C.cityNum
WHERE C.cityName = 'Haifa'   -- LIKE works also

-- QUERY NUM 16 - Write a query that returns the birth year of the oldest resident in Haifa.
SELECT MIN(YEAR(R.residentBirthDate))
FROM Resident AS R INNER JOIN city AS C ON R.citynum = C.cityNum
WHERE C.cityName = 'Haifa'

--#2 SOLUTION
SELECT TOP 1 YEAR(R.residentBirthDate)
FROM Resident AS R INNER JOIN city AS C ON R.citynum = C.cityNum
WHERE C.cityName = 'Haifa'
ORDER BY R.residentBirthDate ASC


/* QUERY NUM 17 - Write a query that returns details of residents (ID, full name, and age) 
who entered isolation in the last three days and either have finished isolation or have a 
test result of 20 or less and are still in isolation.*/

SELECT R.residentID, R.residentFirstName + ' ' + R.residentSurName AS	
	 'FullName', DATEDIFF(YEAR, R.residentBirthDate, GETDATE()) AS 'AGE'
FROM Resident AS R INNER JOIN InsulationOfAResident AS IOR ON R.residentID = IOR.residentID		
	 INNER JOIN SickResidentTracking AS SRT ON SRT.residentID = IOR.residentID
WHERE (DATEDIFF(DAY, IOR.StartDateTime, GETDATE()) <= 3800 AND IOR.EndDateTime IS NOT NULL)
OR (SRT.result <= 20 AND IOR.EndDateTime IS NULL)


-- QUERY NUM 15 - Return the ID, full name, and age of residents who were in isolation and also got out and also were sick.
SELECT R.residentID, R.residentFirstName + ' ' + R.residentSurName AS	
     'FullName', DATEDIFF(YEAR, R.residentBirthDate, GETDATE()) AS 'AGE'
FROM Resident AS R INNER JOIN InsulationOfAResident AS IOR ON R.residentID = IOR.residentID	INNER JOIN SickResident	
	AS SR ON SR.residentID = IOR.residentID
WHERE IOR.EndDateTime IS NOT NULL


-- QUERY NUM 16 - Return the ID, full name, and age of residents who were in isolation after being sick.
SELECT R.residentID, R.residentFirstName + ' ' + R.residentSurName AS	
     'FullName', DATEDIFF(YEAR, R.residentBirthDate, GETDATE()) AS 'AGE'
FROM Resident AS R INNER JOIN InsulationOfAResident AS IOR ON R.residentID = IOR.residentID	INNER JOIN SickResidentTracking	
	AS SRT ON SRT.residentID = IOR.residentID
WHERE SRT.trackDateTime < IOR.StartDateTime


/* QUERY NUM 17 - Return the ID, full name, and age of residents who were in isolation after being sick 
and before getting sick again.
*/
SELECT R.residentID, R.residentFirstName + ' ' + R.residentSurName AS	
     'FullName', DATEDIFF(YEAR, R.residentBirthDate, GETDATE()) AS 'AGE'
FROM Resident AS R INNER JOIN InsulationOfAResident AS IOR ON R.residentID = IOR.residentID	INNER JOIN SickResidentTracking	
	AS SRT ON SRT.residentID = IOR.residentID INNER JOIN InsulationOfAResident AS IOR2 ON R.residentID = IOR2.residentID
WHERE SRT.trackDateTime < IOR.StartDateTime AND SRT.trackDateTime > IOR2.StartDateTime


-- QUERY NUM 18 - Return the business numbers of businesses that do not have any nearby businesses.
SELECT B.businessNum
FROM Business AS B
EXCEPT 
SELECT N.businessNum1
FROM Near AS N
UNION
SELECT B.businessNum
FROM Business AS B
EXCEPT 
SELECT N.businessNum2
FROM Near AS N

--#SOLUTION 2
SELECT B.businessNum
FROM Business AS B LEFT JOIN NEAR AS N ON (N.businessNum1 = B.businessNum AND N.businessNum2 = B.businessNum)
WHERE N.businessNum1 IS NULL AND N.businessNum2 IS NULL


-- QUERY NUM 19 - Return the ID, full name, and age of residents who do not have any pre-existing Diseases.
SELECT R.residentID, R.residentFirstName + ' ' + R.residentSurName AS	
     'FullName', DATEDIFF(YEAR, R.residentBirthDate, GETDATE()) AS 'AGE'
FROM Resident AS R LEFT JOIN ResidentDiseases AS RD ON RD.residentID = R.residentID
WHERE RD.residentID IS NULL


-- QUERY NUM 20 - Return the ID, full name, and age of residents who have never been in isolation or been sick.
SELECT R.residentID, R.residentFirstName + ' ' + R.residentSurName AS	
     'FullName', DATEDIFF(YEAR, R.residentBirthDate, GETDATE()) AS 'AGE'
FROM Resident AS R LEFT JOIN InsulationOfAResident AS IOR ON IOR.residentID = R.residentID	
	 LEFT JOIN SickResident AS SR ON R.residentID = SR.residentID
WHERE IOR.residentID IS NULL AND SR.residentID IS NULL


-- QUERY NUM 21 - Return the total number of residents and the birthdate of the oldest resident.
SELECT COUNT(*) AS 'Total Residents Num', MIN(YEAR(R.residentBirthDate)) AS 'Year Of Oldest Resident'
FROM Resident AS R

/* QUERY NUM 22 - Count the number of residents born in any given year, alongside the city number and the year of birth,
sorted by city number in ascending order.
*/
SELECT YEAR(R.residentBirthDate), R.citynum, COUNT(R.residentID) AS 'Num Of Residents'
FROM Resident AS R
GROUP BY R.citynum, YEAR(R.residentBirthDate)
ORDER BY R.citynum ASC


/* QUERY NUM 23 - For each resident who has been in isolation, return the number of isolations, 
the date of the first isolation, the number of completed isolations, 
and the date of the most recent isolation for residents who have been isolated at least twice.
*/
SELECT COUNT(IOR.residentID) AS 'Number Of Isolations', MIN(IOR.StartDateTime) AS 'First Isolation',	
	   COUNT(IOR.EndDateTime) AS 'Number Of Completed Isolations', MAX(IOR.StartDateTime) AS 'Recent Isolation'
FROM  InsulationOfAResident AS IOR 
GROUP BY IOR.residentID
HAVING COUNT(IOR.residentID) >= 2


/* QUERY NUM 24 - Return the ID, full name, and number of pre-existing Diseases  
(with severity level 4 or higher) for residents who are currently sick and have 
at least three pre-existing severe conditions.
*/
SELECT R.residentID, R.residentFirstName + ' ' + R.residentSurName AS	
     'FullName', COUNT(RD.diseaseNum) AS 'Num Of Diseases'
FROM Resident AS R INNER JOIN ResidentDiseases AS RD ON RD.residentID = R.residentID	
	 INNER JOIN SickResident AS SR ON SR.residentID = RD.residentID
WHERE RD.severityLevel >= 4 AND SR.status = 'S'
GROUP BY R.residentID, R.residentFirstName, R.residentSurName 
HAVING COUNT(RD.residentID) >= 3


/* QUERY NUM 25 - Return the ID, full name, and the average number of isolation days for residents who have been
in isolation at least twice and have an average isolation duration of more than 10 days.
*/
SELECT R.residentID, R.residentFirstName + ' ' + R.residentSurName AS	
     'FullName', AVG(DATEDIFF(DAY,IOR.StartDateTime, IOR.EndDateTime))
FROM Resident AS R INNER JOIN InsulationOfAResident AS IOR ON IOR.residentID = R.residentID
GROUP BY R.residentID, R.residentFirstName, R.residentSurName 
HAVING COUNT(IOR.residentID) >= 2 AND AVG(DATEDIFF(DAY,IOR.StartDateTime, IOR.EndDateTime)) > 10


/* QUERY NUM 26 - Return the ID, full name, and the number of unique places visited by each sick resident, 
alongside the total number of places they visited.
*/
SELECT R.residentID, R.residentFirstName + ' ' + R.residentSurName AS	
     'FullName', COUNT(DISTINCT SRVB.businessNum) AS 'unique places visited',		
	  COUNT(SRVB.businessNum) AS 'total places  visited'
FROM Resident AS R INNER JOIN SickResidentVisitsInBusiness AS SRVB ON SRVB.residentID = R.residentID
GROUP BY R.residentID, R.residentFirstName, R.residentSurName 


/* QUERY NUM 27 - Return the ID, full name, number of visits, number of businesses visited, 
and the average number of businesses visited per visit for each resident who was sick with COVID-19.
*/
SELECT R.residentID, R.residentFirstName + ' ' + R.residentSurName AS	
     'FullName', COUNT(DISTINCT SRVB.visitStartDateTime) AS 'Total visits', COUNT(DISTINCT SRVB.businessNum) AS'unique places ',
	  COUNT(SRVB.businessNum) / COUNT(DISTINCT SRVB.visitStartDateTime) AS ' AVG Business In Visit'
FROM Resident AS R INNER JOIN SickResidentVisitsInBusiness AS SRVB ON SRVB.residentID = R.residentID 
GROUP BY R.residentID, R.residentFirstName, R.residentSurName 


/* QUERY NUM 28 - Return the business name, business type, and business number of businesses visited by 
sick residents in the last month, or located within 100 meters of another business that had 
at least two sick residents in the last two weeks.
*/
SELECT B.businessName, B.businessType,  SRVB.businessNum
FROM Business AS B INNER JOIN SickResidentVisitsInBusiness AS SRVB ON SRVB.businessNum = B.businessNum
WHERE DATEDIFF(MONTH, SRVB.visitStartDateTime, GETDATE()) <= 1
GROUP BY B.businessName, B.businessType, SRVB.businessNum
UNION
SELECT B.businessName, B.businessType, SRVB.businessNum
FROM Business AS B INNER JOIN SickResidentVisitsInBusiness AS SRVB ON SRVB.businessNum = B.businessNum INNER JOIN Near AS N ON		
	 (N.businessNum1 = SRVB.businessNum)
WHERE N.distance <= 100 AND DATEDIFF(MONTH, SRVB.visitStartDateTime, GETDATE()) <= 80
GROUP BY B.businessName, B.businessType, SRVB.businessNum
UNION
SELECT B.businessName, B.businessType, SRVB.businessNum
FROM Business AS B INNER JOIN SickResidentVisitsInBusiness AS SRVB ON SRVB.businessNum = B.businessNum INNER JOIN Near AS N ON		
	 (N.businessNum2 = SRVB.businessNum)
WHERE N.distance <= 100 AND DATEDIFF(MONTH, SRVB.visitStartDateTime, GETDATE()) <= 80
GROUP BY B.businessName, B.businessType, SRVB.businessNum


/* QUERY NUM 29 - Return the business name and number of businesses that have no sick residents 
but are located within 100 meters of a business that had sick residents.
*/

SELECT B.businessName, B.businessType, B.businessNum
FROM Business AS B INNER JOIN SickResidentVisitsInBusiness AS SRVB ON	
	 SRVB.businessNum = B.businessNum INNER JOIN NEAR AS N ON N.businessNum1 = B.businessNum 
	 LEFT JOIN SickResidentVisitsInBusiness AS SRVB2 ON SRVB2.businessNum = B.businessNum
WHERE SRVB2.residentID IS NULL AND N.distance <= 100
UNION
SELECT B.businessName, B.businessType, B.businessNum
FROM Business AS B INNER JOIN SickResidentVisitsInBusiness AS SRVB ON	
	 SRVB.businessNum = B.businessNum INNER JOIN NEAR AS N ON N.businessNum2 = B.businessNum 
	 LEFT JOIN SickResidentVisitsInBusiness AS SRVB2 ON SRVB2.businessNum = B.businessNum
WHERE SRVB2.residentID IS NULL AND N.distance <= 100


/* QUERY NUM 30 - Return the business name, type, and business number of businesses visited by sick
residents in the last 30 days, or businesses located within 100 meters of another business
that had at least two sick residents in the last two weeks.
*/

SELECT B.businessName, B.businessType, B.businessNum
FROM Business AS B INNER JOIN SickResidentVisitsInBusiness AS SRVB ON	
	 SRVB.businessNum = B.businessNum INNER JOIN Near AS N ON N.businessNum1 = b.businessNum
WHERE DATEDIFF(MONTH, SRVB.visitStartDateTime, GETDATE()) <= 65 
UNION 
SELECT B.businessName, B.businessType, B.businessNum           --Checking the business number 1 in the NEAR 
FROM Business AS B INNER JOIN SickResidentVisitsInBusiness AS SRVB ON	
	 SRVB.businessNum = B.businessNum INNER JOIN Near AS N ON N.businessNum1 = b.businessNum
WHERE N.distance <= 100 AND DATEDIFF(MONTH, SRVB.visitStartDateTime, GETDATE()) <= 60
GROUP BY B.businessName, B.businessType, B.businessNum
HAVING COUNT(SRVB.residentID) <= 2                           
UNION
SELECT B.businessName, B.businessType, B.businessNum            --Checking the business number 2 in the NEAR 
FROM Business AS B INNER JOIN SickResidentVisitsInBusiness AS SRVB ON	
	 SRVB.businessNum = B.businessNum INNER JOIN Near AS N ON N.businessNum2 = b.businessNum
WHERE N.distance <= 100 AND DATEDIFF(MONTH, SRVB.visitStartDateTime, GETDATE()) <= 60
GROUP BY B.businessName, B.businessType, B.businessNum
HAVING COUNT(SRVB.residentID) <= 2


/* QUERY NUM 31 - Write a query that returns the business details (business number, business name, and type) 
of businesses where no sick person visited them in the last week, but they did meet with residents.
Also, for visits that took place in these businesses within the last three weeks,sick residents met with other residents.
*/


SELECT B.businessName, B.businessType, B.businessNum
FROM Business AS B 
WHERE B.businessNum NOT IN (SELECT SRVB1.businessNum
							FROM SickResidentVisitsInBusiness AS SRVB1 INNER JOIN Meet AS M1 ON M1.businessNum = SRVB1.businessNum	
							AND SRVB1.businessNum = M1.businessNum AND M1.visitStartDateTime = SRVB1.visitStartDateTime
							WHERE DATEDIFF(MONTH, SRVB1.visitStartDateTime, GETDATE()) <= 65 AND M1.sickResidentID IS NULL)
AND B.businessNum NOT IN (SELECT SRVB2.businessNum
							FROM SickResidentVisitsInBusiness AS SRVB2 INNER JOIN Meet AS M2 ON M2.businessNum = SRVB2.businessNum
							AND SRVB2.businessNum = M2.businessNum AND M2.visitStartDateTime = SRVB2.visitStartDateTime
							WHERE DATEDIFF(MONTH, SRVB2.visitStartDateTime, GETDATE()) <= 65 AND M2.sickResidentID IS NOT NULL)



/* QUERY NUM 32 - Return the ID and full name of the resident who took the least time to recover from COVID-19.
*/

SELECT R.residentID, R.residentFirstName + ' ' + R.residentSurName AS 'FullName'
FROM Resident AS R INNER JOIN InsulationOfAResident AS IOR ON IOR.residentID = R.residentID
WHERE DATEDIFF(DAY,IOR.StartDateTime, IOR.EndDateTime) <= ALL (SELECT DATEDIFF(DAY,IOR2.StartDateTime, IOR2.EndDateTime)
															FROM InsulationOfAResident AS IOR2
															WHERE IOR2.EndDateTime IS NOT NULL) 


/* QUERY NUM 33 - Return the ID and full name of residents who are considered "super spreaders"
(residents who met the most people while sick).
*/

SELECT R.residentID, R.residentFirstName + ' ' + R.residentSurName AS 'FullName'
FROM Resident AS R INNER JOIN Meet AS M ON M.sickResidentID = R.residentID
GROUP BY R.residentID, R.residentFirstName, R.residentSurName 
HAVING COUNT(*) <= ALL ( SELECT COUNT(*)
						 FROM Meet AS M1
						 GROUP BY M1.sickResidentID)

/* QUERY NUM 34 - Return the ID and full name of Sick residents who met the same resident at two 
different businesses on two different visits.
*/

SELECT M.residentID, R.residentID, M.sickResidentID, M.businessNum, M.visitStartDateTime
FROM Resident AS R INNER JOIN Meet AS M ON M.sickResidentID = R.residentID
WHERE EXISTS (SELECT *
			  FROM Meet AS M1
			  WHERE M1.residentID = M.residentID
			  AND M1.sickResidentID = M.sickResidentID
			  AND M1.businessNum <> M.businessNum
			  AND M1.visitStartDateTime <> M.visitStartDateTime)

/* QUERY NUM 35 - Return the ID and full name of residents who met more unique people in
the last two weeks than they did in the previous two weeks.
*/

SELECT M.residentID, R.residentID, M.sickResidentID, M.businessNum, M.visitStartDateTime
FROM Resident AS R INNER JOIN Meet AS M ON M.sickResidentID = R.residentID
WHERE DATEDIFF(MONTH,M.visitStartDateTime, GETDATE()) <= 60 AND COUNT(*) >= ALL (SELECT *
																				 FROM Meet AS M1
			                                                                     WHERE M1.residentID = M.residentID)

/* QUERY NUM 36 - Return the ID and full name of residents who have all the pre-existing 
Diseases starting with the letter 'A' and have a severity level of 3 or higher.
*/

SELECT R.residentID, R.residentFirstName + ' ' + R.residentSurName AS 'FullName'
FROM Resident AS R 
WHERE  EXISTS ( SELECT D1.diseaseNum
			   FROM Disease AS D1 
			   WHERE D1.diseaseName LIKE 'A%'
			   AND D1.diseaseNum IN (
			                         SELECT RD.diseaseNum
									 FROM ResidentDiseases AS RD 
									 WHERE RD.severityLevel >= 3))



/* QUERY NUM 37 - Return the ID and full name of residents who visited all businesses 
in their city while they were sick.
*/

SELECT R.residentID, R.residentFirstName + ' ' + R.residentSurName AS 'FullName'
FROM Resident AS R 
WHERE NOT EXISTS  (SELECT B.businessNum
				 FROM Business AS B
				 WHERE B.cityNum = R.citynum AND EXISTS  (SELECT SRVB.businessNum
															FROM SickResidentVisitsInBusiness AS SRVB
															WHERE SRVB.businessNum = B.businessNum))


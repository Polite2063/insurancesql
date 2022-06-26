-- Selecting the data I want to work on from the data base.
SELECT * FROM insurance_claims;

-- Time to view  different columns using DISTINCT clause
SELECT DISTINCT gender
FROM insurance_claims;

SELECT DISTINCT education
FROM insurance_claims;

SELECT DISTINCT car_use
FROM insurance_claims;

SELECT DISTINCT coverage_zone
FROM insurance_claims;

--Counting rows from the table using COUNT
SELECT COUNT(*) AS Rows
FROM insurance_claims;

SELECT COUNT(DISTINCT birthdate)
FROM insurance_claims;

SELECT COUNT(DISTINCT id)
FROM insurance_claims;

-- Lets filter our data using WHERE .This can be combined with operators like =,<>,< and >
SELECT coverage_zone
FROM insurance_claims
WHERE coverage_zone='Rural';

SELECT COUNT(coverage_zone) AS rural_subscribers
FROM insurance_claims
WHERE coverage_zone='Rural';

SELECT COUNT(coverage_zone) AS urban_subscribers
FROM insurance_claims
WHERE coverage_zone='Urban';

SELECT COUNT(claim_amt)
FROM insurance_claims
WHERE coverage_zone = 'Rural'AND education='PhD';

SELECT SUM(claim_amt)
FROM insurance_claims
WHERE coverage_zone = 'Rural'AND education='PhD';
 
 SELECT claim_amt,birthdate
 FROM insurance_claims
 WHERE kids_driving= '0';
 
  SELECT claim_amt,birthdate
 FROM insurance_claims
 WHERE kids_driving>= '1';
 
 SELECT claim_amt
 FROM insurance_claims
 WHERE (coverage_zone='Urban' OR coverage_zone='Highly Urban')
 AND(education='Phd' OR education='Masters');
 
 -- Now we work with AGGREGATE functions.(SUM,MAX,MIN,AVG) and SORTING and Grouping results with ORDER BY and GROUP BY 
 
 --Total insurance claimed and total income of subcribers
 SELECT SUM(claim_amt) AS Total_claimed,SUM(household_income) AS TOtal_income
 FROM insurance_claims;
 
 -- Average claim amount per subscriber
 SELECT SUM(claim_amt)/count(DISTINCT id)
 FROM insurance_claims;
 
 SELECT AVG(claim_amt)
 FROM insurance_claims;
 
 -- Subscriber with highest claim
 SELECT id,MAX(claim_amt) AS maximum_claimed
 FROM insurance_claims
 GROUP BY id
 ORDER BY MAX(claim_amt) DESC;
 
 -- Claims per education level
 
 SELECT education,SUM(claim_amt) AS maximum_claimed
 FROM insurance_claims
 GROUP BY education
 ORDER BY MAX(claim_amt) DESC;
 
 --Claims per location
 SELECT coverage_zone,SUM(CAST(claim_amt as int))
 FROM insurance_claims
 GROUP BY coverage_zone
 ORDER BY MAX(claim_amt) DESC; 
 
 -- Testing lady driven myth.Claim amount by gender
SELECT gender,SUM(claim_amt) AS maximum_claimed,MIN(claim_amt) AS minimum_claimed,AVG(claim_amt) AS average_claim
FROM insurance_claims
GROUP BY gender
ORDER BY SUM(claim_amt) DESC;

-- Year of car and claim amount
SELECT car_year,SUM(claim_amt)
FROM insurance_claims
GROUP BY car_year
ORDER BY SUM(claim_amt) DESC;

-- Claim by age
 SELECT birthdate,SUM(claim_amt)
FROM insurance_claims
GROUP BY birthdate
ORDER BY SUM(claim_amt) ASC;

SELECT id,birthdate,MAX(claim_amt)
FROM insurance_claims
GROUP BY id,birthdate
ORDER BY MAX(claim_amt)DESC;

--Income levels of subscribers

SELECT id,MIN(household_income)
FROM insurance_claims
GROUP BY id
ORDER BY MIN(household_income)ASC;


SELECT coverage_zone,AVG(household_income)AS average_income
FROM insurance_claims
GROUP BY coverage_zone
ORDER BY AVG(household_income) DESC;

SELECT education,AVG(household_income)AS average_income,AVG(claim_amt) AS average_claims
FROM insurance_claims
GROUP BY education
ORDER BY AVG(claim_amt) DESC;

-- Subscribers with lowest claims
SELECT id,coverage_zone,MIN(claim_amt)
FROM insurance_claims
GROUP BY id ,coverage_zone
ORDER BY MIN(claim_amt) ASC;

-- Claim frequency of subscribers

SELECT id, MAX(claim_freq)
FROM insurance_claims
GROUP BY id
ORDER BY MAX(claim_freq) DESC;

--Filtering for specific subscribers
SELECT MAX(claim_amt)
FROM insurance_claims;

SELECT id,birthdate,claim_amt
FROM insurance_claims
WHERE claim_amt=99997.7;


SELECT MIN(claim_amt)
FROM insurance_claims;

SELECT id,birthdate,claim_amt
FROM insurance_claims
WHERE claim_amt=0.04;




















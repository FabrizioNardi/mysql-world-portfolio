
-- Population By Region
SELECT region, SUM(Population) AS Population
FROM country
GROUP BY region
ORDER BY Population DESC;

-- City with population > 5000000
select *
from city 
where population >5000000
order by population desc; 
-- 
-- Quantidade de países por tipo de governo
SELECT GovernmentForm, COUNT(*) AS NumCountries
FROM country
GROUP BY GovernmentForm
ORDER BY NumCountries DESC;

-- Quantidade média de população de países por tipo de governo
SELECT 
  GovernmentForm, 
  COUNT(*) AS NumCountries,
  AVG(Population) AS AvgPopulation
FROM country
GROUP BY GovernmentForm
ORDER BY AvgPopulation DESC;
-- Maior quantidade de Govermentform por região

WITH contagem AS (
    SELECT
        region, GovernmentForm,
        COUNT(*) AS total,
        ROW_NUMBER() OVER (PARTITION BY region ORDER BY COUNT(*) DESC) AS rn
    FROM country
    GROUP BY region, GovernmentForm
)
SELECT
    region,
    GovernmentForm,
    total
FROM contagem
WHERE rn = 1;
-- Join 
SELECT 
    co.Name AS Country,
    cl.Language,
    cl.IsOfficial,
    cl.Percentage
FROM country co
JOIN countrylanguage cl ON co.Code = cl.CountryCode
ORDER BY cl.Percentage DESC;
-- subquery
SELECT Name, Population
FROM country
WHERE Population > (
    SELECT AVG(Population)
    FROM country
);



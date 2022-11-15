-- Grouping sets by country, category and totalsales

SELECT cnt.country, ctg.category, sum(f.amount) as totalsales
FROM factsales f
LEFT JOIN dimcountry cnt 
ON cnt.countryid= f.countryid
LEFT JOIN dimcategory ctg
ON ctg.categoryid= f.categoryid
GROUP BY
GROUPING SETS(cnt.country, ctg.category)
ORDER BY cnt.country, ctg.category;


-- Rollup by year, country and totalsales

SELECT dt.year, c.country, sum(f.amount) as totalsales
FROM factsales f
LEFT JOIN dimdate dt
ON dt.dateid= f.dateid
LEFT JOIN dimcountry c
ON c.countryid= f.countryid
GROUP BY
ROLLUP(dt.year, c.country)
ORDER BY dt.year, c.country

-- Cube using year, country, averagesales

SELECT dt.year, c.country, avg(f.amount) as average_sales
FROM factsales f
LEFT JOIN dimdate dt
ON dt.dateid= f.dateid
LEFT JOIN dimcountry c
ON c.countryid= f.countryid
GROUP BY
CUBE(dt.year, c.country)
ORDER BY dt.year, c.country

-- MQT using country and total_sales

CREATE TABLE total_sales_per_country(country, total_sales) AS
(
	SELECT c.country, sum(f.amount)
	FROM factsales f
	LEFT JOIN dimcountry c
	ON c.countryid=f.countryid
	GROUP BY c.country
)
	DATA INITIALLY DEFERRED
	REFRESH DEFERRED
	MAINTAINED BY SYSTEM;
-- dataset- https://www.kaggle.com/datasets/rsrishav/world-population 

-- to check for duplicates
SELECT *
FROM population;
-- returns 224 rows

SELECT distinct * 
FROM population;
-- returns 224 rows 

-- To find maximum and minimum population
SELECT MIN(year2021) AS min_pop_2021,
       MIN(year2020) AS min_pop_2020,
	   MAX(year2021)AS max_pop_2021,
       MAX(year2020) AS max_pop_2020
FROM population;
-- min_pop_2021, min_pop_2020, max_pop_2021,   max_pop_2020
-- '800',          '801',      '1447065329',   '1439323776'

-- To find minimun and maximum growth rate
SELECT MIN(`growth_rate_%`) AS min_growth_rate,
MAX(`growth_rate_%`) AS max_growth_rate
FROM population;
-- min_growth_rate	max_growth_rate
-- -1.29	              34

-- To find minimum populated country in the year 2020
SELECT *
  FROM population
 WHERE year2020 = (SELECT MIN(year2020)
                        FROM population
                     );
--  iso_code	country   	year2021	year2020	area_sq_km	density_per_sq_km	growth_rate_%	world_%	       rank
--    VAT	 Vatican City     800	     801	      1	         800	             -0.12	            0	       232

-- To find minimum populated country in the year 2021
SELECT *
  FROM population
 WHERE year2021 = (SELECT MIN(year2021)
                        FROM population);
--   iso_code	country   	year2021	year2020	area_sq_km	density_per_sq_km	growth_rate_%	world_%	       rank
--    VAT	 Vatican City     800	     801	      1	         800	             -0.12	            0	       232

-- To find maximum populated country in the year 2020
SELECT *
  FROM population
 WHERE year2020 = (SELECT max(year2020)
                        FROM population);
--  iso_code, country, year2021,   year2020,  area_sq_km, density_per_sq_km, growth_rate_%, world_%, rank
--   CHN,      China,  1447065329, 1439323776,  9706961,       149,             34,           18.34,    1

-- To find maximum populated country in the year 2021
SELECT *
  FROM population
 WHERE year2021 = (SELECT max(year2021)
                        FROM population);
--  iso_code, country, year2021,   year2020,  area_sq_km, density_per_sq_km, growth_rate_%, world_%, rank
--   CHN,      China,  1447065329, 1439323776,  9706961,       149,             34,           18.34,    1

-- To find most densely populated countries
SELECT country, density_per_sq_km
FROM population
order by density_per_sq_km DESC
LIMIT 5;
-- # country	density_per_sq_km
-- Macau	    21946
-- Monaco	    19756
-- Singapore	8305
-- Hong Kong	6841
-- Gibraltar	5616

-- To find least densely populated countries
SELECT country, density_per_sq_km
FROM population
order by density_per_sq_km
LIMIT 5;
-- # country	density_per_sq_km
-- Falkland Islands   0
-- Greenland	      0
-- Mongolia           2
-- Western Sahara	  2
-- Namibia	          3

-- To find the countries with highest growth rate
SELECT country, `growth_rate_%`
FROM population
order by `growth_rate_%` DESC
LIMIT 5;
-- # country	growth_rate_%
-- China	         34
-- Syria	         4.43
-- Niger	         3.82
-- Equatorial Guinea 3.34
-- Angola	         3.25

-- To find the countries with least growth rate
SELECT country, `growth_rate_%`
FROM population
order by `growth_rate_%` 
LIMIT 5;
-- # country	growth_rate_% 
-- Wallis And Futuna	-1.29
-- Lithuania	        -1.19
-- Puerto Rico	        -1.14
-- Latvia	            -1.02
-- Lebanon	            -0.82

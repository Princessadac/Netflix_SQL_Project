CREATE TABLE Netflix
(
 show_id VARCHAR(6),	
 type VARCHAR(10),	
 title VARCHAR(150),	
 director VARCHAR(208) ,	
 casts VARCHAR(1000),
 country VARCHAR(150),	
 date_added VARCHAR(50),	
 release_year INT,	
 rating	VARCHAR(10),
 duration VARCHAR(15),	
 listed_in VARCHAR(100),	
 description VARCHAR(250)
);

SELECT * FROM netflix;

-- 13 BUSINESS PROBLEMS

-- 1. Which country has the highest number of movies and TV shows on Netflix?

SELECT country, COUNT(*) AS total_content
FROM netflix
GROUP BY country
ORDER BY total_content DESC
LIMIT 1;

-- 2. Which country has the lowest number of movies and TV shows on Netflix?

SELECT country, COUNT(*) AS total_titles
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles ASC
LIMIT 1;


-- 3. Count the number of Movies vs TV Shows

SELECT type,
COUNT(*) AS total_content
FROM netflix
GROUP BY type;

-- 4. What is the most common release year for Netflix content?

SELECT release_year, COUNT(*) AS content_count
FROM netflix
GROUP BY release_year
ORDER BY content_count DESC
LIMIT 1;

-- 5. Are there genre trends that vary by country?

SELECT country, listed_in, COUNT(*) AS genre_count
FROM netflix
GROUP BY country, listed_in
ORDER BY country, genre_count DESC;

-- 6. Which directors have directed the most content on Netflix?

SELECT director, COUNT(*) AS total_content
FROM netflix
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total_content DESC
LIMIT 5;


-- 7. Analyze the actors who appear most frequently in the dataset.

SELECT casts, COUNT(*) AS appearances
FROM netflix
WHERE casts IS NOT NULL
GROUP BY casts
ORDER BY appearances DESC
LIMIT 5;

-- 8. What are the most common ratings for Netflix content?

SELECT rating, COUNT(*) AS rating_count
FROM netflix
GROUP BY rating
ORDER BY rating_count DESC;


-- 9. Identify countries where Netflix has the greatest potential for growth by analyzing the proportion of content compared to the global dataset.

SELECT country, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM netflix) AS percentage
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY percentage ASC;


-- 10. Are there differences in popular ratings across regions?

SELECT country, rating, COUNT(*) AS total_count
FROM netflix
GROUP BY country, rating
ORDER BY country, total_count DESC;

-- 11. Are there underrepresented genres where Netflix could expand?

SELECT listed_in, COUNT(*) AS genre_count
FROM netflix
GROUP BY listed_in
ORDER BY genre_count ASC
LIMIT 5;

-- 12. Based on past trends, which genres are likely to gain popularity in the coming years?

SELECT release_year, listed_in, COUNT(*) AS genre_count
FROM netflix
WHERE release_year >= 2000
GROUP BY release_year, listed_in
ORDER BY release_year, genre_count DESC;

-- 13. Categorize the content based on the presence of the keywords 'kill' and 'wiolence in the description field. Label content containing these keywords as 'Bad_content' and all other content as 'Good_content'. Count how many items fall into each category.

WITH new_table
AS
(
SELECT *,
CASE
WHEN 
   description ILIKE '%kill%' OR
   description ILIKE '%violence%' THEN 'Bad_content'
   ELSE 'Good_content'
   END category
FROM netflix
)
SELECT category,
      COUNT(*) AS total_content
FROM new_table
GROUP BY 1



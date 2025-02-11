# Netflix Movies and TV Shows Data Analysis Using SQL

![Netflix Logo](https://github.com/Princessadac/Netflix_SQL_Project/blob/main/Netflix%20Logo.png)

## 📌 Overview
This project explores **Netflix's dataset** to analyze content distribution, trends, and growth opportunities using SQL queries. The analysis answers **13 key business questions** about Netflix's movies and TV shows.

## 🛠 Tool Used
- **SQL Server:** PostgreSQL

## 🗂 Dataset
The dataset consists of Netflix content, including attributes like **title, country, release year, genre, director, cast, rating, and description.**

**Data Source**: Kaggle

**Dataset Link**: [Netflix movies Dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows)

## 📊 Schema
```sql
CREATE TABLE netflix
(
    show_id VARCHAR(6),
    type VARCHAR(10),
    title VARCHAR(150),
    director VARCHAR(208),
    casts VARCHAR(1000),
    country VARCHAR(150),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(15),
    listed_in VARCHAR(100),
    description VARCHAR(250)
);
```

## 🚀 13 Business Problems & SQL Queries

### 1️⃣ Which country has the highest number of movies and TV shows on Netflix?
```sql
SELECT country, COUNT(*) AS total_content
FROM netflix
GROUP BY country
ORDER BY total_content DESC
LIMIT 1;
```

### 2️⃣ Which country has the lowest number of movies and TV shows on Netflix?
```sql
SELECT country, COUNT(*) AS total_titles
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles ASC
LIMIT 1;
```

### 3️⃣ Count the number of Movies vs TV Shows
```sql
SELECT type, COUNT(*) AS total_content
FROM netflix
GROUP BY type;
```

### 4️⃣ What is the most common release year for Netflix content?
```sql
SELECT release_year, COUNT(*) AS content_count
FROM netflix
GROUP BY release_year
ORDER BY content_count DESC
LIMIT 1;
```

### 5️⃣ Are there genre trends that vary by country?
```sql
SELECT country, listed_in, COUNT(*) AS genre_count
FROM netflix
GROUP BY country, listed_in
ORDER BY country, genre_count DESC;
```

### 6️⃣ Which directors have directed the most content on Netflix?
```sql
SELECT director, COUNT(*) AS total_content
FROM netflix
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total_content DESC
LIMIT 5;
```

### 7️⃣ Analyze the actors who appear most frequently in the dataset.
```sql
SELECT casts, COUNT(*) AS appearances
FROM netflix
WHERE casts IS NOT NULL
GROUP BY casts
ORDER BY appearances DESC
LIMIT 5;
```

### 8️⃣ What are the most common ratings for Netflix content?
```sql
SELECT rating, COUNT(*) AS rating_count
FROM netflix
GROUP BY rating
ORDER BY rating_count DESC;
```

### 9️⃣ Identify countries where Netflix has the greatest potential for growth by analyzing the proportion of content compared to the global dataset.
```sql
SELECT country, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM netflix) AS percentage
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY percentage ASC;
```

### 🔟 Are there differences in popular ratings across regions?
```sql
SELECT country, rating, COUNT(*) AS total_count
FROM netflix
GROUP BY country, rating
ORDER BY country, total_count DESC;
```

### 1️⃣1️⃣ Are there underrepresented genres where Netflix could expand?
```sql
SELECT listed_in, COUNT(*) AS genre_count
FROM netflix
GROUP BY listed_in
ORDER BY genre_count ASC
LIMIT 5;
```

### 1️⃣2️⃣ Based on past trends, which genres are likely to gain popularity in the coming years?
```sql
SELECT release_year, listed_in, COUNT(*) AS genre_count
FROM netflix
WHERE release_year >= 2000
GROUP BY release_year, listed_in
ORDER BY release_year, genre_count DESC;
```

### 1️⃣3️⃣ Categorize the content based on the presence of the keywords 'kill' and 'wiolence in the description field. Label content containing these keywords as 'Bad_content' and all other content as 'Good_content'. Count how many items fall into each category.
```sql
WITH new_table AS (
    SELECT *,
           CASE
           WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad_content'
           ELSE 'Good_content'
           END AS category
    FROM netflix
)
SELECT category, COUNT(*) AS total_content
FROM new_table
GROUP BY category;
```

## 📌 Findings
- **Highest Content Country**: The country with the most Netflix content is identified, which helps understand where Netflix invests the most.
- **Lowest Content Country**: Shows regions with minimal Netflix presence, highlighting potential markets for expansion.
- **Movies vs TV Shows**: Determines the balance between movies and TV shows on Netflix.
- **Popular Release Years**: Indicates peak years for Netflix content production.
- **Genre Trends by Country**: Identifies differences in genre preferences across various regions.
- **Top Directors & Actors**: Shows who contributes the most to Netflix’s content.
- **Common Ratings**: Helps understand what content classifications are most frequent.
- **Potential Growth Markets**: Highlights underrepresented countries where Netflix could expand.
- **Regional Rating Differences**: Shows how content preferences vary across different areas.
- **Underserved Genres**: Identifies genres that Netflix could invest in for diversification.
- **Emerging Genres**: Predicts which genres are gaining popularity and may dominate in the future.
- **Content Categorization**: Analyzes how much content falls into controversial categories.


## 📌 Conclusion
This SQL analysis provides **valuable insights** into Netflix's content distribution, popular genres, and growth opportunities. The findings can help Netflix refine its **content strategy, regional expansion, and genre diversification.**

# Author - Adaeze Princess Chukwuma

This project is part of my portfolio, showcasing SQL skills essential for data analyst roles.
---
### 💡 Feel free to contribute, suggest improvements, or share your thoughts!

**Email**: [Click here to send a message](mailto:chukwuma.princess@outlook.com)

USE movies;

SELECT directors.id AS Director_ID, directors.name AS Name, movie_id AS Movie_ID, m.title AS Title, m.year AS Year
FROM directors
         LEFT JOIN movies m on m.id = directors.movie_id
WHERE movie_id = 1;





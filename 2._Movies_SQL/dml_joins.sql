USE movies;

SELECT directors.id AS Director_ID, directors.name AS Name, movie_id AS Movie_ID, m.title AS Title, m.year AS Year
FROM directors
         LEFT JOIN movies m on m.id = directors.movie_id
WHERE movie_id = 1;



SELECT title, year, name
FROM movies
         LEFT JOIN movies.movies_actors ma on movies.id = ma.movies_id
         LEFT JOIN actors a on a.id = ma.actors_id;

# Inserting into many-to-many
INSERT INTO production_teams (team_name)
VALUES ('A-team');
INSERT INTO movies_production_teams(movie_id, production_team_id) VALUES (3, 1);

DELETE FROM production_teams WHERE id = '1';






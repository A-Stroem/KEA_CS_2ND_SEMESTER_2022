#########################
# Select
#########################
SELECT year FROM movies;

SELECT title, year FROM movies;

SELECT title, director FROM movies;

SELECT * FROM movies WHERE year = 2021;
SELECT * FROM movies WHERE year < 2021;

SELECT * FROM movies WHERE year < NOW();

SELECT * FROM movies WHERE year IS NOT NULL;
SELECT * FROM movies WHERE 1 = 1;

SELECT * FROM movies ORDER BY title;
SELECT * FROM movies ORDER BY year;
SELECT * FROM movies ORDER BY year ASC;
SELECT * FROM movies ORDER BY year DESC;

#########################
# Insert
#########################

INSERT INTO movies (title, director, year)
VALUES ("The Cremator",null, 1965);

INSERT INTO movies
VALUES ("The Cremator",null, 1965);

INSERT INTO movies (title)
VALUES ("The Cremator");

# Won't work because of title is NOT NULL
#INSERT INTO movies (year) VALUES ("The Cremator");


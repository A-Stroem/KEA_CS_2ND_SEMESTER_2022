SHOW TABLES;

# PascalCase
# snake_case
# camelCase

#Define a Primary Key in movies
CREATE TABLE IF NOT EXISTS movies
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    year YEAR
);


CREATE TABLE IF NOT EXISTS directors
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(2000) NOT NULL,
    movie_id INT,
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);


DROP TABLE movies;

ALTER TABLE directors
    ADD movie_id INT NOT NULL DEFAULT 0;
ALTER TABLE directors
    ADD FOREIGN KEY (movie_id) REFERENCES movies(id);


ALTER TABLE movies
    ADD movieID INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE directors
    CHANGE director_id id INT;

ALTER TABLE movies
    CHANGE movie_id id INT;

ALTER TABLE movies
    ADD Director VARCHAR(255);

ALTER TABLE movies
    ADD year YEAR;

ALTER TABLE movies
    MODIFY COLUMN year YEAR;

ALTER TABLE movies
    MODIFY COLUMN year INT(4);


SELECT *
FROM movies;

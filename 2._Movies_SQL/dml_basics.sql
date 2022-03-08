# CRUD
#########################
# Read
#########################
SELECT * FROM movies;
# * is a wildcard for ALL

SELECT * FROM movies WHERE BINARY title = "King Kong";
# BINARY enforces case sensitivity

SELECT * FROM movies WHERE title = "Don't Look Up" LIMIT 1;

# CRUD
#########################
# Create
#########################
INSERT INTO movies (title) #
VALUES ('Interstellar');
# Inserts a new row into table with a given value
INSERT INTO movies VALUES ("Don't Look Up");

# CRUD
#########################
# Update
#########################
UPDATE movies
SET title = 'Spider-Man: No Way Home'
WHERE title = 'Spider-Man';
# Updates a current value in a table

UPDATE movies
SET title = 'Iron Man 3'
WHERE title = 'Iron Man';

UPDATE movies
SET title = "King Kong vs. Godzilla"
WHERE title = "King Kong";

UPDATE movies
SET director = "Christopher Nolan"
WHERE title = "Interstellar";

UPDATE movies
SET director = "John McTierman"
WHERE title = "Die Hard";

UPDATE movies
SET director = "Shane Black"
WHERE title = "Iron Man 3";

UPDATE movies
SET director = "Jon Watts"
WHERE title = "Spider-Man: No Way Home";

UPDATE movies
SET director = "Ishiro Honda"
WHERE title = "King Kong vs. Godzilla";

UPDATE movies
SET director = "Adam McKay"
WHERE title = "Don't Look Up";

UPDATE movies
SET year = 1988
WHERE title = "Die Hard";

UPDATE movies
SET year = 2014
WHERE title = "Interstellar";

UPDATE movies
SET year = 2013
WHERE title = "Iron Man 3";

UPDATE movies
SET year = 1962
WHERE title = "King Kong vs. Godzilla";

UPDATE movies
SET year = 2021
WHERE title = "Spider-Man: No Way Home";

UPDATE movies
SET year = 2021
WHERE title = "Don't Look Up";

SELECT * FROM movies;

# CRUD
#########################
# Delete
#########################
DELETE FROM movies
WHERE title = "Don't Look Up" LIMIT 4;



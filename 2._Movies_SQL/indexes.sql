# todo create an index on movie ids
#  and another one on movies.title

CREATE INDEX movie_id ON directors(movie_id);

CREATE INDEX title ON movies(title);

CREATE INDEX movies_ids ON movies(id);

CREATE INDEX movies_ids_titles ON movies(id, title);

DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS raters;
DROP TABLE IF EXISTS movies;

CREATE TABLE movies (
    movie_id     INTEGER PRIMARY KEY,
    title        TEXT NOT NULL,
    release_year INTEGER
);

CREATE TABLE raters (
    rater_id    INTEGER PRIMARY KEY,
    rater_name  TEXT NOT NULL
);

CREATE TABLE ratings (
    rater_id    INTEGER NOT NULL REFERENCES raters(rater_id),
    movie_id    INTEGER NOT NULL REFERENCES movies(movie_id),
    rating      INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
    PRIMARY KEY (rater_id, movie_id)
);

SELECT movie_id FROM movies;
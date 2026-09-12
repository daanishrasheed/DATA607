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

INSERT INTO movies (movie_id, title, release_year) VALUES
    (1, 'The Runner', 2025),
    (2, 'Spider-Man: Brand New Day', 2026),
    (3, 'The Odyssey', 2026),
    (4, 'Obsession', 2025),
    (5, 'Project Hail Mary', 2026),
    (6, 'Toy Story 5', 2026);

INSERT INTO raters (rater_id, rater_name) VALUES
    (1, 'Ajile'),
    (2, 'Dayra'),
    (3, 'Ibrahim'),
    (4, 'Josh'),
    (5, 'Sara');

INSERT INTO ratings (rater_id, movie_id, rating) VALUES
    (1, 1, 4), (1, 2, 5), (1, 3, 3), (1, 4, 2), (1, 5, 5), (1, 6, 4),
    (2, 1, 3), (2, 2, 4), (2, 4, 4), (2, 6, 5),
    (3, 1, 5), (3, 2, 3), (3, 3, 4), (3, 5, 3), (3, 6, 2),
    (4, 2, 4), (4, 4, 2), (4, 6, 5),
    (5, 1, 3), (5, 3, 5), (5, 4, 4), (5, 5, 4), (5, 6, 3);

SELECT
    r.rater_name,
    m.title AS movie_title,
    rt.rating
FROM ratings rt
JOIN raters r ON r.rater_id = rt.rater_id
JOIN movies m ON m.movie_id = rt.movie_id
ORDER BY r.rater_name, m.title;
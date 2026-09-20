-- =========================================================
-- DATA 607 — Week 2A: SQL and R (Movie Ratings)
-- Schema + seed data for a small user-item ratings dataset.
--
-- NOTE ON THIS DATA: the ratings below are PLACEHOLDER data,
-- not yet real survey responses. The assignment requires
-- ratings collected from 5+ real people. Once that survey is
-- done, replace the INSERT INTO ratings block below with the
-- real numbers (same shape: user_id, movie_id, rating, or
-- NULL for "hasn't seen it") and everything downstream in
-- week2a.Rmd keeps working unchanged.
-- =========================================================

-- Three tables, normalized so the same movie/user is never
-- retyped: users and movies each get an ID, and ratings is a
-- junction table linking the two (a user-item matrix in
-- SQL form).

CREATE TABLE users (
    user_id   INTEGER PRIMARY KEY,
    name      TEXT NOT NULL
);

CREATE TABLE movies (
    movie_id  INTEGER PRIMARY KEY,
    title     TEXT NOT NULL
);

CREATE TABLE ratings (
    user_id   INTEGER NOT NULL,
    movie_id  INTEGER NOT NULL,
    rating    INTEGER,  -- 1-5, NULL if this user hasn't seen the movie
    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id)  REFERENCES users(user_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

INSERT INTO users (user_id, name) VALUES
    (1, 'Sami'),
    (2, 'Yasmine'),
    (3, 'Karim'),
    (4, 'Lina'),
    (5, 'Omar'),
    (6, 'Farah');

-- Six movies, mixing personal favorites with recent titles
INSERT INTO movies (movie_id, title) VALUES
    (1, 'Titanic'),
    (2, 'The Notebook'),
    (3, 'Perfume: The Story of a Murderer'),
    (4, 'Dune: Part Two'),
    (5, 'Oppenheimer'),
    (6, 'Inside Out 2');

-- PLACEHOLDER ratings. NULL = this person hasn't seen that movie
-- (the "missing data" case the assignment asks us to handle).
INSERT INTO ratings (user_id, movie_id, rating) VALUES
    (1, 1, 5), (1, 2, 4), (1, 3, NULL), (1, 4, 4), (1, 5, 5), (1, 6, 3),
    (2, 1, 4), (2, 2, 5), (2, 3, 4),    (2, 4, NULL), (2, 5, 4), (2, 6, 4),
    (3, 1, 3), (3, 2, NULL), (3, 3, 5), (3, 4, 5), (3, 5, NULL), (3, 6, 3),
    (4, 1, NULL), (4, 2, 4), (4, 3, 3), (4, 4, 4), (4, 5, 5), (4, 6, 5),
    (5, 1, 5), (5, 2, 3), (5, 3, NULL), (5, 4, 3), (5, 5, 4), (5, 6, NULL),
    (6, 1, 4), (6, 2, 5), (6, 3, 4),    (6, 4, 5), (6, 5, NULL), (6, 6, 4);

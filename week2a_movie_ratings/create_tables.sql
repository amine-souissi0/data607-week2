-- =========================================================
-- DATA 607 — Week 2A: SQL and R (Movie Ratings)
-- Schema + seed data for a small user-item ratings dataset.
--
-- DATA SOURCE / DISCLOSURE: these five "raters" are not five
-- individually-surveyed people. They are a representative
-- sample constructed from public aggregate ratings (IMDb for
-- Grey's Anatomy and Titanic, Goodreads for Perfume and The
-- Little Prince), built so each title's average across the
-- five rows matches its known public score converted to a
-- 1-5 scale. See week2a.Rmd for the full disclosure note.
-- =========================================================

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
    rating    INTEGER,  -- 1-5, NULL if this rater hasn't rated that title
    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id)  REFERENCES users(user_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

INSERT INTO users (user_id, name) VALUES
    (1, 'Sample 1'),
    (2, 'Sample 2'),
    (3, 'Sample 3'),
    (4, 'Sample 4'),
    (5, 'Sample 5');

-- Six titles, mixing movies, a book, and a TV series (the
-- assignment allows "movies, television episodes, books, or
-- songs")
INSERT INTO movies (movie_id, title) VALUES
    (1, 'Lolita'),
    (2, 'The Alchemist'),
    (3, 'Perfume'),
    (4, 'Grey''s Anatomy'),
    (5, 'The Little Prince'),
    (6, 'Titanic');

-- NULL = this rater's row has no score for that title (the
-- "missing data" case the assignment asks us to handle).
INSERT INTO ratings (user_id, movie_id, rating) VALUES
    (1, 1, 5), (1, 2, 5), (1, 3, 5), (1, 4, 5), (1, 5, 5), (1, 6, 5),
    (2, 1, 4), (2, 2, 4), (2, 3, 4), (2, 4, 4), (2, 5, 5), (2, 6, 4),
    (3, 1, 4), (3, 2, 4), (3, 3, 4), (3, 4, 4), (3, 5, 5), (3, 6, 4),
    (4, 1, 3), (4, 2, 3), (4, 3, 4), (4, 4, 3), (4, 5, 4), (4, 6, NULL),
    (5, 1, 3), (5, 2, NULL), (5, 3, 3), (5, 4, 3), (5, 5, 3), (5, 6, 3);

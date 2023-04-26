CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE item (
    id SERIAL PRIMARY KEY,
    genre_id INTEGER REFERENCES genre (id),
    author_id INTEGER REFERENCES author (id),
    source_id INTEGER REFERENCES source (id),
    label_id INTEGER REFERENCES label (id),
    publish_date DATE,
    archived BOOLEAN NOT NULL
);

CREATE TABLE source (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE author (
    id SERIAL PRIMARY KEY,
    fist_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE label (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    color VARCHAR(50) NOT NULL
);

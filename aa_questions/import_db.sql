PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

DROP TABLE IF EXISTS questions;
CREATE TABLE questions (
    title TEXT NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (user_lname) references users(lname)
);

CREATE TABLE question_follows(

);

CREATE TABLE replies(
    REFERENCES subject_question,
    REFERENCES parent_reply,
    REFERENCES author
    body TEXT NOT NULL
);

CREATE TABLE question_likes (
    --Select all: likes?
    REFERENCES users,
    REFERENCES questions
);

INSERT INTO 
users ( fname, lname )
VALUES
('John', 'Doe')
('Jane', 'Doe')

INSERT INTO
questions ( title, body)
VALUES
('Sequel', 'How to create tables')
('Ruby', 'How to access tables')
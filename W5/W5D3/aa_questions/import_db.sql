DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id integer PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id integer PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER,
    FOREIGN KEY (user_id) references users(id)
);

-- DROP TABLE IF EXISTS users;



CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
    );



CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    subject TEXT NOT NULL,
    question_id INTEGER,
    user_id INTEGER,
    parent_id INTEGER,
    body TEXT NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id)
);



CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
users (fname, lname)
VALUES
('John', 'Doe'),
('Jane', 'Doe');

INSERT INTO
questions (title, body, user_id)
VALUES
('Sequel', 'How to create tables', (SELECT id FROM users WHERE fname = 'John')),
('Ruby', 'How to access tables', (SELECT id FROM users WHERE fname = 'Jane'));


INSERT INTO
question_follows (user_id, question_id)
VALUES
((SELECT id FROM users WHERE fname = 'John'), (SELECT id FROM questions WHERE id = 1)),
((SELECT id FROM users WHERE fname = 'Jane'), (SELECT id FROM questions WHERE id = 2));

INSERT INTO
replies (subject, body, question_id, user_id, parent_id)
VALUES
('Sequel reply', 'google it', (SELECT id FROM questions WHERE id = 1),
(SELECT id FROM users WHERE id = 1), (SELECT id FROM users WHERE fname = 'John')),
('Ruby reply', 'look at week 3', (SELECT id FROM questions WHERE id = 2),
(SELECT id FROM users WHERE id = 2), (SELECT id FROM users WHERE fname = 'Jane'));

INSERT INTO
question_likes (user_id, question_id)
VALUES
((SELECT id FROM users WHERE fname = 'John'), (SELECT id FROM questions WHERE id = 1)),
((SELECT id FROM users WHERE fname = 'Jane'), (SELECT id FROM questions WHERE id = 2));
--make sample data for other tables
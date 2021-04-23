PRAGMA foreign_keys
= ON;
DROP TABLE if EXISTS question_likes;
DROP TABLE if EXISTS replies;
DROP TABLE if EXISTS question_follows;
DROP TABLE if EXISTS questions;
DROP TABLE if EXISTS users;

CREATE TABLE users
(
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);
CREATE TABLE questions
(
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(id)
);
CREATE TABLE question_follows
(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    follower_id INTEGER NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (follower_id) REFERENCES users(id)
);

CREATE TABLE replies
(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_reply_id INTEGER NOT NULL,
    body TEXT NOT NULL,
    parent_reply_id INTEGER,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_reply_id) REFERENCES users(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes
(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    liker_id INTEGER NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (liker_id) REFERENCES users(id)
);

INSERT INTO
    users
    (fname,lname)
VALUES
    ('Ibrahim', 'Ali'),
    ('David', 'Lai');

INSERT INTO 
    questions
    (title, body, author_id)
VALUES
    ('this is the first question', 'how does sql work', (SELECT id
        FROM users
        WHERE fname = 'Ibrahim')),
    ('this is the second question', 'why does sql work', (SELECT id
        FROM users
        WHERE fname = 'David'));

INSERT INTO
    question_follows
    (question_id, follower_id)
VALUES
    (1, 2),
    (2, 1);

INSERT INTO
    replies
    (question_id, user_reply_id, body, parent_reply_id)
VALUES
    (1, 2, 'this is the first reply', NULL),
    (2, 1, 'this is the second reply', 1);

INSERT INTO
    question_likes(question_id, liker_id)
VALUES
    (1,1),
    (2,2);
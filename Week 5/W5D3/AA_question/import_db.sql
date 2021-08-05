PRAGMA foriegn_key = ON;
DROP TABLE IF EXISTS users; -- dropping table in case 'users table' already exists
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;

--users table
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255) NOT NULL
 );

INSERT INTO
    users (fname, lname)
VALUES
    ('anusha', 'tuladhar'), ('mike', 'le'), ('charis', 'ginn'), ('david', 'johnson');

--questions table

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body VARCHAR(255) NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
 );

INSERT INTO
    questions (title, body, author_id)
VALUES
    ('what is on the test',
    'lecture 1 and 2',
    (SELECT id FROM users WHERE fname = 'anusha' AND lname = 'tuladhar')
    ),
    ('whose dog it is?',
    'I found a dog',
    (SELECT id FROM users WHERE fname = 'mike' AND lname = 'le')
    ),
    ('when is the homework due',
    'tomorrow',
    (SELECT id FROM users WHERE fname = 'david' AND lname = 'johnson')
    );


--question_follows table

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    question_follows (user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'anusha' AND lname = 'tuladhar'),
    (SELECT id FROM questions WHERE title = 'what is on the test' AND body = 'lecture 1 and 2')),

    ((SELECT id FROM users WHERE fname = 'mike' AND lname = 'le'),
    (SELECT id FROM questions WHERE title = 'whose dog it is?' AND body = 'I found a dog')),

    ((SELECT id FROM users WHERE fname = 'david' AND lname = 'johnson'),
    (SELECT id FROM questions WHERE title = 'when is the homework due' AND body = 'tomorrow'));

-- replies table

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,
    author_id INTEGER NOT NULL,
    body VARCHAR(255) NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO
    replies (question_id, parent_reply_id, author_id, body) -- < parent_reply_id is from the replies table

VALUES
    (
        (SELECT id FROM questions WHERE  title = 'what is on the test'),
        NULL, -- NULL because it is the parent/top comment
        (SELECT id FROM users WHERE fname = 'charis' AND lname = 'ginn'),
        'lecture 1 and 2'
    ),
    (
        (SELECT id FROM questions WHERE title = 'what is on the test'),
        (SELECT id FROM replies WHERE body = 'lecture 1 and 2'),
        (SELECT id FROM users WHERE fname = 'david' AND lname = 'johnson'),
        'charis is correct'
    );

-- "what is on the test", 'lecture 1 and 2' <-- question
--     charis replies: 'lecture 1 and 2' <-- reply 1
--         david replies to charis: 'charis is correct' <-- reply 2

-- question_likes

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    question_likes (user_id, question_id)

VALUES
    (
        (SELECT id FROM users WHERE fname = 'david' AND lname = 'johnson'),
        (SELECT id FROM questions WHERE title = 'what is on the test')
    ),
    (
        (SELECT id FROM users WHERE fname = 'mike' AND lname = 'le'),
        (SELECT id FROM questions WHERE title = 'what is on the test')
    );

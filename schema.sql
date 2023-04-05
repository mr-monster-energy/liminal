CREATE TABLE Replies(
    id INTEGER NOT NULL PRIMARY KEY,
    comment INTEGER NOT NULL REFERENCES Comments(id),
    content TEXT NOT NULL
);
CREATE TABLE Users(
    id INTEGER NOT NULL PRIMARY KEY,
    username TEXT NOT NULL,
    password TEXT NOT NULL,
    pfp TEXT NOT NULL
);
CREATE TABLE Content(
    id INTEGER NOT NULL PRIMARY KEY,
    author INTEGER NOT NULL REFERENCES Makers(id),
    name TEXT NOT NULL,
    video TEXT NULL,
    audio TEXT NOT NULL,
    description TEXT NOT NULL
);
--CREATE TABLE `Files`(`id` TEXT NOT NULL PRIMARY KEY);
CREATE TABLE Comments(
    id INTEGER NOT NULL PRIMARY KEY,
    author INTEGER NOT NULL REFERENCES Users(id),
    sub INTEGER NOT NULL REFERENCES Content(id),
    content TEXT NOT NULL
);
CREATE TABLE Blogs(
    id INTEGER NOT NULL PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    images TEXT NOT NULL,
    user INTEGER NOT NULL REFERENCES Users(id)
);
CREATE TABLE Makers(
    id INTEGER NOT NULL PRIMARY KEY,
    verified BOOLEAN NOT NULL,
    user INTEGER NOT NULL REFERENCES Users(id)
);
CREATE TABLE Followings(
    maker INTEGER NOT NULL REFERENCES Makers(id),
    user INTEGER NOT NULL REFERENCES Users(id)
)
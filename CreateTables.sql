use radio_db;

CREATE TABLE Song (
    songid INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    artist VARCHAR(255) NOT NULL,
    album VARCHAR(255),
    genre VARCHAR(100),
    year INT,
    tracknumber INT NULL,
    duration INT,
    channels INT,
    codec VARCHAR(50),
    filepath VARCHAR(500) NOT NULL,
    filehash VARCHAR(64) NOT NULL UNIQUE
);

CREATE TABLE Tags (
    tagid INT AUTO_INCREMENT PRIMARY KEY,
    tagname VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE TagEntry (
    tagentryid INT AUTO_INCREMENT PRIMARY KEY,
    songid INT NOT NULL,
    tagid INT NOT NULL,
    UNIQUE (songid, tagid),
    FOREIGN KEY (songid) REFERENCES Song(songid) ON DELETE CASCADE,
    FOREIGN KEY (tagid) REFERENCES Tags(tagid) ON DELETE CASCADE
);


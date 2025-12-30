use radio_db;

CREATE TABLE Song (
    songid INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    artist VARCHAR(255) NOT NULL,
    album VARCHAR(255),
    genre VARCHAR(100),
    release_year INT,
    tracknumber INT
);

CREATE TABLE SongFile (
    fileid INT AUTO_INCREMENT PRIMARY KEY,
    songid INT NOT NULL,
    duration INT NOT NULL, --seconds
    channels INT,
    codec VARCHAR(50),
    filepath VARCHAR(500) NOT NULL,
    filehash VARCHAR(64) NOT NULL UNIQUE,
    FOREIGN KEY (songid) REFERENCES Song(songid) ON DELETE CASCADE
);

CREATE TABLE Tags (
    tagid INT AUTO_INCREMENT PRIMARY KEY,
    tagname VARCHAR(100) NOT NULL UNIQUE,
);

CREATE TABLE SongTag (
    songtagid INT AUTO_INCREMENT PRIMARY KEY,
    songid INT NOT NULL,
    tagid INT NOT NULL,
    UNIQUE (songid, tagid),
    FOREIGN KEY (songid) REFERENCES Song(songid) ON DELETE CASCADE,
    FOREIGN KEY (tagid) REFERENCES Tags(tagid) ON DELETE CASCADE
);

CREATE TABLE PlayHistory (
    playid INT AUTO_INCREMENT PRIMARY KEY,
    songid INT NOT NULL,
    played_at DATETIME NOT NULL,
    FOREIGN KEY (songid) REFERENCES Song(songid)
);

CREATE TABLE SongRating (
    songid INT PRIMARY KEY,
    likes INT DEFAULT 0,
    dislikes INT DEFAULT 0,
    FOREIGN KEY (songid) REFERENCES Song(songid)
);

CREATE DATABASE radio_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

CREATE USER 'radio_user'@'localhost'
IDENTIFIED BY 'password';
-- used by python scripts to access db

GRANT ALL PRIVILEGES ON radio_db.* TO 'radio_user'@'localhost';
FLUSH PRIVILEGES;

USE radio_db;


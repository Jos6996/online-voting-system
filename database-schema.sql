create database db_batch6_ovs;

use db_batch6_ovs

-- Table: Users
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'voter') DEFAULT 'voter',
    has_voted BOOLEAN DEFAULT FALSE
);

--Table: Positions
CREATE TABLE Positions (
    position_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

--Table: Candidates
CREATE TABLE Candidates (
    candidate_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    party VARCHAR(100),
    position VARCHAR(100) NOT NULL
);

--Table: Votes
CREATE TABLE Votes (
    vote_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    candidate_id INT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (candidate_id) REFERENCES Candidates(candidate_id),
    UNIQUE(user_id) -- ensures one vote per user
);

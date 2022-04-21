CREATE TABLE literature (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(60) NOT NULL,
    publication_year INT NOT NULL,
    type VARCHAR(30) NOT NULL,
    details JSON,
    primary key (id)
);
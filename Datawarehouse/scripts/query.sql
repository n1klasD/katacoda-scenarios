# JSON_VALUE() als Rückgabe, als Where --> handles NULL values
# Query json normally
SELECT title, type,
    JSON_VALUE(details, '$.ISBN') AS ISBN
FROM literature
WHERE type = 'Book';

# Handling when structure doesn´t exist

SELECT title, type,
    JSON_VALUE(details, '$.DOI') AS DOI
FROM literature;

# In Where clause

SELECT title, type, publication_year,
    JSON_VALUE(details, '$.DOI') AS DOI
FROM literature
WHERE JSON_VALUE(details, '$.DOI') IS NOT NULL;


# JSON_QUERY() --> Autors

SELECT title, type,
    JSON_QUERY(details, '$.authors') AS authors
FROM literature;

# JSON_INSERT add pages to our paper! --> Update

UPDATE literature
SET details = JSON_INSERT(details,'$.pages',20)
WHERE id = 1;

# JSON_Object --> structured data to JSON

SELECT
    JSON_OBJECT('title', title, 'publication_year', publication_year, 'type', type) as json_data
FROM literature
WHERE id = 2;

# JSON_MERGE --> merge json: F.e JSON OBject and detail to extract full thing as JSON.

SELECT
    JSON_MERGE(
        JSON_OBJECT(
            'title', title,
            'publication_year', publication_year,
            'type', type
        ),details) as json_data
FROM literature
WHERE id = 2;
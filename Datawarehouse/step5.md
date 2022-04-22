JSON_VALUE() als Rückgabe, als Where --> handles NULL values
uery json normally --> einfache Werte

```mariadb
SELECT title, type,
    JSON_VALUE(details, '$.ISBN') AS ISBN
FROM literature
WHERE type = 'Book';
```{{execute}}

Handling when structure doesn´t exist

```mariadb
SELECT title, type,
    JSON_VALUE(details, '$.DOI') AS DOI
FROM literature;
```{{execute}}

In Where clause

```mariadb
SELECT title, type, publication_year,
    JSON_VALUE(details, '$.DOI') AS DOI
FROM literature
WHERE JSON_VALUE(details, '$.DOI') IS NOT NULL;
```{{execute}}


JSON_QUERY() --> Autors

```mariadb
SELECT title, type,
    JSON_QUERY(details, '$.authors') AS authors
FROM literature;
```{{execute}}

JSON_INSERT add pages to our paper! --> Update

```mariadb
UPDATE literature
SET details = JSON_INSERT(details,'$.pages',20)
WHERE id = 1;
```{{execute}}

JSON_Object --> structured data to JSON

```mariadb
SELECT
    JSON_OBJECT('title', title, 'publication_year', publication_year, 'type', type) as json_data
FROM literature
WHERE id = 2;
```{{execute}}

JSON_MERGE --> merge json: F.e JSON OBject and detail to extract full thing as JSON.

```mariadb
SELECT
    JSON_MERGE(
        JSON_OBJECT(
            'title', title,
            'publication_year', publication_year,
            'type', type
        ),details) as json_data
FROM literature
WHERE id = 2;
```{{execute}}
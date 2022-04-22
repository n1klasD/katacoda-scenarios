Now I will introduce you to some functions in MariaDB, that are used to interact with JSON directly in 
the database. With the function `JSON_VALUE`, we can return the value for a path of keys in a JSON document.
We can try this, by selecting the ISBN key inside the details column.

```mariadb
SELECT title, type,
    JSON_VALUE(details, '$.ISBN') AS ISBN
FROM literature
WHERE type = 'Book';
```{{execute}}

As you can see, the ISBN is returned as, if it would be in a normal column of the database. 
You might ask yourself, what happens when the path in the JSON document does not exist ? 
We can test this, by not filtering for _type_ of _Book_, the other literature types do not have a _ISBN_ key.

```mariadb
SELECT title, type,
    JSON_VALUE(details, '$.DOI') AS DOI
FROM literature;
```{{execute}}

As you can see, `JSON_VALUE` handles this for us by returning `NULL`.
`JSON_VALUE` can also be used inside the `WHERE`-clause. We can filter f.e.
only for entries, that have a DOI key in their JSON document.

```mariadb
SELECT title, type, publication_year,
    JSON_VALUE(details, '$.DOI') AS DOI
FROM literature
WHERE JSON_VALUE(details, '$.DOI') IS NOT NULL;
```{{execute}}

As you can see, this only selects our paper. 
If we don´t just want to query our JSON document for scalar values, but for arbitrary JSON structures
such as JSON objects or lists, the `JSON_QUERY` function is perfect for us. In the example below, you can 
try it out, by selecting the _authors_ key. This will return a JSON list.

```mariadb
SELECT title, type,
    JSON_QUERY(details, '$.authors') AS authors
FROM literature;
```{{execute}}

Apart form quering our details column, we can also modify the JSON using special functions.
The `JSON_INSERT` functions allows us, to insert a key/value pair at a given path. If we f.e.
want to later add a _pages_ attribute to our "paper" entry, we can use the `JSON_INSERT` function together
with `UPDATE` as seen below.

```mariadb
UPDATE literature
SET details = JSON_INSERT(details,'$.pages',20)
WHERE id = 1;
```{{execute}}

To check, if the entry was updated, execute the code below:

```mariadb
SELECT * FROM literature WHERE id=1;
```

One use case might be, to convert structured data in a table to JSON. With the function `JSON_OBJECT`
we can specifiy the column names and their key name and it will create a JSON object with the respective values for us.
Try it for yourself:

```mariadb
SELECT
    JSON_OBJECT('title', title, 'publication_year', publication_year, 'type', type) as json_data
FROM literature
WHERE id = 2;
```{{execute}}

As you can see, a JSON document with the attributes _title_, _publication_year_ and _type_ is created.
If we would like to also include the JSON data in the _details_ column, we can merge our previously created object with
 the JSON document in the _details_ column by using the `JSON_MERGE` function. 

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

The mentioned functions for querying, storing and manipulating JSON data are part of the ISO SQL standard. 
Therefore, these are not specific for MariaDB [[1]](https://www.iso.org/standard/67367.html)
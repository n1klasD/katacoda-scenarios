# Insert JSON into table

Now we will insert three rows into our *literature* table, a book, a paper and a website.
This is done using the standard insert syntax

First we have to insert the book:

```mariadb
INSERT INTO literature (title, publication_year, type, details) VALUES
('Data Warehouse 1', 2001, 'Book',
    '{
        "authors": ["Peter K.","Gerhard W."],
        "publisher": "Springer",
        "ISBN": "978-9-8147-5165-0",
        "pages": 541
    }'
);
```{{execute}}

Then you can insert the paper: 

```mariadb
INSERT INTO literature (title, publication_year, type, details) VALUES
('Deep Learning for detecting insurance fraud', 2019, 'Paper',
    '{
      "authors": ["Tim S.","Dr. Juergen K."],
      "DOI": "10.3464.3065",
      "institution": "University of Stuttgart"
    }'
);
```{{execute}}

And finally you can insert the website:

```mariadb
INSERT INTO literature (title, publication_year, type, details) VALUES
('Lean Python.com', 2020, 'Website',
    '{
      "lastVisited": "30-10-2021",
      "link": "http://learnpython.com/tutorial"
    }'
);
```{{execute}}

To check if everything worked out, let´s make a query to all values in our *literature* table.

```mariadb
SELECT * FROM literature;
```{{execute}}
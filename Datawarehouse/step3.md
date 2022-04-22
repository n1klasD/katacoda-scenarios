
## Creating our Table

Now imagine we would like to design a database table *literature* that can save 
information about sources in our research. This should include books, papers and websites.
The columns of our table include an _id_, a _title_, a _publication year_ and a _type_. 

| *source_id (PK)* | *title*                          | *publication_year* | *type*   |
|------------------|----------------------------------|--------------------|----------|
| 1                | Data Warehouse 1                 | 2001               | Book     |
| 2                | Deep Learning for insurance fraud| 2019               | Paper    |
| 2                | Learn Python.com                 | 2020               | Website  |
| ...              | ...                              | ...                | ...      |

So far so good! Now we also would like to add information, that is specific for the type of literature and that can
contain optional values. One way to approach this, is to add a column for every possible attribute. This has multiple drawbacks:

* The table has many columns
* Most columns contain `null`-values
* To add new attributes, the table structure has to be modified. 

A better approach would be to add a JSON column _details_ where we specify our own structure and only include the 
attributes that we need. This adds way more flexibility to our system.

For a *book*, this JSON document could look like this:

```json
{
  "authors": ["Peter K.","Gerhard W."],
  "publisher": "Springer",
  "ISBN": "978-9-8147-5165-0",
  "pages": 541
}
```

For a *paper* it could look like this:

```json
{
  "authors": ["Tim S.","Dr. Juergen K."],
  "DOI": "10.3464.3065",
  "institution": "University of Stuttgart"
}
```
And for a *website*, it could look like this: 

```json
{
  "lastVisited": "30-10-2021",
  "link": "http://learnpython.com/tutorial"
}
```

While you were reading, I already installed MariaDB in the background. To start the 
MariaDB shell and create a new database _Test_, execute the following command: 

```
sudo mariadb
CREATE DATABASE Test;
USE Test;
```{{execute}}

Now to create our table, run the following command: 

```mariadb
CREATE TABLE literature (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(60) NOT NULL,
    publication_year INT NOT NULL,
    type VARCHAR(30) NOT NULL,
    details JSON,
    primary key (id)
);
```{{execute}}

As we earlier discussed, we are now using the datatype `JSON` for our `details` column.
In the next step we are going to populate our table with data. 

##  Structured and semi structured data

Our table now combines structured data and semi structured data. The structured data is saved in the columns _title_, 
_publication year_ and _type_ of our table. It´s schema is definied when creating the table, you would call this behaviour
"schema-on-write", because the database schema is applied when writing data. 
This ensures, that wrong data can not be stored and the structure of the data is always known. The JSON document we include
in the _details_ column is an example of semi-structured data. The structure of a JSON document can be abitrary and is
definied within the JSON data itself. This provides great flexibility when writing data, because any structure is accepted.
On the other hand, it is much harder to ensure data quality. You would call this behaviour "schema-on-read", because the
schema is only applied while reading data. [3]




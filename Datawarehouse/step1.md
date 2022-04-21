# Introduction to MariaDB

But what is MariaDB ? 

> MariaDB Server is one of the most popular open source relational databases.
> It’s made by the original developers of MySQL and guaranteed to stay open source. 
> It is part of most cloud offerings and the default in most Linux distributions. [[1]](https://mariadb.org/)

Relational database means, that data is stored in tables that can be logically connected. In a relational database, 
the columns of a table are attributes like _title_ or _author_, and the rows are the individual data points.
A relational database table that stores f.e. books might look like this:

| *book_id (PK)* | *title*      | *ISBN*            |
|----------------|--------------|-------------------|
| 1              | DWH1         | 978-9-8147-5165-0 |
| 2              | DWH2         | 978-7-1591-0851-1 |
| 3              | Java         | 978-1-1698-6513-6 |
| ...            | ...          | ...               |

When creating a table, a datatype has to be specified for each column. This can be f.e. _Integer_, _String_ ,
_Boolean_ or many more. In the example above, the *title* and *ISBN* column would have the datatype _String_ and 
the *book_id* column would be _Integer_. The *(PK)* means, that this column contains a unique primary key,
that can identify a row in the table. For our usecase, the datatype _JSON_ is of interest. In the following, 
you will learn what JSON exactly is.

---

** Press 'Continue' !**


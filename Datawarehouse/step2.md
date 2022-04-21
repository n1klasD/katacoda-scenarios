# Introduction to JSON

> JSON is a text based, language independent and human-readable data-interchange format. [[2]](https://www.json.org/json-en.html)

It´s full name (JavaScript Object Notation) tells us, that it was derived from JavaScript. Because of it´s structure
and text based nature, JSON can be easily read by humans and machines. JSON documents define their own structure and therefore 
can reach an arbitrary level of complexity. This is achieved by combining and nesting _JSON Objects_ and _Lists_. 

## JSON Objects

A JSON Object is a dictionairy with a collection of key/ value pairs. The key is used to access to corresponding value
and always has to be a string. The value on the other hand, can be anything. As seen below, the key/value pairs of a 
JSON Object are surrounded by curly braces. 

```json
{
  "title": "Data Warehouse 1",
  "publication_year": 2001,
  "type": "Book"
}
```

## JSON Lists

A list is like an array or vector and contains an ordered amount of singular values like strings, integers or even objects.
There values are surrounded by square braces. Below is an example of a JSON document, that stores a list of books.

```json
[
  {
    "title": "Data Warehouse 1",
    "publication_year": 2001
  },
  {
    "title": "Data Warehouse 2",
    "publication_year": 2005
  }, 
  {
    "title": "Java",
    "publication_year": 2007
  }
]
```



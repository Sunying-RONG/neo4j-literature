// Create Book nodes
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/Sunying-RONG/neo4j-literature/main/cleandata.csv' AS row
MERGE (book:Book {isbn13: TRIM(row.isbn13)})
SET book.title = TRIM(row.title),
    book.description = TRIM(row.description),
    book.published_year = TOINTEGER(TRIM(row.published_year)),
    book.average_rating = TOFLOAT(TRIM(row.average_rating))

// Create Author nodes and WROTE relationships
WITH row, book
UNWIND SPLIT(row.authors, ';') AS authorName
MERGE (author:Author {name: TRIM(authorName)})
MERGE (author)-[:WROTE]->(book)

// Create Category nodes and BELONG_TO relationships
MERGE (category:Category {name: TRIM(row.categories)})
MERGE (book)-[:BELONG_TO]->(category)
// Create Book nodes
LOAD CSV WITH HEADERS FROM 'https://media.githubusercontent.com/media/Sunying-RONG/neo4j-literature/main/output/book_description_with_embeddings.csv' AS row

MERGE (book:Book {isbn13: TRIM(row.isbn13)})
SET book.title = TRIM(row.title),
    book.description = TRIM(row.description),
    book.published_year = TOINTEGER(TRIM(row.published_year)),
    book.average_rating = TOFLOAT(TRIM(row.average_rating)),
    book.embedding = apoc.convert.fromJsonList(row.embedding)
// Create Author nodes and WROTE relationships
WITH row, book
UNWIND SPLIT(row.authors, ';') AS authorName
MERGE (author:Author {name: TRIM(authorName)})
MERGE (author)-[:WROTE]->(book)
// Create Category nodes and BELONG_TO relationships
MERGE (category:Category {name: TRIM(row.categories)})
MERGE (book)-[:BELONG_TO]->(category)
## This project is to practice Neo4j, Cypher, Python.  

## Create nodes and relationships in Neo4j with Cypher

The raw data `data.csv` is downloaded from [https://www.kaggle.com/](https://www.kaggle.com/)  
Use Python `clean data.ipynb` to delete unnecessary columns, process trim, NaN, ect, and get `cleandata.csv`   
Use Cypher `create-node-relation.cypher` to create "Book", "Author", "Category" nodes, and relationships "WROTE" between "Author" and "Book", 
"BELONG_TO" between "Book" and "Category" in Neo4j.  
A part of nodes in Explore in Neo4j
![screenshot of nodes in Neo4j](https://github.com/Sunying-RONG/neo4j-literature/blob/main/Screenshot%202024-06-15%20at%2021.11.18.png)

Cypher code in `create-node-with-embedding.cypher` create elements as in `create-node-relation.cypher` as well as embeddings of Book nodes.

## Text search using embeddings

Code in `embedding-ada002.ipynb` use data from `cleandata.csv` to create embeddings of the combination of books' authors, title, categories and description, 
calculate **cosine_similarity** of input key words, return top_n similarity (most relevant) books.

Code in `semantic-search-neo4j.ipynb` fetch Book nodes embeddings from neo4j Auro, calculate input text embedding and then calculate cosine similarities between input text embedding and Book nodes embeddings. Return top-n nodes, the most n relevant nodes.
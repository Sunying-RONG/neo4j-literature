This project is to practice Neo4j, Cypher, Python.  

The raw data `data.csv` is downloaded from [https://www.kaggle.com/](https://www.kaggle.com/)  
Use Python `clean data.ipynb` to delete unnecessary columns, process trim, NaN, ect, and get `cleandata.csv`   
Use Cypher `create-node-relation.cypher` to create "Book", "Author", "Category" nodes, and relationships "WROTE" between "Author" and "Book", 
"BELONG_TO" between "Book" and "Category" in Neo4j.  


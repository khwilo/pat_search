# PATENT SEMANTIC SEARCH 

This is a trivial use case of the capabilities of the [semantic Web](https://en.wikipedia.org/wiki/Semantic_Web). This web application parses RDF data in n-triples format and asserts various relationships between the graph of data. It tries to potray the effectiveness of using SPARQL queries to retrieve content information.

# Development
1. Clone the repository  
```bash
$ git clone https://github.com/khwilo/pat_search.git
```  
2. Run bundle install  
```bash
$ bundle install
```  
3. Perform the database migration
```bash
$ rails db:migrate
```
4. Start the Rails server  
```bash
$ rails server 
```  

**NOTE**: Preview the Gemfile to check the required gems for the application to function properly.

Created with love by Khwilo W. Kabaka. Find me on [Twitter](https://twitter.com/Khwilo). Open issues are welcomed.

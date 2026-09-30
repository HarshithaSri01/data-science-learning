# Vector Databases

## What is a Vector Database?

A vector database is a database designed to store and search numerical vectors called embeddings.

It is commonly used in AI applications for finding information based on semantic similarity.

## Why do we need Vector Databases?

Traditional databases usually search using exact values or keywords.

Vector databases can search based on the meaning of the data.

For example:

Question:

"What is the capital of India?"

A vector database can retrieve a document containing:

"New Delhi is the capital city of India."

Even though the words are not exactly the same, their meanings are similar.

## How Vector Search Works

Text
↓
Embedding Model
↓
Vector
↓
Vector Database
↓
Similarity Search
↓
Relevant Documents

## Vector Databases in RAG

A typical RAG system uses a vector database to store document embeddings.

When a user asks a question:

1. The question is converted into an embedding.
2. The vector database searches for similar vectors.
3. The most relevant document chunks are retrieved.
4. The retrieved context is passed to the LLM.
5. The LLM generates the final answer.

## Examples of Vector Databases

- ChromaDB
- FAISS
- Pinecone
- Weaviate
- Milvus

## Similarity Search

Vector databases commonly use similarity measures to determine how close two vectors are.

Common methods include:

- Cosine Similarity
- Euclidean Distance
- Dot Product

## Example

Suppose a document contains:

"Python is widely used for machine learning."

A user asks:

"Which programming language is commonly used in ML?"

The two sentences use different words but have similar meanings.

Their embeddings can therefore be close in vector space, allowing the relevant document to be retrieved.

## Key Point

A vector database stores embeddings and enables fast semantic similarity search.

It is an important component of many RAG and AI applications.

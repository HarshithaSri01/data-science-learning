# Embeddings

## What are Embeddings?

Embeddings are numerical representations of data such as text, images, or other information.

They represent the meaning and relationships between pieces of data in a form that machine learning models can process.

## Example

Consider these two sentences:

- "I love machine learning."
- "Machine learning is my favorite field."

Although the words are different, their meanings are similar.

An embedding model converts them into vectors that are close to each other in vector space.

## How Embeddings Work

Text
↓
Embedding Model
↓
Vector
↓
Store in Vector Database
↓
Similarity Search

## Why are Embeddings Used?

Embeddings are commonly used for:

- Semantic search
- RAG applications
- Document retrieval
- Recommendation systems
- Text similarity
- Clustering
- Question answering

## Embeddings in RAG

In a RAG system, documents are first divided into smaller chunks.

Each chunk is converted into an embedding.

The embeddings are stored in a vector database.

When the user asks a question, the question is also converted into an embedding.

The system then searches for the most similar document chunks.

## Example

Document chunk:

"Machine learning is a subset of artificial intelligence."

Question:

"What is machine learning?"

The embedding of the question is compared with the embeddings of document chunks.

The most semantically similar chunks are retrieved and passed to the LLM.

## Common Embedding Models

Some commonly used embedding models include:

- Sentence Transformers
- OpenAI Embeddings
- BGE Embeddings
- E5 Embeddings

## Key Point

Embeddings convert information into vectors so that machines can compare the semantic meaning of different pieces of data.

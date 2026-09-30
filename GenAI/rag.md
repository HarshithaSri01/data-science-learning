# Retrieval-Augmented Generation (RAG)

## What is RAG?

RAG stands for Retrieval-Augmented Generation.

It is a technique that combines information retrieval with a Large Language Model (LLM).

Instead of relying only on the knowledge stored in the LLM, RAG retrieves relevant information from an external knowledge source and provides it to the LLM to generate a more accurate response.

## Basic RAG Workflow

User Question
↓
Convert question into an embedding
↓
Search the vector database
↓
Retrieve relevant documents/chunks
↓
Pass retrieved context to the LLM
↓
Generate the final answer

## Main Components

### 1. Documents
The original knowledge sources such as PDFs, websites, or text files.

### 2. Chunking
Large documents are divided into smaller pieces called chunks.

### 3. Embeddings
Text chunks are converted into numerical vectors that represent their meaning.

### 4. Vector Database
Stores embeddings and helps retrieve semantically similar information.

Examples:
- ChromaDB
- FAISS
- Pinecone

### 5. Retriever
Finds the most relevant chunks based on the user's question.

### 6. LLM
Uses the retrieved context to generate the final response.

## Why use RAG?

RAG is useful when:

- The information is not available in the LLM's training data.
- We need answers based on private documents.
- We want to reduce unsupported or hallucinated answers.
- The knowledge source changes frequently.

## RAG vs Traditional LLM

| Traditional LLM | RAG |
|---|---|
| Relies mainly on learned knowledge | Uses external knowledge |
| May not know private documents | Can answer from private documents |
| Knowledge can become outdated | External knowledge can be updated |
| No retrieval step | Retrieves relevant context |

## Example

A user uploads a research paper and asks:

"What methodology was used in this paper?"

RAG retrieves the relevant sections of the paper and provides them as context to the LLM.

The LLM then generates an answer based on that retrieved context.

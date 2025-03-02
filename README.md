# Sutra-DB Blog

A modern blog application built with EdgeDB as the database backend.

## Overview

Sutra-DB Blog is a full-stack blog application that uses EdgeDB for data storage and management. The application allows you to create, manage, and publish blog posts with features like tagging, draft/published status tracking, and more.

## Database Schema

The application uses EdgeDB with the following schema:

### BlogPost

The main content type for blog entries:

- `title` (required): The title of the blog post
- `slug` (required): URL-friendly identifier for the post (must be unique)
- `content` (required): The main content of the blog post
- `description`: A short summary of the post
- `status`: Publication status (defaults to 'draft')
- `created`: Timestamp when the post was created
- `published`: Timestamp when the post was published
- `updated`: Timestamp when the post was last updated
- `tags`: Relationship to Tag objects

### Tag

Used to categorize blog posts:

- `name` (required): The name of the tag
- `posts`: Relationship to BlogPost objects

## Setup Instructions

### Prerequisites

- [EdgeDB](https://www.geldata.com) (latest version)
- Node.js (v16 or higher)

### Installation

1. Clone the repository:

   ```
   git clone https://github.com/brgv-code/sutra-db.git
   cd sutra-db
   ```

2. Initialize EdgeDB (if not already done):

   ```
   edgedb project init
   ```

3. Apply the schema:

   ```
   edgedb migration create
   edgedb migrate
   ```

4. Install dependencies:

   ```
   npm install
   ```

5. Start the development server:
   ```
   npm run dev
   ```

## Usage

### Managing Blog Posts

You can create, update, and delete blog posts through the application interface or directly using EdgeDB queries.

Example EdgeDB query to create a new blog post:

```edgeql
INSERT BlogPost {
  title := 'My First Blog Post',
  slug := 'my-first-blog-post',
  content := 'This is the content of my first blog post.',
  description := 'A short introduction to my blog',
  status := 'published',
  created := datetime_current(),
  published := datetime_current()
};
```

### Working with Tags

Tags can be created and associated with blog posts:

```edgeql
WITH
  new_tag := (INSERT Tag {
    name := 'Technology'
  })
INSERT BlogPost {
  title := 'EdgeDB Introduction',
  slug := 'edgedb-introduction',
  content := 'EdgeDB is a next-generation graph-relational database...',
  tags := {new_tag}
};
```

## Development

### Schema Modifications

To modify the database schema:

1. Edit the schema files in the `dbschema` directory
2. Create a migration:
   ```
   edgedb migration create
   ```
3. Apply the migration:
   ```
   edgedb migrate
   ```

## License

[MIT License](LICENSE)

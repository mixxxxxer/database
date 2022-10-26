# Single Table Design Recipe Template

_Copy this recipe template to design and create a database table from a specification._

## 1. Extract nouns from the user stories or specification

```
As a blogger
So I can write interesting stuff
I want to write posts having a title.

As a blogger
So I can write interesting stuff
I want to write posts having a content.

As a blogger
So I can let people comment on interesting stuff
I want to allow comments on my posts.

As a blogger
So I can let people comment on interesting stuff
I want the comments to have a content.

As a blogger
So I can let people comment on interesting stuff
I want the author to include their name in comments.
```

```
Nouns:

posts, title, content
comments, content, author

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| Record                | Properties          |
| --------------------- | ------------------  |
| post                  | title, content

Name of the table (always plural): `posts` 

Column names: `title`, `content`


| Record                | Properties          |
| --------------------- | ------------------  |
| comment               | author, content, post_id

Name of the table (always plural): `comments` 

Column names: `author`, `content`, post_id

## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

```
# EXAMPLE:
# table posts
id: SERIAL
title: text
content: text

# table comments
id: SERIAL
author: text
content: text
post_if: int
```

## 4. Write the SQL.

```sql

-- file: movies.sql

CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  title text,
  content text
);

CREATE TABLE comments(
  id SERIAL PRIMARY KEY,
  author text,
  content text,
  post_id int,
  constraint fk_post foreign key(post_id)
    references posts(id) 
    on delete cascade 
);

```

## 5. Create the table.

```bash
psql -h 127.0.0.1 movies_directory < ./spec/movies_table.sql
```

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Fsingle_table_design_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Fsingle_table_design_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Fsingle_table_design_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Fsingle_table_design_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Fsingle_table_design_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->
TRUNCATE TABLE books RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO "books" ( "title", "author_name") VALUES
('Nineteen Eighty-Four', 'George Orwell'),
('Mrs Dalloway', 'Virginia Woolf'),
('Emma', 'Jane Austen'),
('Dracula', 'Bram Stoker'),
('The Age of Innocence', 'Edith Wharton');
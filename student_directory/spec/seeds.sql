TRUNCATE TABLE cohorts RESTART IDENTITY CASCADE;


INSERT INTO "cohorts" ("name", "starting_date") VALUES
('Sep22', '01.09.2022'),
('Oct22', '01.10.2022'),
('Nov22', '01.11.2022');

INSERT INTO "students" ("name", "cohort_id") VALUES
('Mike', '1'),
('Nick', '2'),
('Sam', '3'),
('John', '1'),
('Sara', '1');

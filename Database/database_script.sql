--
-- Database : toDoList_databse
--
--
DROP TABLE IF EXISTS belongs_to;
DROP TABLE IF EXISTS Task;
DROP TABLE IF EXISTS Repository;
DROP TABLE IF EXISTS Category;

----- Structure of the 'Repository' table -----
CREATE TABLE Repository (
    id_repository BIGINT AUTO_INCREMENT NOT NULL,
    name_repository VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_repository)
);
-----------------------------------------------
-- Insert into the 'Repository' table
INSERT INTO Repository (name_repository) 
VALUES ('Personal Tasks');

----- Structure of the 'Task' table -----------
CREATE TABLE Task (
    id_task BIGINT AUTO_INCREMENT NOT NULL,
    name_task TEXT NOT NULL,
    state_task ENUM('done', 'in progress', 'not done') NOT NULL,
    deadline_task DATETIME,
    priority_task TINYINT NOT NULL CHECK (priority_task BETWEEN 1 AND 3),
    id_repository BIGINT NOT NULL,
    PRIMARY KEY (id_task),
    CONSTRAINT FK_Task_id_repository FOREIGN KEY (id_repository) 
        REFERENCES Repository (id_repository) ON DELETE CASCADE
);
----------------------------------------------
-- Insert into the 'Task' table
INSERT INTO Task (name_task, state_task, deadline_task, priority_task, id_repository) 
VALUES ('Clean the house', 'not done', '2025-04-10 10:00:00', 1, 1); -- id_repository = 1 (Personal Tasks)

INSERT INTO Task (name_task, state_task, deadline_task, priority_task, id_repository) 
VALUES ('Finish project report', 'in progress', '2025-04-15 17:00:00', 2, 1); -- id_repository = 2 (Work Tasks)

INSERT INTO Task (name_task, state_task, deadline_task, priority_task, id_repository) 
VALUES ('Buy groceries', 'not done', '2025-04-05 12:00:00', 3, 1); -- id_repository = 1 (Personal Tasks)

----- Structure of the 'Category' table ------
CREATE TABLE Category (
    id_category BIGINT AUTO_INCREMENT NOT NULL,
    name_category VARCHAR(255) NOT NULL,
    description_category TEXT,
    PRIMARY KEY (id_category)
);
----------------------------------------------
-- Insert into the 'Category' table
INSERT INTO Category (name_category, description_category) 
VALUES ('Household', 'Tasks related to household chores');

INSERT INTO Category (name_category, description_category) 
VALUES ('Work', 'Tasks related to professional work');

INSERT INTO Category (name_category, description_category) 
VALUES ('Groceries', 'Tasks related to grocery shopping');

----- Structure of the 'belongs_to' table ----
CREATE TABLE belongs_to (
    id_task BIGINT NOT NULL,
    id_category BIGINT NOT NULL,
    PRIMARY KEY (id_task, id_category),
    CONSTRAINT FK_belongs_to_id_task FOREIGN KEY (id_task) 
        REFERENCES Task (id_task) ON DELETE CASCADE,
    CONSTRAINT FK_belongs_to_id_category FOREIGN KEY (id_category) 
        REFERENCES Category (id_category) ON DELETE CASCADE
);
----------------------------------------------
-- Insert into the 'belongs_to' table
INSERT INTO belongs_to (id_task, id_category) 
VALUES (1, 1); 

INSERT INTO belongs_to (id_task, id_category) 
VALUES (2, 2); 

INSERT INTO belongs_to (id_task, id_category) 
VALUES (3, 3);

INSERT INTO belongs_to (id_task, id_category) 
VALUES (1, 3); 

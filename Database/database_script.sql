--
-- Database : toDoList_databse
--
--
----- Structure of the 'Repository' table -----
DROP TABLE IF EXISTS Repository;
CREATE TABLE Repository (
    id_repository BIGINT AUTO_INCREMENT NOT NULL,
    name_repository VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_repository)
);
-----------------------------------------------

----- Structure of the 'Task' table -----------
DROP TABLE IF EXISTS Task;
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

----- Structure of the 'Category' table ------
DROP TABLE IF EXISTS Category;
CREATE TABLE Category (
    id_category BIGINT AUTO_INCREMENT NOT NULL,
    name_category VARCHAR(255) NOT NULL,
    description_category TEXT,
    PRIMARY KEY (id_category)
);
----------------------------------------------

----- Structure of the 'belongs_to' table ----
DROP TABLE IF EXISTS belongs_to;
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
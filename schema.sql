-- Create the database employees and specified it for use.
CREATE DATABASE employeedirectory;
USE employeedirectory;

-- Create the table employees.
CREATE TABLE employees
(
    PRIMARY KEY
  (id),
  id int
  AUTO_INCREMENT,
  first_name varchar
  (30) NOT NULL,
  last_name varchar
  (30) NOT NULL,
    role_id int
  (30) NOT NULL,
  manager_id varchar
  (30) NOT NULL,

);
-- Create the table of roles.
CREATE TABLE roles
(
  PRIMARY KEY
  (id),
  title varchar
  (30) NOT NULL,
  salary int NOT NULL,
  department_id int
  NOT NULL
);

-- Create the table of departments.
CREATE TABLE departments
(
  PRIMARY KEY
  (id),
  department VARCHAR (30) NOT NULL
);
  -- Insert a set of records.
  INSERT INTO employees
    (first_name, last_name, role_id, manager_id)
  VALUES
    ("John", "Doe", 1, "Ashley Rodriguez");
  INSERT INTO employees
    (first_name, last_name, role_id, manager_id)
  VALUES
    ("Mike", "Chan", 2, "John Doe");
  INSERT INTO employees
    (first_name, last_name, role_id, manager_id)
  VALUES
    ("Ashley", "Rodriguez", 3, "Null");
  INSERT INTO employees
    (first_name, last_name, role_id, manager_id)
  VALUES
    ("Kevin", "Tupik", 4, "Ashley Rodriguez");
  INSERT INTO employees
    (first_name, last_name, role_id, manager_id)
  VALUES
    ("Malia", "Brown", 5, "Null");
  INSERT INTO employees
    (first_name, last_name, role_id, manager_id)
  VALUES
    ("Sarah", "Lourd", 6, "Null");
  INSERT INTO employees
    (first_name, last_name, role_id, manager_id)
  VALUES
    ("Tom", "Allen", 7, "Sarah Lourd");
  INSERT INTO employees
    (first_name, last_name, role_id, manager_id)
  VALUES
    ("Christian", "Eckenrode", 8, "Mike Chan");

-- Insert in the roles
  INSERT INTO roles
    (role_id, title, salary, department_id)
  VALUES
    (1, "Sales Lead", 100000, 1);
  INSERT INTO roles
    (role_id, title, salary, department_id)
  VALUES
    (2, "Salesperson", 80000, 1);
  INSERT INTO roles
    (role_id, title, salary, department_id)
  VALUES
    (3, "Lead Engineer", 150000, 2);
  INSERT INTO roles
    (role_id, title, salary, department_id)
  VALUES
    (4, "Software Engineer", 120000, 2);
  INSERT INTO roles
    (role_id, title, salary, department_id)
  VALUES
    (5, "Accountant", 125000, 3);
  INSERT INTO roles
    (role_id, title, salary, department_id)
  VALUES
    (6, "Legal Team Lead", 250000, 4);
  INSERT INTO roles
    (role_id, title, salary, department_id)
  VALUES
    (7, "Lawyer", 190000, 4);
  INSERT INTO roles
    (role_id, title, salary, department_id)
  VALUES
    (8, "Lead Engineer", 190000, 2);

-- Insert a set of departments.
  INSERT INTO departments
    (id, department)
  VALUES
    (1, "Sales");
   INSERT INTO departments
    (id, department)
  VALUES
    (2, "Engineering"); 
   INSERT INTO departments
    (id, department)
  VALUES
    (3, "Finance");   

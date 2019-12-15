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
  
  role_id INT,
  title varchar
  (30) NOT NULL,
  salary int NOT NULL,
  department varchar (30)
  NOT NULL
);

-- Create the table of departments.
CREATE TABLE departments
(
  PRIMARY KEY
  (department_id),
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
    (role_id, title, salary, department)
  VALUES
    (1, "Sales Lead", 100000, "Sales");
  INSERT INTO roles
    (role_id, title, salary, department)
  VALUES
    (2, "Salesperson", 80000, "Sales");
  INSERT INTO roles
    (role_id, title, salary, department)
  VALUES
    (3, "Lead Engineer", 150000, "Engineering");
  INSERT INTO roles
    (role_id, title, salary, department)
  VALUES
    (4, "Software Engineer", 120000, "Engineering");
  INSERT INTO roles
    (role_id, title, salary, department)
  VALUES
    (5, "Accountant", 125000, "Finance");
  INSERT INTO roles
    (role_id, title, salary, department)
  VALUES
    (6, "Legal Team Lead", 250000, "Legal");
  INSERT INTO roles
    (role_id, title, salary, department)
  VALUES
    (7, "Lawyer", 190000, "Legal");
  INSERT INTO roles
    (role_id, title, salary, department)
  VALUES
    (8, "Lead Engineer", 190000, "Engineering");

-- Insert a set of departments.
  INSERT INTO departments
    (department_id, department)
  VALUES
    (1, "Sales");
   INSERT INTO departments
    (department_id, department)
  VALUES
    (2, "Engineering"); 
   INSERT INTO departments
    (department_id, department)
  VALUES
    (3, "Finance");   

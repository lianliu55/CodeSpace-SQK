/* 
1. Navigate to the following website: https://www.programiz.com/sql/online-compiler/
2. Copy and paste the create table and insert commands, given below, into the input screen and RUN SQL:
*/

drop table Customers;
drop table Orders;
drop table Shippings;

-- Create the 'employee' table
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    hire_date DATE,
    salary DECIMAL(10, 2)
);

-- Create the 'department' table
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Create the 'product' table
CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT
);

-- Create the 'purchase' table
CREATE TABLE purchase (
    order_id INT PRIMARY KEY,
    employee_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Insert data into the 'employee' table
INSERT INTO employee VALUES
(1, 'John Doe', 1, '2022-01-01', 50000.00),
(2, 'Jane Smith', 2, '2022-02-15', 60000.00),
(3, 'Bob Johnson', 1, '2022-03-20', 55000.00),
(4, 'Alice Brown', 4, '2022-04-10', 70000.00),
(5, 'Charlie Wilson', 2, '2022-05-05', 65000.00);

-- Insert data into the 'department' table
INSERT INTO department VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Sales'),
(4, 'IT'),
(5, 'Marketing');

-- Insert data into the 'product' table
INSERT INTO product VALUES
(1, 'Laptop', 1200.00, 50),
(2, 'Smartphone', 800.00, 100),
(3, 'Printer', 200.00, 30),
(4, 'Desk Chair', 150.00, 20),
(5, 'Coffee Maker', 50.00, 10);

-- Insert data into the 'purchase' table
INSERT INTO purchase VALUES
(1, 1, 2, '2023-01-05', 3),
(2, 3, 1, '2023-02-10', 2),
(3, 2, 3, '2023-03-15', 1),
(4, 4, 5, '2023-04-20', 4),
(5, 5, 4, '2023-05-25', 2);

/* 
Solve the queries asked for, take screenshots and save them. Remember to take a copy of your SQL code as well. 
These should be placed in a word or PDF document with the heading "SQL Project". 
These are not used for assessment, but can be used as supporting evidence when applying for out boot-camp. 
*/

-- 1. Select all columns from the employee table
Select  * from employee;

-- 2. Select unique department names from the 'department' table
Select distinct department_name from department;

-- 3. Select employee names and salaries from the 'employeee' table, ordered by salary in descending order
Select employee_name, salary from employee
order by salary desc;

-- 4. Select products with a price between £100 and £500 from the 'product table
Select product_name, price from product
where price >= 100 and price <= 500;

-- 5. Select orders made by employees in the 'IT' department by joining 'purchase' and 'employee' tables
Select order_id, order_date, employee_name from purchase
join employee
on purchase.employee_id = employee.employee_id
where employee.department_id = 4;

-- 6. Select products with names containing 'Chair' using a wildcard
Select * from product
where product_name like '%Chair';

-- 7. Select orders made by employees with IDs 1, 3, and 5
Select * from purchase
where employee_id in ('1', '3', '5');

-- 8. Select the average salary of all employees
Select AVG(salary)
from employee;

-- 9. Select employees hired after '2022-03-01' with a salary greater than £60000
Select * from employee
where hire_date >= '2022-03-01' and salary >= 60000;

--10. Select departments with more than 1 employee, counting the number of employees in each department
Select
    department.department_id,
    department_name,
    COUNT(employee.department_id) as num_employees
from department
join employee
on employee.department_id = department.department_id
group by department.department_id
having num_employees > 1;


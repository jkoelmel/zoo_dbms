-- -------------------------------------------
-- Script Name: Tests.sql
-- Author:      Jarett Koelmel
-- Purpose: 	Test the integrity of the DBMS
-- --------------------------------------------
USE zoomanagementdb;

-- Requests
UPDATE Requests SET requests_id = 6 WHERE vendor = 1;
DELETE FROM Requests WHERE vendor = 2;

-- Ships
UPDATE Ships SET ships_id = 5 WHERE shipment = 2;
DELETE FROM Ships WHERE item = 2;

-- Shipment
UPDATE Shipment SET shipment_id = 10 WHERE shipment_id =2;
DELETE FROM Shipment WHERE shipment_id = 1;

-- Sells
UPDATE Sells SET sells_id = 5 WHERE vendor = 2;
DELETE FROM Sells WHERE item = 3;

-- Vendor
UPDATE Vendor SET vendor_id = 11 WHERE vendor_id = 3;
-- 1. Error in Vendor DELETE 
	-- Query: DELETE FROM Vendor WHERE vendor_id = 1;
    -- Error: Cannot delete or update a parent row. FK constraint fails

-- Contains
UPDATE Contains SET contains_id = 7 WHERE inventory = 1;
DELETE FROM Contains WHERE item = 2;

-- Item
UPDATE Item SET item_id = 6 WHERE item_id = 2;
DELETE FROM Item WHERE item_id = 1;

-- Inventory
UPDATE Inventory SET inventory_id = 34 WHERE inventory_id = 1;
DELETE FROM Inventory WHERE inventory_id = 2;

-- Generates
UPDATE Generates SET generates_id = 23 WHERE shop = 1;
DELETE FROM Generates WHERE shop = 2;

-- Oversees
UPDATE Oversees SET oversees_id = 64 WHERE budget = 1;
DELETE FROM Oversees WHERE revenue = 3;

-- Expense
UPDATE Expense SET expense_id = 77 WHERE expense_id = 1;
DELETE FROM Expense WHERE expense_id = 2;

-- Manages
UPDATE Manages SET manages_id = 23 WHERE accountant = 1;
DELETE FROM Manages WHERE accountant = 2;

-- Budget
UPDATE Budget SET budget_id = 11 WHERE budget_id = 1;
DELETE FROM Budget WHERE budget_id = 2;

-- Accountant
UPDATE Accountant SET accountant_id = 56 WHERE accountant_id = 1;
DELETE FROM Accountant WHERE accountant_id = 2;

-- Shops
UPDATE Shops SET shops_id = 5 WHERE visitor = 1;
DELETE FROM Shops WHERE shop = 3;

-- Shop
UPDATE Shop SET shop_id = 54 WHERE shop_id = 2;
-- 2. Error in Shop DELETE
	-- Query: DELETE FROM Shop WHERE shop_id = 1;
    -- Error: Cannot delete or update a parent row. FK constraint fails

-- Attends
UPDATE Attends SET attends_id = 47 WHERE shows = 1;
DELETE FROM Attends WHERE tour = 1;

-- Tour
UPDATE Tour SET tour_id = 42 WHERE date = 1;
DELETE FROM Tour WHERE time_slot = 3;

-- Shows
UPDATE Shows SET show_id = 33 WHERE show_id = 1;
-- 3. Error in Shows DELETE
	-- Query: DELETE FROM Shop WHERE shop_id = 1;
    -- Error: Cannot delete or update a parent row. FK constraint fails

-- Time Slot
UPDATE Time_Slot SET time_slot_id = 55 WHERE time_slot_id = 1;
-- 4. Error in Time SLot DELETE
	-- Query: DELETE FROM Time_Slot WHERE time_slot_id = 2;
	-- Error: Cannot delete or update a parent row. FK constraint fails
    
-- Date
UPDATE Date SET date_id = 11 WHERE date_id = 1;
-- 5. Error in Date DELETE
	-- Query: DELETE FROM Date WHERE date_id = 2;
    -- Error: Cannot delete or update a parent row. FK constraint fails

-- Assigned 
UPDATE Assigned SET assigned_id = 53 WHERE animal = 1;
DELETE FROM Assigned WHERE animal = 3;

-- Medicine
UPDATE Medicine SET medicine_id = 13 WHERE medicine_id = 1;
DELETE FROM Medicine WHERE medicine_id = 2;

-- Diet
UPDATE Diet SET diet_id = 98 WHERE diet_id = 2;
DELETE FROM Diet WHERE diet_id = 3;

-- Habitat
UPDATE Habitat SET habitat_id = 33 WHERE habitat_id = 1;
DELETE FROM Habitat WHERE area = 2;

-- Maintains
UPDATE Maintains SET maintains_id = 55 WHERE area = 1;
DELETE FROM Maintains WHERE zookeeper = 3;

-- Area
UPDATE Area SET area_id = 43 WHERE area_id = 1;
DELETE FROM Area WHERE name = "Not Sea World";

-- Trains
UPDATE Trains SET trains_id = 80 WHERE trainer = 3;
DELETE FROM Trains WHERE animal = 1;

-- Cares
UPDATE Cares SET cares_id = 54 WHERE veterinarian = 2;
DELETE FROM Cares WHERE animal = 3;

-- Animal
UPDATE Animal SET animal_id = 44 WHERE name = "Slippy";
DELETE FROM Animal WHERE name = "Bitey";

-- Zookeeper
UPDATE Zookeeper SET zookeeper_id = 33 WHERE employee = 23;
DELETE FROM Zookeeper WHERE employee = 7;

-- Trainer
UPDATE Trainer SET trainer_id = 5 WHERE employee = 4;
DELETE FROM Trainer WHERE employee = 6;

-- Veterinarian
UPDATE Veterinarian SET vet_id = 5 WHERE employee = 3;
DELETE FROM Veterinarian WHERE vet_id = 2;

-- Log
UPDATE Log SET log_id = 7 WHERE visitor = 1;
DELETE FROM Log WHERE log_id = 4;
SELECT * FROM attendance;
-- Attendance
UPDATE Attendance SET attendance_id = 6 WHERE attendance_id = 2;
-- 6. Error in Attendance DELETE
	-- Query: DELETE FROM Attendance WHERE attendance_id = 1;
    -- Error: 1451 Cannot delete or update a parent row. FK constraint fails

-- Pays
UPDATE Pays SET pays_id = 7 WHERE visitor = 5;
DELETE FROM Pays WHERE payment = 3;

-- Revenue
UPDATE Revenue SET revenue_id = 12 WHERE revenue_id = 1;
DELETE FROM Revenue WHERE revenue_id = 5;

-- Visitor
UPDATE Visitor SET visitor_id = 6 WHERE visitor_id = 1;
-- 7. Error in Visitor DELETE
	-- Query: DELETE FROM Visitor WHERE visitor_id = 3;
    -- Error: 1451 Cannot delete or update a parent row. FK constraint fails

-- Payment
-- 8. Error in Payment UPDATE
	-- Query: UPDATE Payment SET payment_id = 7 WHERE payment_id = 1;
    -- Error: 1451 Cannot delete or update a parent row. FK constraint fails
-- 9. Error in Payment DELETE
	-- Query: DELETE FROM Payment WHERE payment_id = 2;
    -- Error: 1451 Cannot delete or update a parent row. FK constraint fails

-- Radio
UPDATE Radio SET radio_id = 6 WHERE serial_number = "asdfads23423";
DELETE FROM Radio WHERE radio_id = 5;

-- Salary Worker
UPDATE Salary_Worker SET salary_worker_id = 5 WHERE salary_worker_id = 1;
DELETE FROM Salary_Worker WHERE salary_worker_id = 2;

-- Hourly_Worker
UPDATE Hourly_Worker SET hourly_worker_id = 43 WHERE hourly_worker_id = 1;
DELETE FROM Hourly_Worker WHERE hourly_worker_id = 2;

-- Executive
UPDATE Executive SET executive_id = 10 WHERE department = 1;
DELETE FROM Executive WHERE department = 5;

-- Member
UPDATE Member SET member_id = 15 WHERE user = 6;
DELETE FROM Member WHERE member_id = 2;

-- Employs
UPDATE Employs SET employs_id = 23 WHERE company = 5;
DELETE FROM Employs WHERE company = 3;

-- Employee
UPDATE Employee SET employee_id = 23 WHERE employee_id = 1;
DELETE FROM Employee WHERE employee_id = 5;

-- Manager
UPDATE Manager SET manager_id = 10 WHERE employee = 1;
DELETE FROM Manager WHERE manager_id = 5;

-- Department
UPDATE Department SET department_id = 7 WHERE department_id = 1;
DELETE FROM Department WHERE department_id = 2;

-- Phone Number
UPDATE Phone_Number SET phone_id = 15 WHERE phone_id = 1;
DELETE FROM Phone_Number WHERE phone_id = 2;

-- Address
UPDATE Address SET address_id = 10 WHERE address_id = 1;
DELETE FROM Address WHERE address_id = 2;

-- Company
UPDATE Company SET company_id = 9 WHERE company_name = "Reddit";
DELETE FROM Company WHERE company_id = 4;

-- Account 
UPDATE Account SET account_id = 6 WHERE account_id = 1;
DELETE FROM Account WHERE user = 2;

-- User
UPDATE User SET user_id = 12 WHERE user_id = 1;
DELETE FROM User WHERE user_id = 3;

-- EOF
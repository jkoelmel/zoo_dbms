-- ------------------------------------------------------
-- Script Name: INSERTS.SQL 
-- Author:      Jarett Koelmel
-- Purporse:    Insert smaple data to test integrity of DBMS 
-- -------------------------------------------------------

USE ZooManagementDB;

-- User
INSERT INTO user(user_id, f_name, l_name, email, DOB) VALUES (null, "John", "Smith", "jsmith@gmail.com", "1988-10-24");
INSERT INTO user(user_id, f_name, l_name, email, DOB) VALUES (null, "Jane", "Doe", "jdoe@gmail.com", "1986-11-11");
INSERT INTO user(user_id, f_name, l_name, email, DOB) VALUES (null, "Blake", "Griffin", "bgriffin@gmail.com", "1943-05-01");
INSERT INTO user(user_id, f_name, l_name, email, DOB) VALUES (null, "Michael", "Scott", "mgscott@gmail.com", "1964-06-28");
INSERT INTO user(user_id, f_name, l_name, email, DOB) VALUES (null, "Jack", "Bauer", "notaspy@gmail.com", "1975-09-14");
INSERT INTO user(user_id, f_name, l_name, email, DOB) VALUES (null, "Jamie", "Barkley", "jbark@gmail.com", "1955-01-25");
INSERT INTO user(user_id, f_name, l_name, email, DOB) VALUES (null, "Devin", "Shawn", "dshawn@gmail.com", "1988-07-13");
INSERT INTO user(user_id, f_name, l_name, email, DOB) VALUES (null, "Keanu", "Reeves", "kreeves@gmail.com", "1992-08-30");

-- Account
INSERT INTO account(account_id, password, username, user) VALUES(null, "test_password", "test_user", 1);
INSERT INTO account(account_id, password, username, user) VALUES(null, "test_password", "test_user2", 2);
INSERT INTO account(account_id, password, username, user) VALUES(null, "test_password", "test_user3", 3);
INSERT INTO account(account_id, password, username, user) VALUES(null, "test_password", "test_user4", 4);
INSERT INTO account(account_id, password, username, user) VALUES(null, "test_password", "test_user5", 5);

-- Company
INSERT INTO company(company_id, company_name, num_employees) VALUES(null, "Umbrella Corp", 500);
INSERT INTO company(company_id, company_name, num_employees) VALUES(null, "Reddit", 145);
INSERT INTO company(company_id, company_name, num_employees) VALUES(null, "Facebook", 235);
INSERT INTO company(company_id, company_name, num_employees) VALUES(null, "Google", 3432);
INSERT INTO company(company_id, company_name, num_employees) VALUES(null, "Microsoft", 432);

-- Address
INSERT INTO address(address_id, house_number, street_name, city, state, zipcode, user, company) VALUES(null, 101, "Lake Shore Drive", "San Francisco", "CA", 94123, null, 1);
INSERT INTO address(address_id, house_number, street_name, city, state, zipcode, user, company) VALUES(null, 666, "Highway to Hell", "Oakland", "CA", 94501, null, 2);
INSERT INTO address(address_id, house_number, street_name, city, state, zipcode, user, company) VALUES(null, 101, "A Street", "New York City", "NY", 00551, 1, null);
INSERT INTO address(address_id, house_number, street_name, city, state, zipcode, user, company) VALUES(null, 101, "San Pablo Rd", "Richmond", "CA", 94423, 2, null);
INSERT INTO address(address_id, house_number, street_name, city, state, zipcode, user, company) VALUES(null, 101, "Davis Dr", "David", "CA", 95423, null, 3);

-- Phone_Number
INSERT INTO phone_number(phone_id, country_code, area_code, phone_number, user, company) VALUES (null, 1, 510, 5551234, 1, null);
INSERT INTO phone_number(phone_id, country_code, area_code, phone_number, user, company) VALUES (null, 1, 925, 5551534, 2, null);
INSERT INTO phone_number(phone_id, country_code, area_code, phone_number, user, company) VALUES (null, 1, 925, 5551734, null, 1);
INSERT INTO phone_number(phone_id, country_code, area_code, phone_number, user, company) VALUES (null, 1, 925, 5551834, null, 2);
INSERT INTO phone_number(phone_id, country_code, area_code, phone_number, user, company) VALUES (null, 1, 510, 5551934, null, 3);

-- Department
INSERT INTO department(department_id, dept_name, executive, company) VALUES(null, "Veterinary", null, 1);
INSERT INTO department(department_id, dept_name, executive, company) VALUES(null, "Groundskeeping", null, 2);
INSERT INTO department(department_id, dept_name, executive, company) VALUES(null, "Management", null, 3);
INSERT INTO department(department_id, dept_name, executive, company) VALUES(null, "Accounting", null, 4);
INSERT INTO department(department_id, dept_name, executive, company) VALUES(null, "Development", null, 5);

-- Employee
INSERT INTO employee(employee_id, role, dept_id, manager, user) VALUES(null, "veterinarian", 1, null, 1);
INSERT INTO employee(employee_id, role, dept_id, manager, user) VALUES(null, "veterinarian", 2, null, 2);
INSERT INTO employee(employee_id, role, dept_id, manager, user) VALUES(null, "veterinarian", 3, null, 3);
INSERT INTO employee(employee_id, role, dept_id, manager, user) VALUES(null, "veterinarian", 4, null, 4);
INSERT INTO employee(employee_id, role, dept_id, manager, user) VALUES(null, "veterinarian", 5, null, 5);
INSERT INTO employee(employee_id, role, dept_id, manager, user) VALUES(null, "veterinarian", 1, null, 6);
INSERT INTO employee(employee_id, role, dept_id, manager, user) VALUES(null, "veterinarian", 2, null, 7);
INSERT INTO employee(employee_id, role, dept_id, manager, user) VALUES(null, "veterinarian", 3, null, 8);
INSERT INTO employee(employee_id, role, dept_id, manager, user) VALUES(null, "zookeeper", 2, null, 4);

-- Manager 
INSERT INTO manager(manager_id, employee, department) VALUES(null, 1, 1);
INSERT INTO manager(manager_id, employee, department) VALUES(null, 2, 2);
INSERT INTO manager(manager_id, employee, department) VALUES(null, 3, 3);
INSERT INTO manager(manager_id, employee, department) VALUES(null, 4, 4);
INSERT INTO manager(manager_id, employee, department) VALUES(null, 5, 5);

-- Employs
INSERT INTO employs(employs_id, company, employee) VALUES(null, 1, 5);
INSERT INTO employs(employs_id, company, employee) VALUES(null, 2, 4);
INSERT INTO employs(employs_id, company, employee) VALUES(null, 3, 3);
INSERT INTO employs(employs_id, company, employee) VALUES(null, 4, 2);
INSERT INTO employs(employs_id, company, employee) VALUES(null, 5, 1);

-- Member
INSERT INTO member(member_id, user) VALUES(null, 6);
INSERT INTO member(member_id, user) VALUES(null, 7);
INSERT INTO member(member_id, user) VALUES(null, 8);

-- Executive
INSERT INTO executive(executive_id, department) VALUES(null, 1);
INSERT INTO executive(executive_id, department) VALUES(null, 2);
INSERT INTO executive(executive_id, department) VALUES(null, 3);
INSERT INTO executive(executive_id, department) VALUES(null, 4);
INSERT INTO executive(executive_id, department) VALUES(null, 5);

-- Hourly Worker
INSERT INTO hourly_worker(hourly_worker_id, hours_current, hours_total, hourly_rate, employee) VALUES(null, 23, 435, 15, 1);
INSERT INTO hourly_worker(hourly_worker_id, hours_current, hours_total, hourly_rate, employee) VALUES(null, 29, 545, 25, 2);
INSERT INTO hourly_worker(hourly_worker_id, hours_current, hours_total, hourly_rate, employee) VALUES(null, 15, 675, 20, 3);
INSERT INTO hourly_worker(hourly_worker_id, hours_current, hours_total, hourly_rate, employee) VALUES(null, 16, 475, 18, 4);
INSERT INTO hourly_worker(hourly_worker_id, hours_current, hours_total, hourly_rate, employee) VALUES(null, 25, 125, 15, 5);

-- Salary Worker
INSERT INTO salary_worker(salary_worker_id, annual_salary, monthly_wage, hours_total, employee) VALUES(null, 75000, annual_salary / 12, 150, 6);
INSERT INTO salary_worker(salary_worker_id, annual_salary, monthly_wage, hours_total, employee) VALUES(null, 85000, annual_salary / 12, 254, 7);
INSERT INTO salary_worker(salary_worker_id, annual_salary, monthly_wage, hours_total, employee) VALUES(null, 100000, annual_salary / 12, 199, 8);

-- Radio
INSERT INTO radio(radio_id, serial_number, employee) VALUES(null, "asdfads23423", null);
INSERT INTO radio(radio_id, serial_number, employee) VALUES(null, "asdfads21123", null);
INSERT INTO radio(radio_id, serial_number, employee) VALUES(null, "asdfads27623", null);
INSERT INTO radio(radio_id, serial_number, employee) VALUES(null, "asdfads26523", null);
INSERT INTO radio(radio_id, serial_number, employee) VALUES(null, "asdfads29823", null);

-- Payment
INSERT INTO payment(payment_id, payment_type, card_number, routing_number, bank_account, member) VALUES(null, "Debit", 987432421, null, null, 1);
INSERT INTO payment(payment_id, payment_type, card_number, routing_number, bank_account, member) VALUES(null, "Debit", 234567890, null, null, 2);
INSERT INTO payment(payment_id, payment_type, card_number, routing_number, bank_account, member) VALUES(null, "Debit", 876545673, null, null, 3);

-- Visitor
INSERT INTO visitor(visitor_id, f_name, l_name, age, zip_code, party_size) VALUES(null, "John", "Darko", 34, 94523, 1);
INSERT INTO visitor(visitor_id, f_name, l_name, age, zip_code, party_size) VALUES(null, "Jackie", "Stromboli", 23, 94543, 2);
INSERT INTO visitor(visitor_id, f_name, l_name, age, zip_code, party_size) VALUES(null, "Will", "Smith", 54, 94545, 5);
INSERT INTO visitor(visitor_id, f_name, l_name, age, zip_code, party_size) VALUES(null, "Edna", "Forstner", 39, 94565, 4);
INSERT INTO visitor(visitor_id, f_name, l_name, age, zip_code, party_size) VALUES(null, "Flint", "Bernard", 43, 94511, 3);

-- Revenue
INSERT INTO revenue(revenue_id, date, amount) VALUES(null, current_date(), 125);
INSERT INTO revenue(revenue_id, date, amount) VALUES(null, current_date(), 295);
INSERT INTO revenue(revenue_id, date, amount) VALUES(null, current_date(), 234);
INSERT INTO revenue(revenue_id, date, amount) VALUES(null, current_date(), 34);
INSERT INTO revenue(revenue_id, date, amount) VALUES(null, current_date(), 50);

-- Pays
INSERT INTO pays(pays_id, payment, visitor, revenue) VALUES(null, 1, 1, 1);
INSERT INTO pays(pays_id, payment, visitor, revenue) VALUES(null, 2, 2, 2);
INSERT INTO pays(pays_id, payment, visitor, revenue) VALUES(null, 3, 3, 3);
INSERT INTO pays(pays_id, payment, visitor, revenue) VALUES(null, 1, 4, 4);
INSERT INTO pays(pays_id, payment, visitor, revenue) VALUES(null, 2, 5, 5);

-- Attendance
INSERT INTO attendance(attendance_id, date, total_attendance, total_child, total_adult, total_senior, new_membership) VALUES(null, ADDDATE(current_date(), INTERVAL -4 DAY), 45, 15, 15, 15, 0);
INSERT INTO attendance(attendance_id, date, total_attendance, total_child, total_adult, total_senior, new_membership) VALUES(null, ADDDATE(current_date(), INTERVAL -3 DAY), 45, 15, 15, 15, 0);
INSERT INTO attendance(attendance_id, date, total_attendance, total_child, total_adult, total_senior, new_membership) VALUES(null, ADDDATE(current_date(), INTERVAL -2 DAY), 45, 15, 15, 15, 0);
INSERT INTO attendance(attendance_id, date, total_attendance, total_child, total_adult, total_senior, new_membership) VALUES(null, ADDDATE(current_date(), INTERVAL -1 DAY), 45, 15, 15, 15, 0);
INSERT INTO attendance(attendance_id, date, total_attendance, total_child, total_adult, total_senior, new_membership) VALUES(null, current_date(), 45, 15, 15, 15, 0);

-- Log
INSERT INTO log(log_id, visitor, attendance) VALUES(null, 1, 1);
INSERT INTO log(log_id, visitor, attendance) VALUES(null, 2, 2);
INSERT INTO log(log_id, visitor, attendance) VALUES(null, 3, 3);
INSERT INTO log(log_id, visitor, attendance) VALUES(null, 4, 4);
INSERT INTO log(log_id, visitor, attendance) VALUES(null, 5, 5);

-- Veterinarian
INSERT INTO veterinarian(vet_id, employee) VALUES(null, 1);
INSERT INTO veterinarian(vet_id, employee) VALUES(null, 2);
INSERT INTO veterinarian(vet_id, employee) VALUES(null, 3);

-- Trainer
INSERT INTO trainer(trainer_id, employee) VALUES(null, 4);
INSERT INTO trainer(trainer_id, employee) VALUES(null, 5);
INSERT INTO trainer(trainer_id, employee) VALUES(null, 6);

-- Zookeeper
INSERT INTO zookeeper(zookeeper_id, role, employee) VALUES(null, "Maintenance", 7);
INSERT INTO zookeeper(zookeeper_id, role, employee) VALUES(null, "Maintenance", 8);
INSERT INTO zookeeper(zookeeper_id, role, employee) VALUES(null, "Maintenance", 9);

-- Animal
INSERT INTO animal(animal_id, name, DOB, DOD, age) VALUES(null, "Slippy", ADDDATE(current_date(), INTERVAL -2 DAY), null, null);
INSERT INTO animal(animal_id, name, DOB, DOD, age) VALUES(null, "Scratchy",  ADDDATE(current_date(), INTERVAL -1 DAY), null, null);
INSERT INTO animal(animal_id, name, DOB, DOD, age) VALUES(null, "Bitey", current_date(), null, null);

-- Cares
INSERT INTO cares(cares_id, veterinarian, animal) VALUES(null, 1, 1);
INSERT INTO cares(cares_id, veterinarian, animal) VALUES(null, 2, 2);
INSERT INTO cares(cares_id, veterinarian, animal) VALUES(null, 3, 3);

-- Trains 
INSERT INTO trains(trains_id, trainer, animal) VALUES(null, 1, 1);
INSERT INTO trains(trains_id, trainer, animal) VALUES(null, 2, 2);
INSERT INTO trains(trains_id, trainer, animal) VALUES(null, 3, 3);

-- Area
INSERT INTO area(area_id, name, size) VALUES(null, "Snake World", 150);
INSERT INTO area(area_id, name, size) VALUES(null, "Not Sea World", 225);
INSERT INTO area(area_id, name, size) VALUES(null, "Safari Land", 550);

-- Maintains
INSERT INTO maintains(maintains_id, area, zookeeper) VALUES(null, 1, 1);
INSERT INTO maintains(maintains_id, area, zookeeper) VALUES(null, 2, 2);
INSERT INTO maintains(maintains_id, area, zookeeper) VALUES(null, 3, 3);

-- Habitat
INSERT INTO habitat(habitat_id, size, land_type, capacity, area) VALUES(null, 75, "forest", 5, 1);
INSERT INTO habitat(habitat_id, size, land_type, capacity, area) VALUES(null, 75, "tundra", 7, 2);
INSERT INTO habitat(habitat_id, size, land_type, capacity, area) VALUES(null, 75, "desert", 10, 3);

-- Diet
INSERT INTO diet(diet_id, food, daily_amount, feeding_time) VALUES(null, "mice", 2, current_time());
INSERT INTO diet(diet_id, food, daily_amount, feeding_time) VALUES(null, "fish", 12, current_time());
INSERT INTO diet(diet_id, food, daily_amount, feeding_time) VALUES(null, "grass", 120, current_time());

-- Medicine
INSERT INTO medicine(medicine_id, otc_name, dosage, dosage_time) VALUES(null, "happy pills", 1, current_time());
INSERT INTO medicine(medicine_id, otc_name, dosage, dosage_time) VALUES(null, "sad pills", 4, current_time());
INSERT INTO medicine(medicine_id, otc_name, dosage, dosage_time) VALUES(null, "sleepy pills", 2, current_time());

-- Assigned
INSERT INTO assigned(assigned_id, animal, diet, medicine, habitat) VALUES( null, 1, 1, 1, 1);
INSERT INTO assigned(assigned_id, animal, diet, medicine, habitat) VALUES( null, 2, 2, 2, 2);
INSERT INTO assigned(assigned_id, animal, diet, medicine, habitat) VALUES( null, 3, 3, 3, 3);

-- Date
INSERT INTO date(date_id, date) VALUES(null,  ADDDATE(current_date(), INTERVAL -2 DAY));
INSERT INTO date(date_id, date) VALUES(null, ADDDATE(current_date(), INTERVAL -1 DAY));
INSERT INTO date(date_id, date) VALUES(null, current_date());

-- Time Slot
INSERT INTO time_slot(time_slot_id, time_slot) VALUES(null, current_time() - INTERVAL 2 HOUR);
INSERT INTO time_slot(time_slot_id, time_slot) VALUES(null, current_time() - INTERVAL 1 HOUR);
INSERT INTO time_slot(time_slot_id, time_slot) VALUES(null, current_time());

-- Show
INSERT INTO shows(show_id, name, capacity, available_slots, reserved, attendance, date, time_slot) VALUES(null, "Dolphins", 100, capacity - (reserved + attendance), 10, 20, 1, 1);
INSERT INTO shows(show_id, name, capacity, available_slots, reserved, attendance, date, time_slot) VALUES(null, "Snakes", 100, capacity - (reserved + attendance), 15, 25, 2, 2);
INSERT INTO shows(show_id, name, capacity, available_slots, reserved, attendance, date, time_slot) VALUES(null, "Elephants", 100, capacity - (reserved + attendance), 20, 30, 3, 3);

-- Tour
INSERT INTO tour(tour_id, name, capacity, available_slots, reserved, attendance, date, time_slot) VALUES(null, "Private Tour", 100, capacity - (reserved + attendance), 10, 20, 1, 1);
INSERT INTO tour(tour_id, name, capacity, available_slots, reserved, attendance, date, time_slot) VALUES(null, "Private Tour", 100, capacity - (reserved + attendance), 15, 25, 3, 3);
INSERT INTO tour(tour_id, name, capacity, available_slots, reserved, attendance, date, time_slot) VALUES(null, "Private Tour", 100, capacity - (reserved + attendance), 20, 30, 2, 2);

-- Attends
INSERT INTO attends(attends_id, shows, tour, visitor) VALUES(null, 1, null, 1);
INSERT INTO attends(attends_id, shows, tour, visitor) VALUES(null, null, 1, 2);
INSERT INTO attends(attends_id, shows, tour, visitor) VALUES(null, 2, null, 3);

-- Shop
INSERT INTO shop(shop_id, location, type, inventory) VALUES(null, "Food Court", "Diner", null);
INSERT INTO shop(shop_id, location, type, inventory) VALUES(null, "Food Court", "BBQ", null);
INSERT INTO shop(shop_id, location, type, inventory) VALUES(null, "Food Court", "Burgers", null);

-- Shops
INSERT INTO shops(shops_id, visitor, shop) VALUE(null, 1, 1);
INSERT INTO shops(shops_id, visitor, shop) VALUE(null, 2, 2);
INSERT INTO shops(shops_id, visitor, shop) VALUE(null, 3, 3);

-- Accountant
INSERT INTO accountant(accountant_id, department, total_amount_controlled, employee) VALUES(null, 1, 150000, 1);
INSERT INTO accountant(accountant_id, department, total_amount_controlled, employee) VALUES(null, 2, 250000, 2);
INSERT INTO accountant(accountant_id, department, total_amount_controlled, employee) VALUES(null, 3, 500000, 3);

-- Budget
INSERT INTO budget(budget_id, amount) VALUES(null, 400000);
INSERT INTO budget(budget_id, amount) VALUES(null, 1000000);
INSERT INTO budget(budget_id, amount) VALUES(null, 750000);

-- Manages
INSERT INTO manages(manages_id, accountant, budget) VALUES(null, 1, 1);
INSERT INTO manages(manages_id, accountant, budget) VALUES(null, 2, 2);
INSERT INTO manages(manages_id, accountant, budget) VALUES(null, 3, 3);

-- Expense
INSERT INTO expense(expense_id, amount, date) VALUES(null, 250, current_date());
INSERT INTO expense(expense_id, amount, date) VALUES(null, 150, current_date());
INSERT INTO expense(expense_id, amount, date) VALUES(null, 2250, current_date());

-- Oversees
INSERT INTO oversees(oversees_id, budget, revenue, expense) VALUES(null, 1, 1, 1);
INSERT INTO oversees(oversees_id, budget, revenue, expense) VALUES(null, 2, 2, 2);
INSERT INTO oversees(oversees_id, budget, revenue, expense) VALUES(null, 3, 3, 3);

-- Generates
INSERT INTO generates(generates_id, shop, revenue) VALUES(null, 1, 1);
INSERT INTO generates(generates_id, shop, revenue) VALUES(null, 2, 2);
INSERT INTO generates(generates_id, shop, revenue) VALUES(null, 3, 3);

-- Inventory
INSERT INTO inventory(inventory_id, sale_price, num_in_stock, UPC_barcode, shop) VALUES(null, 10, 34, null, 1);
INSERT INTO inventory(inventory_id, sale_price, num_in_stock, UPC_barcode, shop) VALUES(null, 12, 14, null, 2);
INSERT INTO inventory(inventory_id, sale_price, num_in_stock, UPC_barcode, shop) VALUES(null, 15, 25, null, 3);

-- Item
INSERT INTO item(item_id, name, description, wholesale_price) VALUES(null, "Toys", "Children toys", 7);
INSERT INTO item(item_id, name, description, wholesale_price) VALUES(null, "Toys", "Stuffed Animals", 5);
INSERT INTO item(item_id, name, description, wholesale_price) VALUES(null, "Toys", "Puzzles", 2);

-- Contains
INSERT INTO contains(contains_id, inventory, item) VALUES(null, 1, 1);
INSERT INTO contains(contains_id, inventory, item) VALUES(null, 2, 2);
INSERT INTO contains(contains_id, inventory, item) VALUES(null, 3, 3);

-- Vendor
INSERT INTO vendor(vendor_id, name, POC, POC_email) VALUES(null, "Sal's Toys", "Sal", null);
INSERT INTO vendor(vendor_id, name, POC, POC_email) VALUES(null, "PuzzleMakers", "Tony", null);
INSERT INTO vendor(vendor_id, name, POC, POC_email) VALUES(null, "Build-A-Bear", "Jason", null);

-- Sells
INSERT INTO sells(sells_id, vendor, item) VALUES(null, 1, 1);
INSERT INTO sells(sells_id, vendor, item) VALUES(null, 2, 2);
INSERT INTO sells(sells_id, vendor, item) VALUES(null, 3, 3);

-- Shipment
INSERT INTO shipment(shipment_id, tracking_number, total_cost, delivery_date) VALUES(null, "asdfdsa4234324", 150, current_date());
INSERT INTO shipment(shipment_id, tracking_number, total_cost, delivery_date) VALUES(null, "asdddsa4234324", 1500, current_date());
INSERT INTO shipment(shipment_id, tracking_number, total_cost, delivery_date) VALUES(null, "asdf33a4234324", 220, current_date());

-- Ships
INSERT INTO ships(ships_id, vendor, shipment, item) VALUES(null, 1, 1, 1);
INSERT INTO ships(ships_id, vendor, shipment, item) VALUES(null, 2, 2, 2);
INSERT INTO ships(ships_id, vendor, shipment, item) VALUES(null, 3, 3, 3);

-- Requests
INSERT INTO requests(requests_id, vendor, expense) VALUES(null, 1, 1);
INSERT INTO requests(requests_id, vendor, expense) VALUES(null, 2, 2);
INSERT INTO requests(requests_id, vendor, expense) VALUES(null, 3, 3);

-- EOF
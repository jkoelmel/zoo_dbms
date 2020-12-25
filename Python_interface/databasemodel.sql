-- -----------------------------------------------------
-- Schema ZooManagementDB
-- -----------------------------------------------------

USE `ZooManagementDB` ;

-- -----------------------------------------------------
-- Table `ZooManagementDB`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`User` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`User` (
  `user_id` TINYINT NOT NULL AUTO_INCREMENT,
  `f_name` VARCHAR(45) NOT NULL,
  `l_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `DOB` DATE NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Account` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Account` (
  `account_id` TINYINT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(40) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `user` TINYINT NOT NULL,
  PRIMARY KEY (`account_id`, `user`),
  INDEX `Account_User.FK_idx` (`user` ASC) VISIBLE,
  CONSTRAINT `Account_User.FK`
    FOREIGN KEY (`user`)
    REFERENCES `ZooManagementDB`.`User` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Company` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Company` (
  `company_id` TINYINT NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(45) NOT NULL,
  `num_employees` INT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE INDEX `company_name_UNIQUE` (`company_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Address` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Address` (
  `address_id` TINYINT NOT NULL AUTO_INCREMENT,
  `house_number` INT NULL,
  `street_name` VARCHAR(100) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(2) NOT NULL,
  `zipcode` INT NOT NULL,
  `user` TINYINT NULL,
  `company` TINYINT NULL,
  PRIMARY KEY (`address_id`),
  INDEX `Address_Company.FK_idx` (`company` ASC) VISIBLE,
  INDEX `Address_User.FK_idx` (`user` ASC) VISIBLE,
  CONSTRAINT `Address_Company.FK`
    FOREIGN KEY (`company`)
    REFERENCES `ZooManagementDB`.`Company` (`company_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `Address_User.FK`
    FOREIGN KEY (`user`)
    REFERENCES `ZooManagementDB`.`User` (`user_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Phone_Number`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Phone_Number` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Phone_Number` (
  `phone_id` TINYINT NOT NULL AUTO_INCREMENT,
  `country_code` TINYINT NULL DEFAULT 1,
  `area_code` INT NULL,
  `phone_number` INT NOT NULL,
  `user` TINYINT NULL,
  `company` TINYINT NULL,
  PRIMARY KEY (`phone_id`),
  INDEX `Phone_Number_User.FK_idx` (`user` ASC) VISIBLE,
  INDEX `Phone_Number_Company.FK_idx` (`company` ASC) VISIBLE,
  CONSTRAINT `Phone_Number_User.FK`
    FOREIGN KEY (`user`)
    REFERENCES `ZooManagementDB`.`User` (`user_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `Phone_Number_Company.FK`
    FOREIGN KEY (`company`)
    REFERENCES `ZooManagementDB`.`Company` (`company_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Employee` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Employee` (
  `employee_id` TINYINT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(45) NOT NULL,
  `dept_id` TINYINT NULL,
  `user` TINYINT NOT NULL,
  PRIMARY KEY (`employee_id`, `user`),
  INDEX `Employee_User.FK_idx` (`user` ASC) VISIBLE,
  CONSTRAINT `Employee_User.FK`
    FOREIGN KEY (`user`)
    REFERENCES `ZooManagementDB`.`User` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Employs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Employs` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Employs` (
  `employs_id` TINYINT NOT NULL AUTO_INCREMENT,
  `company` TINYINT NOT NULL,
  `employee` TINYINT NOT NULL,
  PRIMARY KEY (`employs_id`, `company`, `employee`),
  INDEX `Employs_Company.FK_idx` (`company` ASC) VISIBLE,
  INDEX `Employs_Employee.FKJ_idx` (`employee` ASC) VISIBLE,
  CONSTRAINT `Employs_Company.FK`
    FOREIGN KEY (`company`)
    REFERENCES `ZooManagementDB`.`Company` (`company_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Employs_Employee.FK`
    FOREIGN KEY (`employee`)
    REFERENCES `ZooManagementDB`.`Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Department` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Department` (
  `department_id` TINYINT NOT NULL AUTO_INCREMENT,
  `dept_name` VARCHAR(45) NOT NULL,
  `executive` TINYINT NULL,
  `company` TINYINT NULL,
  PRIMARY KEY (`department_id`),
  INDEX `Department_Company.FK_idx` (`company` ASC) VISIBLE,
  CONSTRAINT `Department_Company.FK`
    FOREIGN KEY (`company`)
    REFERENCES `ZooManagementDB`.`Company` (`company_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Manager`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Manager` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Manager` (
  `manager_id` TINYINT NOT NULL AUTO_INCREMENT,
  `employee` TINYINT NOT NULL,
  `department` TINYINT NULL,
  PRIMARY KEY (`manager_id`),
  INDEX `Manager_Employee.FK_idx` (`employee` ASC) VISIBLE,
  INDEX `Manager_Department.FK_idx` (`department` ASC) VISIBLE,
  CONSTRAINT `Manager_Employee.FK`
    FOREIGN KEY (`employee`)
    REFERENCES `ZooManagementDB`.`Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Manager_Department.FK`
    FOREIGN KEY (`department`)
    REFERENCES `ZooManagementDB`.`Department` (`department_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Member` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Member` (
  `member_id` TINYINT NOT NULL AUTO_INCREMENT,
  `user` TINYINT NULL,
  PRIMARY KEY (`member_id`),
  INDEX `Member_User.FK_idx` (`user` ASC) VISIBLE,
  CONSTRAINT `Member_User.FK`
    FOREIGN KEY (`user`)
    REFERENCES `ZooManagementDB`.`User` (`user_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Executive`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Executive` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Executive` (
  `executive_id` TINYINT NOT NULL AUTO_INCREMENT,
  `department` TINYINT NULL,
  PRIMARY KEY (`executive_id`),
  INDEX `department_idx` (`department` ASC) VISIBLE,
  CONSTRAINT `Executive_Department.FK`
    FOREIGN KEY (`department`)
    REFERENCES `ZooManagementDB`.`Department` (`department_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Hourly_Worker`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Hourly_Worker` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Hourly_Worker` (
  `hourly_worker_id` TINYINT NOT NULL AUTO_INCREMENT,
  `hours_current` TINYINT NULL,
  `hours_total` INT NULL,
  `hourly_rate` DECIMAL(2) NOT NULL,
  `employee` TINYINT NOT NULL,
  PRIMARY KEY (`hourly_worker_id`),
  INDEX `Hourly_Worker_Employee.FK_idx` (`employee` ASC) VISIBLE,
  CONSTRAINT `Hourly_Worker_Employee.FK`
    FOREIGN KEY (`employee`)
    REFERENCES `ZooManagementDB`.`Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Salary_Worker`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Salary_Worker` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Salary_Worker` (
  `salary_worker_id` TINYINT NOT NULL AUTO_INCREMENT,
  `annual_salary` INT NOT NULL,
  `monthly_wage` INT NOT NULL,
  `hours_total` INT NULL,
  `employee` TINYINT NOT NULL,
  PRIMARY KEY (`salary_worker_id`),
  INDEX `Salary_Worker_Employee.FK_idx` (`employee` ASC) VISIBLE,
  CONSTRAINT `Salary_Worker_Employee.FK`
    FOREIGN KEY (`employee`)
    REFERENCES `ZooManagementDB`.`Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Radio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Radio` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Radio` (
  `radio_id` INT NOT NULL AUTO_INCREMENT,
  `serial_number` VARCHAR(45) NOT NULL,
  `employee` TINYINT NULL,
  PRIMARY KEY (`radio_id`),
  UNIQUE INDEX `serial_number_UNIQUE` (`serial_number` ASC) VISIBLE,
  INDEX `Radio_Employee.FK_idx` (`employee` ASC) VISIBLE,
  CONSTRAINT `Radio_Employee.FK`
    FOREIGN KEY (`employee`)
    REFERENCES `ZooManagementDB`.`Employee` (`employee_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Payment` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Payment` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `payment_type` VARCHAR(45) NOT NULL,
  `card_number` INT NULL,
  `routing_number` INT NULL,
  `bank_account` INT NULL,
  `member` TINYINT NULL,
  PRIMARY KEY (`payment_id`),
  INDEX `Payment_Member.FK_idx` (`member` ASC) VISIBLE,
  CONSTRAINT `Payment_Member.FK`
    FOREIGN KEY (`member`)
    REFERENCES `ZooManagementDB`.`Member` (`member_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Visitor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Visitor` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Visitor` (
  `visitor_id` INT NOT NULL AUTO_INCREMENT,
  `f_name` VARCHAR(45) NOT NULL,
  `l_name` VARCHAR(45) NOT NULL,
  `age` TINYINT NOT NULL,
  `zip_code` INT NOT NULL,
  `party_size` TINYINT NOT NULL,
  PRIMARY KEY (`visitor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Revenue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Revenue` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Revenue` (
  `revenue_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `amount` INT NULL,
  PRIMARY KEY (`revenue_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Pays`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Pays` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Pays` (
  `pays_id` INT NOT NULL AUTO_INCREMENT,
  `payment` INT NOT NULL,
  `visitor` INT NOT NULL,
  `revenue` INT NOT NULL,
  PRIMARY KEY (`pays_id`, `payment`, `revenue`, `visitor`),
  INDEX `Pays_Payment.FK_idx` (`payment` ASC) VISIBLE,
  INDEX `Pays_Visitor.FK_idx` (`visitor` ASC) VISIBLE,
  INDEX `Pay_Revenue.FK_idx` (`revenue` ASC) VISIBLE,
  CONSTRAINT `Pays_Payment.FK`
    FOREIGN KEY (`payment`)
    REFERENCES `ZooManagementDB`.`Payment` (`payment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Pays_Visitor.FK`
    FOREIGN KEY (`visitor`)
    REFERENCES `ZooManagementDB`.`Visitor` (`visitor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Pays_Revenue.FK`
    FOREIGN KEY (`revenue`)
    REFERENCES `ZooManagementDB`.`Revenue` (`revenue_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Attendance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Attendance` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Attendance` (
  `attendance_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `total_attendance` INT NOT NULL,
  `total_child` INT NOT NULL,
  `total_adult` INT NOT NULL,
  `total_senior` INT NOT NULL,
  `new_membership` INT NULL,
  PRIMARY KEY (`attendance_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Log` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Log` (
  `log_id` INT NOT NULL AUTO_INCREMENT,
  `visitor` INT NOT NULL,
  `attendance` INT NOT NULL,
  PRIMARY KEY (`log_id`, `visitor`, `attendance`),
  INDEX `Log_Visitor.FK_idx` (`visitor` ASC) VISIBLE,
  INDEX `Log_Attendance.FK_idx` (`attendance` ASC) VISIBLE,
  CONSTRAINT `Log_Visitor.FK`
    FOREIGN KEY (`visitor`)
    REFERENCES `ZooManagementDB`.`Visitor` (`visitor_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `Log_Attendance.FK`
    FOREIGN KEY (`attendance`)
    REFERENCES `ZooManagementDB`.`Attendance` (`attendance_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Veterinarian`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Veterinarian` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Veterinarian` (
  `vet_id` TINYINT NOT NULL AUTO_INCREMENT,
  `employee` TINYINT NOT NULL,
  PRIMARY KEY (`vet_id`, `employee`),
  INDEX `Veterinarian_Employee.FK_idx` (`employee` ASC) VISIBLE,
  CONSTRAINT `Veterinarian_Employee.FK`
    FOREIGN KEY (`employee`)
    REFERENCES `ZooManagementDB`.`Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Trainer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Trainer` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Trainer` (
  `trainer_id` TINYINT NOT NULL AUTO_INCREMENT,
  `employee` TINYINT NOT NULL,
  PRIMARY KEY (`trainer_id`, `employee`),
  INDEX `Trainer_Employee.FK_idx` (`employee` ASC) VISIBLE,
  CONSTRAINT `Trainer_Employee.FK`
    FOREIGN KEY (`employee`)
    REFERENCES `ZooManagementDB`.`Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Zookeeper`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Zookeeper` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Zookeeper` (
  `zookeeper_id` TINYINT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(45) NULL,
  `employee` TINYINT NOT NULL,
  PRIMARY KEY (`zookeeper_id`, `employee`),
  INDEX `Zookeeper_Employee.FK_idx` (`employee` ASC) VISIBLE,
  CONSTRAINT `Zookeeper_Employee.FK`
    FOREIGN KEY (`employee`)
    REFERENCES `ZooManagementDB`.`Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Animal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Animal` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Animal` (
  `animal_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `DOB` DATE NOT NULL,
  `DOD` DATE NULL,
  PRIMARY KEY (`animal_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Cares`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Cares` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Cares` (
  `cares_id` INT NOT NULL AUTO_INCREMENT,
  `veterinarian` TINYINT NOT NULL,
  `animal` INT NOT NULL,
  PRIMARY KEY (`cares_id`, `animal`, `veterinarian`),
  INDEX `Cares_Animal.FK_idx` (`animal` ASC) VISIBLE,
  INDEX `Cares_Veterinarian.FK_idx` (`veterinarian` ASC) VISIBLE,
  CONSTRAINT `Cares_Veterinarian.FK`
    FOREIGN KEY (`veterinarian`)
    REFERENCES `ZooManagementDB`.`Veterinarian` (`vet_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Cares_Animal.FK`
    FOREIGN KEY (`animal`)
    REFERENCES `ZooManagementDB`.`Animal` (`animal_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Trains`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Trains` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Trains` (
  `trains_id` INT NOT NULL AUTO_INCREMENT,
  `trainer` TINYINT NOT NULL,
  `animal` INT NOT NULL,
  PRIMARY KEY (`trains_id`, `trainer`, `animal`),
  INDEX `Trains_Animal.FK_idx` (`animal` ASC) VISIBLE,
  INDEX `Trains_Trainer.FK_idx` (`trainer` ASC) VISIBLE,
  CONSTRAINT `Trains_Animal.FK`
    FOREIGN KEY (`animal`)
    REFERENCES `ZooManagementDB`.`Animal` (`animal_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Trains_Trainer.FK`
    FOREIGN KEY (`trainer`)
    REFERENCES `ZooManagementDB`.`Trainer` (`trainer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Area` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Area` (
  `area_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `size` INT NOT NULL,
  PRIMARY KEY (`area_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Maintains`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Maintains` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Maintains` (
  `maintains_id` INT NOT NULL AUTO_INCREMENT,
  `area` TINYINT NOT NULL,
  `zookeeper` TINYINT NOT NULL,
  PRIMARY KEY (`maintains_id`, `area`, `zookeeper`),
  INDEX `Maintains_Area.FK_idx` (`area` ASC) VISIBLE,
  INDEX `Maintains_Zookeeper.FK_idx` (`zookeeper` ASC) VISIBLE,
  CONSTRAINT `Maintains_Area.FK`
    FOREIGN KEY (`area`)
    REFERENCES `ZooManagementDB`.`Area` (`area_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Maintains_Zookeeper.FK`
    FOREIGN KEY (`zookeeper`)
    REFERENCES `ZooManagementDB`.`Zookeeper` (`zookeeper_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Habitat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Habitat` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Habitat` (
  `habitat_id` TINYINT NOT NULL AUTO_INCREMENT,
  `size` INT NOT NULL,
  `land_type` VARCHAR(45) NOT NULL,
  `capacity` INT NOT NULL,
  `area` TINYINT NULL,
  PRIMARY KEY (`habitat_id`),
  INDEX `Habitat_Area.FK_idx` (`area` ASC) VISIBLE,
  CONSTRAINT `Habitat_Area.FK`
    FOREIGN KEY (`area`)
    REFERENCES `ZooManagementDB`.`Area` (`area_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Diet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Diet` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Diet` (
  `diet_id` TINYINT NOT NULL AUTO_INCREMENT,
  `food` VARCHAR(45) NOT NULL,
  `daily_amount` INT NOT NULL,
  `feeding_time` TIME NOT NULL,
  PRIMARY KEY (`diet_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Medicine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Medicine` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Medicine` (
  `medicine_id` TINYINT NOT NULL AUTO_INCREMENT,
  `otc_name` VARCHAR(45) NOT NULL,
  `dosage` INT NOT NULL,
  `dosage_time` TIME NOT NULL,
  PRIMARY KEY (`medicine_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Assigned`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Assigned` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Assigned` (
  `assigned_id` INT NOT NULL AUTO_INCREMENT,
  `animal` INT NOT NULL,
  `diet` TINYINT NULL,
  `medicine` TINYINT NULL,
  `habitat` TINYINT NOT NULL,
  PRIMARY KEY (`assigned_id`, `animal`),
  INDEX `Assigned_Animal.FK_idx` (`animal` ASC) VISIBLE,
  INDEX `Assigned_Diet.FK_idx` (`diet` ASC) VISIBLE,
  INDEX `Assigned_Medicine.FK_idx` (`medicine` ASC) VISIBLE,
  INDEX `Assigned_Habitat.FK_idx` (`habitat` ASC) VISIBLE,
  CONSTRAINT `Assigned_Animal.FK`
    FOREIGN KEY (`animal`)
    REFERENCES `ZooManagementDB`.`Animal` (`animal_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Assigned_Diet.FK`
    FOREIGN KEY (`diet`)
    REFERENCES `ZooManagementDB`.`Diet` (`diet_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `Assigned_Medicine.FK`
    FOREIGN KEY (`medicine`)
    REFERENCES `ZooManagementDB`.`Medicine` (`medicine_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `Assigned_Habitat.FK`
    FOREIGN KEY (`habitat`)
    REFERENCES `ZooManagementDB`.`Habitat` (`habitat_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Date`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Date` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Date` (
  `date_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  PRIMARY KEY (`date_id`),
  UNIQUE INDEX `date_UNIQUE` (`date` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Time_Slot`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Time_Slot` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Time_Slot` (
  `time_slot_id` TINYINT NOT NULL AUTO_INCREMENT,
  `time_slot` TIME NOT NULL,
  PRIMARY KEY (`time_slot_id`),
  UNIQUE INDEX `time_slot_UNIQUE` (`time_slot` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Shows`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Shows` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Shows` (
  `show_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `capacity` INT NOT NULL,
  `available_slots` INT NULL,
  `reserved` INT NOT NULL,
  `attendance` INT NOT NULL,
  `date` INT NOT NULL,
  `time_slot` TINYINT NOT NULL,
  PRIMARY KEY (`show_id`),
  INDEX `Show_Date.FK_idx` (`date` ASC) VISIBLE,
  INDEX `Show_Time_Slot.FK_idx` (`time_slot` ASC) VISIBLE,
  CONSTRAINT `Show_Date.FK`
    FOREIGN KEY (`date`)
    REFERENCES `ZooManagementDB`.`Date` (`date_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `Show_Time_Slot.FK`
    FOREIGN KEY (`time_slot`)
    REFERENCES `ZooManagementDB`.`Time_Slot` (`time_slot_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Tour`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Tour` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Tour` (
  `tour_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `capacity` INT NOT NULL,
  `available_slots` INT NULL,
  `reserved` INT NOT NULL,
  `attendance` INT NOT NULL,
  `date` INT NULL,
  `time_slot` TINYINT NULL,
  PRIMARY KEY (`tour_id`),
  INDEX `Tour_Date.FK_idx` (`date` ASC) VISIBLE,
  INDEX `Tour_Time_Slot.FK_idx` (`time_slot` ASC) VISIBLE,
  CONSTRAINT `Tour_Date.FK`
    FOREIGN KEY (`date`)
    REFERENCES `ZooManagementDB`.`Date` (`date_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `Tour_Time_Slot.FK`
    FOREIGN KEY (`time_slot`)
    REFERENCES `ZooManagementDB`.`Time_Slot` (`time_slot_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Attends`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Attends` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Attends` (
  `attends_id` INT NOT NULL AUTO_INCREMENT,
  `shows` TINYINT NULL,
  `tour` TINYINT NULL,
  `visitor` INT NOT NULL,
  PRIMARY KEY (`attends_id`, `visitor`),
  INDEX `Attends_Show.FK_idx` (`shows` ASC) VISIBLE,
  INDEX `Attends_Tour.FK_idx` (`tour` ASC) VISIBLE,
  INDEX `Attends_Visitor.FK_idx` (`visitor` ASC) VISIBLE,
  CONSTRAINT `Attends_Show.FK`
    FOREIGN KEY (`shows`)
    REFERENCES `ZooManagementDB`.`Shows` (`show_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `Attends_Tour.FK`
    FOREIGN KEY (`tour`)
    REFERENCES `ZooManagementDB`.`Tour` (`tour_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `Attends_Visitor.FK`
    FOREIGN KEY (`visitor`)
    REFERENCES `ZooManagementDB`.`Visitor` (`visitor_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Shop`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Shop` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Shop` (
  `shop_id` TINYINT NOT NULL AUTO_INCREMENT,
  `location` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `inventory` TINYINT NULL,
  PRIMARY KEY (`shop_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Shops`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Shops` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Shops` (
  `shops_id` INT NOT NULL AUTO_INCREMENT,
  `visitor` INT NOT NULL,
  `shop` TINYINT NOT NULL,
  PRIMARY KEY (`shops_id`, `visitor`, `shop`),
  INDEX `Shops_Visitor.FK_idx` (`visitor` ASC) VISIBLE,
  INDEX `Shops_Shop.FK_idx` (`shop` ASC) VISIBLE,
  CONSTRAINT `Shops_Visitor.FK`
    FOREIGN KEY (`visitor`)
    REFERENCES `ZooManagementDB`.`Visitor` (`visitor_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `Shops_Shop.FK`
    FOREIGN KEY (`shop`)
    REFERENCES `ZooManagementDB`.`Shop` (`shop_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Accountant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Accountant` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Accountant` (
  `accountant_id` TINYINT NOT NULL AUTO_INCREMENT,
  `department` TINYINT NOT NULL,
  `total_amount_controlled` INT NOT NULL,
  `employee` TINYINT NULL,
  PRIMARY KEY (`accountant_id`),
  INDEX `Accountant_Employee.FK_idx` (`employee` ASC) VISIBLE,
  CONSTRAINT `Accountant_Employee.FK`
    FOREIGN KEY (`employee`)
    REFERENCES `ZooManagementDB`.`Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Budget`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Budget` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Budget` (
  `budget_id` TINYINT NOT NULL AUTO_INCREMENT,
  `amount` INT NOT NULL,
  PRIMARY KEY (`budget_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Manages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Manages` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Manages` (
  `manages_id` INT NOT NULL AUTO_INCREMENT,
  `accountant` TINYINT NOT NULL,
  `budget` TINYINT NOT NULL,
  PRIMARY KEY (`manages_id`, `budget`, `accountant`),
  INDEX `Manages_Accountant.FK_idx` (`accountant` ASC) VISIBLE,
  INDEX `Manages_Budget.FK_idx` (`budget` ASC) VISIBLE,
  CONSTRAINT `Manages_Accountant.FK`
    FOREIGN KEY (`accountant`)
    REFERENCES `ZooManagementDB`.`Accountant` (`accountant_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Manages_Budget.FK`
    FOREIGN KEY (`budget`)
    REFERENCES `ZooManagementDB`.`Budget` (`budget_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Expense`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Expense` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Expense` (
  `expense_id` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NULL,
  `date` DATE NULL,
  PRIMARY KEY (`expense_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Oversees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Oversees` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Oversees` (
  `oversees_id` INT NOT NULL AUTO_INCREMENT,
  `budget` TINYINT NOT NULL,
  `revenue` INT NOT NULL,
  `expense` INT NOT NULL,
  PRIMARY KEY (`oversees_id`, `revenue`, `expense`, `budget`),
  INDEX `Contains_Budget.FK_idx` (`budget` ASC) VISIBLE,
  INDEX `Contains_Revenue.FK_idx` (`revenue` ASC) VISIBLE,
  INDEX `Contains_Expense.FK_idx` (`expense` ASC) VISIBLE,
  CONSTRAINT `Oversees_Budget.FK`
    FOREIGN KEY (`budget`)
    REFERENCES `ZooManagementDB`.`Budget` (`budget_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `Oversees_Revenue.FK`
    FOREIGN KEY (`revenue`)
    REFERENCES `ZooManagementDB`.`Revenue` (`revenue_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Oversees_Expense.FK`
    FOREIGN KEY (`expense`)
    REFERENCES `ZooManagementDB`.`Expense` (`expense_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Generates`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Generates` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Generates` (
  `generates_id` INT NOT NULL AUTO_INCREMENT,
  `shop` TINYINT NOT NULL,
  `revenue` INT NOT NULL,
  PRIMARY KEY (`generates_id`, `shop`, `revenue`),
  INDEX `Generates_Shop.FK_idx` (`shop` ASC) VISIBLE,
  INDEX `Generates_Revenue.FK_idx` (`revenue` ASC) VISIBLE,
  CONSTRAINT `Generates_Shop.FK`
    FOREIGN KEY (`shop`)
    REFERENCES `ZooManagementDB`.`Shop` (`shop_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `Generates_Revenue.FK`
    FOREIGN KEY (`revenue`)
    REFERENCES `ZooManagementDB`.`Revenue` (`revenue_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Inventory` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Inventory` (
  `inventory_id` TINYINT NOT NULL AUTO_INCREMENT,
  `sale_price` INT NOT NULL,
  `num_in_stock` INT NOT NULL,
  `UPC_barcode` INT NULL,
  `shop` TINYINT NULL,
  PRIMARY KEY (`inventory_id`),
  INDEX `Inventory_Shop.FK_idx` (`shop` ASC) VISIBLE,
  CONSTRAINT `Inventory_Shop.FK`
    FOREIGN KEY (`shop`)
    REFERENCES `ZooManagementDB`.`Shop` (`shop_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Item` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Item` (
  `item_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `wholesale_price` INT NOT NULL,
  PRIMARY KEY (`item_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Contains`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Contains` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Contains` (
  `contains_id` INT NOT NULL AUTO_INCREMENT,
  `inventory` TINYINT NULL,
  `item` INT NOT NULL,
  PRIMARY KEY (`contains_id`, `item`),
  INDEX `Contains_Inventory.FK_idx` (`inventory` ASC) VISIBLE,
  INDEX `Contains_Item.FK_idx` (`item` ASC) VISIBLE,
  CONSTRAINT `Contains_Inventory.FK`
    FOREIGN KEY (`inventory`)
    REFERENCES `ZooManagementDB`.`Inventory` (`inventory_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `Contains_Item.FK`
    FOREIGN KEY (`item`)
    REFERENCES `ZooManagementDB`.`Item` (`item_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Vendor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Vendor` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Vendor` (
  `vendor_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `POC` VARCHAR(255) NULL,
  `POC_email` VARCHAR(255) NULL,
  PRIMARY KEY (`vendor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Sells`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Sells` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Sells` (
  `sells_id` INT NOT NULL AUTO_INCREMENT,
  `vendor` TINYINT NOT NULL,
  `item` INT NOT NULL,
  PRIMARY KEY (`sells_id`, `item`, `vendor`),
  INDEX `Sells_Vendor.FK_idx` (`vendor` ASC) VISIBLE,
  INDEX `Sells_Item.FK_idx` (`item` ASC) VISIBLE,
  CONSTRAINT `Sells_Vendor.FK`
    FOREIGN KEY (`vendor`)
    REFERENCES `ZooManagementDB`.`Vendor` (`vendor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Sells_Item.FK`
    FOREIGN KEY (`item`)
    REFERENCES `ZooManagementDB`.`Item` (`item_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Shipment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Shipment` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Shipment` (
  `shipment_id` INT NOT NULL AUTO_INCREMENT,
  `tracking_number` VARCHAR(45) NOT NULL,
  `total_cost` INT NOT NULL,
  `delivery_date` DATE NOT NULL,
  PRIMARY KEY (`shipment_id`))
ENGINE = InnoDB
COMMENT = '								';


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Ships`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Ships` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Ships` (
  `ships_id` INT NOT NULL AUTO_INCREMENT,
  `vendor` TINYINT NOT NULL,
  `shipment` INT NOT NULL,
  `item` INT NOT NULL,
  PRIMARY KEY (`ships_id`, `shipment`, `item`, `vendor`),
  INDEX `Ships_Vendor.FK_idx` (`vendor` ASC) VISIBLE,
  INDEX `Ships_Shipment.FK_idx` (`shipment` ASC) VISIBLE,
  INDEX `Ships_Item.FK_idx` (`item` ASC) VISIBLE,
  CONSTRAINT `Ships_Vendor.FK`
    FOREIGN KEY (`vendor`)
    REFERENCES `ZooManagementDB`.`Vendor` (`vendor_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `Ships_Shipment.FK`
    FOREIGN KEY (`shipment`)
    REFERENCES `ZooManagementDB`.`Shipment` (`shipment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Ships_Item.FK`
    FOREIGN KEY (`item`)
    REFERENCES `ZooManagementDB`.`Item` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Requests`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Requests` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Requests` (
  `requests_id` INT NOT NULL AUTO_INCREMENT,
  `vendor` TINYINT NOT NULL,
  `expense` INT NOT NULL,
  PRIMARY KEY (`requests_id`, `expense`, `vendor`),
  INDEX `Requests_Vendor.FK_idx` (`vendor` ASC) VISIBLE,
  INDEX `Requests_Expense.FK_idx` (`expense` ASC) VISIBLE,
  CONSTRAINT `Requests_Vendor.FK`
    FOREIGN KEY (`vendor`)
    REFERENCES `ZooManagementDB`.`Vendor` (`vendor_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `Requests_Expense.FK`
    FOREIGN KEY (`expense`)
    REFERENCES `ZooManagementDB`.`Expense` (`expense_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ZooManagementDB`.`Management`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ZooManagementDB`.`Management` ;

CREATE TABLE IF NOT EXISTS `ZooManagementDB`.`Management` (
  `management_id` TINYINT NOT NULL AUTO_INCREMENT,
  `manager` TINYINT NOT NULL,
  `employee` TINYINT NOT NULL,
  PRIMARY KEY (`management_id`),
  INDEX `Management_Manager.FK_idx` (`manager` ASC) VISIBLE,
  INDEX `Manages_Employee.FK_idx` (`employee` ASC) VISIBLE,
  UNIQUE INDEX `employee_UNIQUE` (`employee` ASC) VISIBLE,
  CONSTRAINT `Management_Manager.FK`
    FOREIGN KEY (`manager`)
    REFERENCES `ZooManagementDB`.`Manager` (`manager_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Management_Employee.FK`
    FOREIGN KEY (`employee`)
    REFERENCES `ZooManagementDB`.`Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

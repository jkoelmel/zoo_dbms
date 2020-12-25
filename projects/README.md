-- Start of Project Documentation    

Building and setting up the project:  
Clone repository to local machine.  
Ensure you have MySQL Server, python3, and pymysql library installed on your machine   
Ensure the MySQL Server is running and there is an account with DBA access setup on localhost:3306 with the credentials  
specified in sqlconfig file for username and password, this is important to ensure the pymysql API will be able to access  
the database and perform actions on it  

From the command line(anaconda or python environment):  
Navigate to the folder where you cloned the repo and use 'python user_interface.py'  

From an IDE (spyder used for development):  
Open the user_interface.py file in your IDE and click run  

Inside the Program: 
Upon initial run, if the database is not found, the program will build the database in accordance with the databasemodel.sql file.  
There will be sample data inserted into all the tables via the inserts.sql file. 
There will be a basic menu that allows you to create an account or login. All other options are not available until you have successfully  
logged in. Then the menu will change to allow you to conduct basic CRUD (Create, Read, Update, Delete) operations on the database.  

All CRUD options will allow you to pick a table, then the list of columns in that table will be displayed as a reference for the user  
so they know what kind of options are available to them.  

CREATE ACCOUNT:  
To create an account for the system, choose option 1 and follow the prompts to enter your information. Make sure to follow the formatting for  
the DOB field and once all information has been entered, the system to report whether the account creation was a success or not. If you are  
attempting to create an account that already has an email associated with that user, you will be prompted to re-enter a different email before  
you can continue. Once the user is created, you can use the username and password you chose during account creation to log-in and access the 
database.

INSERT:  
To insert into a table, choose the corresponding option and select a table to insert into. The list of columns in that table will print to  
the screen. The 'table_id' of the table is not required to be inserted as a value because they are all auto-incremented. Type all of the  
columns you want to insert data into, separated by commas. Then type the corresponding data for those columns in the same order, also  
separated by commas. A success message should appear if the action was successful.

UPDATE:  
To update an entry in a table, choose the corresponding option and select a table to update. The list of columns in that table will print to  
the screen. Choose one or more columns from the table to update, separated by commas. Then put the values for those columns, in order, also  
separated by commas. Then choose a constraint for the update, as table-wide updates are not allowed by default in MySQL due to safe mode.  
For the constraint choose a column name and value separated by a comma to narrow your application of updates to the table.  

DELETE:  
To delete an entry in a table, choose the corresponding option and select a table to delete from. The list of columns in that table will print  
to the screen. Choose a column name as the constraint for your deletion and then a value for that column to specify exactly what you desire to  
be removed from the database. Success or failure message will show, if the deletion was unsuccessful, there is is a chance it is from a purposefully
protected table to prevent removal of critical information by accident. 

-- End of Project Documentation  



-- Start of Project Guidelines  
# Final Course Project 

In this project, you will create a real user application by using the database model you created in homework 1 and 2. Please 
refer to the following guidelines to complete your project. Students can implement this project using their favorite 
programming language. Just make sure that the language of your choice supports database implementations. All the 
programming languages have (somehow) libraries that will help students to interact with their databases. 

## Project Guidelines 

Using your database model, and your favorite programming language, create a functional application (console, terminal or GUI) 
to represent the functionality of your database model with real users. Your program must meet the following high level requirements: 

### IMPORTANT: When your program runs for the first time, it must automatically create your database, run the databasemodel.sql script to create the tables for your database, and run the inserts.sql script to insert some sample in those tables. All of this must be done before your program starts to interact with the user.
 
 * Make sure that your app creates a periodically back up of the database. As explained in class, use the transactions.sql to backup your database
 
 * When a table with FKs is queried by the user it must show all the joined data. You must do this in at least three of your tables. For example, if we
   have two tables, employee and company where company id is a FK in the employee table. Instead of showing the id of the company to the user when
   the employee table is queried, you must show the company's name and other important data (at your discretion) from the company table. You will 
   need to use JOINS in order to accomplish this in your program. 

 * The first thing your program needs to do after it is executed is to create your database, tables and insert some sample data using your database model from HW2. Note that this database model should have all the errors encountered in HW2 fixed already. Then, read your transactions.sql file (which is empty at this point). Then, your program must show the following menu to the user. All the credentials needed to create the database must be read from a configuration file or user input. This config file should have at least the following values (host, database_name, username and password). The following will be the initial menu that the program needs to show to the user in screen. 
        
        > User Menu 
        > 1. Create Account 
        > 2. Login 
        > 3. Search
        > 4. Insert 
        > 5. Update
        > 6. Delete 
        > 7. Exit
        
        > Select an option: 1

  * Create user account: the user should be able to create an account in your system. The info provided here depends on the attributes you are required to enter in your account or user table. The following is an example that takes the name, email and password from user input. 
        
        > Name: Jose
        > Email: jortizco@sfsu.com
        > Password: 12345
        
        > Account sucessfully created!
        
        > User Menu 
        > 1. Create Account 
        > 2. Login 
        > 3. Search
        > 4. Insert 
        > 5. Update
        > 6. Delete 
        > 7. Exit
        
        > Select an option: 2
 
 * Login: the user can log into the system using the data provided at registration time. 
 
        > 1. email: jortizco@sfsu.edu
        > 2. password: 12345
        
        >  You are logged as Jose!
        
        > User Menu 
        > 1. Create Account 
        > 2. Login 
        > 3. Search
        > 4. Insert 
        > 5. Update
        > 6. Delete 
        > 7. Exit
        
        > Select an option: 3
        
  * Search: when user selects this option, the user must be able to search for data based on the main entities implemented in your database model.  Take into consideration that a good search functionality should be able to search data from different tables, and show the data organized in the console or terminal. For example, if your database model was modeled for a library system, a good example of a search service in your system would be the following: 
 
       
         > Tables with write/read permissions for Jose. 
         > 1. Book
         > 2. Videos
         > 3. Music
         
         > Select a table to search: 1
         > Enter field: title
         > Enter value: Database System Concepts
         
         > Results: 
         > ISBN:      87736778838
         > Title:     Database System Concepts
         > Author:    Avi Silberschatz
         > Publisher: Parson
           
         > User Menu 
         > 1. Create Account 
         > 2. Login 
         > 3. Search
         > 4. Insert 
         > 5. Update
         > 6. Delete 
         > 7. Exit
        
         > Select an option: 4
         
         
   * Insert: the user of your program must be able to insert data from your database model like in the following example: 
   
         > Tables with write/read permissions for Jose. 
         > 1. Book
         > 2. Videos
         > 3. Music 
           
         > Select a table to insert data: 2
         > Enter fields: ISBM, title, author, length
         > Enter values: 87736773456, my video, jose ortiz, 34
         
         Data succesfully inserted in Video!. 
         
         > User Menu 
         > 1. Create Account 
         > 2. Login 
         > 3. Search
         > 4. Insert 
         > 5. Update
         > 6. Delete 
         > 7. Exit
        
         > Select an option: 5
         
   * Update: the user must be able to update data from your database model. Take into consideration that for update and delete options, you must update or delete all the weak entities that referenced the primary keys of the updated or deleted records. 
         
         > Tables with write/read permissions for Jose. 
         > 1. Book
         > 2. Videos
         > 3. Music 
           
         > Select a table to update data: 2
         > Enter fields: length
         > Enter values: 37
         
         Data succesfully updated in Video!. 
         
         > User Menu 
         > 1. Create Account 
         > 2. Login 
         > 3. Search
         > 4. Insert 
         > 5. Update
         > 6. Delete 
         > 7. Exit
        
         > Select an option: 6
         
         
   * Delete: the user must be able to delete data from your database model
   
         > Tables with write/read permissions for Jose. 
         > 1. Book
         > 2. Videos
         > 3. Music 
         
         > Select a table to delete data: 1
         > Enter field: ISBM
         > Enter value: 87736778838
         
         Data succesfully deleted from Book!. 
         
         > User Menu 
         > 1. Create Account 
         > 2. Login 
         > 3. Search
         > 4. Insert 
         > 5. Update
         > 6. Delete 
         > 7. Exit
        
         > Select an option: 7 
         
## Testing your program

   * This is one of the use cases (among many others) that I will use to test your program. 
       
       1. I will run your program for the first time, and then I will do some inserts, deletes......
       2. I will exit from your program
       3. I will go manually to your database and delete it 
       4. I will run your program again
       5. Your program should detect that the database is not there, and therefore recreate it to its original consistent   
          status before failure. So, it needs to restore the backup database, and any transactions saved in the 
          transactions.sql file until the failure point. The transaction file must only contain write operations.  
           
## Grading Rubrics
  
   1. This project is worth 20% of your final grade, and will be graded using a point scale where the maximum possible 
      grade is 100 points. For example, a grade of 80/100 in this project will be converted to 0.80 * 20% = 16% of 20%
   2. If your program runs without errors, automatically creates a database, tables, insert sample data, and you provided
      the expected docs, then +50 points
   3. If any of the requirements from step 3 is missing, I will stop there, and I will apply a grade (at my discretion) 
      depending on how much work the student has done in the project. However, this grade will be way below the 50 points threshold. 
      Please make sure to test your project properly before submission to avoid this situation
   4. For each option of the menu that is implemented (after step 2 is successfully executed), then +5 points
   5. If the transactions.sql file is correctly implemented +5 points
   6. If your program pass my 10 quality assurance tests (at my discretion) then, + 1O points
   7. Class policies on cheating and plagiarism stated on the class syllabus are applied to this project. 
   8. If a student decides to create a GUI program, take into account that I won't grade the GUI part or the 
      usability of the program. I will grade only the code that interacts with the database. However, since
      creating a GUI program is a lot of work, I will reward this student's work with some extra-credit points. 
    
## Submission Guidelines 
   
   1. By the project's deadline, set the table of assignments (found on main README file) to complete or done for this project. Take into consideration that
   the due date for this project will be the last day of the semester for databases, and if I see a "not completed" set
   in the table of assignments for this project, I will assume that this student did not submit the
   project. Thus, the project won't be graded. 
        

-- End of Project Guidelines   

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

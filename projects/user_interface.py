"""
This is the user interface where the program interacts with the user.
USAGE: 1. Go to sqlconfig.conf file and change the username and password
          values to the ones from you are using in your mysql instance
       2. Open a terminal windows and run the following command:
       python3 user_interface.py
NOTE: Only option 3 and 4 from the menu is implemented so students can
      understand the flow of the program as a base to
      implement the rest of the options
"""
import datetime

def show_menu():
    """
    Prints in console the main menu
    :return: VOID
    """
    global logged_in
    
    # change menu based on login status
    if logged_in == "":
        print("User Menu \n"
              "Log in to access database \n\n"
              "1. Create Account \n"
              "2. Login \n"
              "7. Exit \n")
    else:
        print("User Menu \n"
              "1. Create Account \n"
              "2. Login \n"
              "3. Search \n"
              "4. Insert \n"
              "5. Update \n"
              "6. Delete \n"
              "7. Exit \n")
    


def show_table_names(tables):
    """
    Show all the tables names
    :param tables: a list with the tables names.
                   You can get it by calling the method
                   get_table_names() from DB object
    :return: VOID
    """
    index = 1
    print("\nTables:")
    for table in tables:
        print(table[0])  # print tables names
        index += 1



def option1(db_object):
   
    try:
        #query for checking not a duplicate email
        checkAvailable = """SELECT * FROM user WHERE email = 
                                    %s"""
                                    
        lastIndex = """SELECT * FROM user ORDER BY user_id DESC LIMIT 1"""
        
        # get user info to create account from
        f_name = input("Enter your first name: ")
        l_name = input("Enter your last name: ")
        email = input("Enter your email: ")
        
        results = db_object.select(query=checkAvailable, values=email)
        # check for email account availability
        while len(results) > 0:
            print("Email already exists.")
            email = input("Enter new email: ")
            results = db_object.select(query=checkAvailable, values=email)
        
        DOB = input("Enter your birthday (YYYY-MM-DD): ")
        username = input("Enter username: ")
        password = input("Enter password: ")
        
    
        user_attributes = ["f_name", "l_name", "email", "DOB"]
        account_attributes = ["password", "username", "user"]
        user_values = [f_name, l_name, email, DOB]
        
        if db_object.insert(table="user", attributes=user_attributes, values=user_values):
            print("\nUser inserted successfully\n")
        
        index = db_object.select(query=lastIndex)
        account_values = [password, username, str(index[0][0])]

        if db_object.insert(table="account", attributes=account_attributes,
                         values=account_values):
            print("Account creation complete\n")
            
    except Exception as err: 
        print("Error during account creation")
            


def option2(db_object):
   
    global logged_in
    if logged_in != "":
       print("\nYou are already logged in as {}\n".format(logged_in))
       return
   
    try:
        # get user input for login credentials
        username = input("Enter username: ")
        password = input("Enter password: ")
        
        values = [username, password]
        # build queries with the user input
        query = """SELECT user.f_name, user.l_name FROM user
                        JOIN account ON account.user = user.user_id
                        WHERE username = %s AND password = %s"""


        # get the results from the above query
        results = db_object.select(query=query, values=values)
        
        # print results
        print("\nSuccessfully logged in as: " + 
              results[0][0] + " " + results[0][1] + "\n")
        logged_in = results[0][0] + " " + results[0][1]
        
    except Exception as err:  # handle error
        print("\nWrong username or password.\n")



def option3(db_object, tables):
    """
    Search option
    :param db_object: database object
    :param tables: the name of the tables in the database
    :return: VOID
    """
    try:
        # shows that tables names in menu
        show_table_names(tables)

        # get user input
        table_selected = input("\nSelect a table to search: ")
       
        #get columns to display to user
        columns = db_object.get_column_names(table=table_selected)
        print("\nColumns in selected table: \n")
        for column in columns:
            print(column[0])
        
        attribute_selected = input("Search by (i.e name)? ")
        value_selected = input("Enter the value: ")

        columns = db_object.get_column_names(table_selected)  # get columns names for the table selected
        # build queries with the user input
        query = """SELECT * FROM {} WHERE {} = %s""".format(table_selected, attribute_selected)
        
        # need to add more instance of selecting joins for DB
        if table_selected == "employee":  # only if the table selected is track because we want to join
            query = """SELECT user.f_name, user.l_name, company.company_name,
                        employee.role FROM employs JOIN company ON 
                        employs.company = company.company_id JOIN employee ON
                        employs.employee = employee.employee_id JOIN user ON 
                        employee.user = user.user_id WHERE {} = %s""".format(attribute_selected)
            
            columns = (("f_name",), ("l_name",), ("company_name",), ("role",))
        
        elif table_selected == "company":
            query = """SELECT company.company_name, address.house_number, address.street_name,
                        address.city, address.state, address.zipcode FROM address 
                        JOIN company ON company_id = address.company WHERE {} = %s""".format(attribute_selected)
                        
            columns = (("company_name",), ("house_number",), ("street_name",), ("city",),
                       ("state",), ("zipcode",))
            
        elif table_selected == "animal":
            query = """SELECT animal.name, animal.DOB, diet.food, diet.daily_amount, diet.feeding_time,
                        medicine.otc_name, medicine.dosage, medicine.dosage_time, 
                        habitat.habitat_id, habitat.land_type FROM assigned
                        JOIN animal ON assigned.animal = animal.animal_id
                        JOIN diet ON diet.diet_id = assigned.diet
                        JOIN medicine ON medicine.medicine_id = assigned.medicine
                        JOIN habitat ON habitat.habitat_id = assigned.habitat
                        WHERE animal.{} = %s""".format(attribute_selected) 
            
            columns = (("name",), ("DOB",), ("food",), ("daily_amount",), ("feeding_time",),
                       ("otc_name",), ("dosage",), ("dosage_time",), ("habitat_id",), ("land_type",))
            
        elif table_selected == "ships":
            query = """SELECT vendor.name, shipment.tracking_number, shipment.total_cost,
                        shipment.delivery_date, item.name, item.description FROM ships
                        JOIN vendor ON vendor.vendor_id = ships.vendor JOIN shipment
                        ON shipment.shipment_id = ships.shipment JOIN item ON
                        item.item_id = ships.item WHERE {} = %s""".format(attribute_selected)
            
            columns = (("name",), ("tracking_number",), ("total_cost",), ("delivery_date",),
                       ("item_name",), ("description",))
            
        elif table_selected == "trainer":
            query = """SELECT user.f_name, user.l_name FROM employee
                        JOIN user ON user.user_id = employee.user
                        JOIN trainer ON trainer.employee = employee.employee_id
                        WHERE {} = %s""".format(attribute_selected)
                        
            columns = (("f_name",), ("l_name",))
            
        elif table_selected == "member":
            query = """SELECT user.f_name, user.l_name, payment.payment_type,
                        payment.card_number, payment.routing_number, payment.bank_account
                        FROM member JOIN user ON user.user_id = member.user
                        JOIN payment ON payment.member = member.member_id
                        WHERE {} = %s""".format(attribute_selected)
        
            columns = (("f_name",), ("l_name",), ("payment_type",), ("card_number",),
                   ("routing_number",), ("bank_account",))    

        elif table_selected == "shops":
            query = """SELECT visitor.f_name, visitor.l_name, shop.type, shop.location
                        FROM shops JOIN visitor ON visitor.visitor_id = shops.visitor
                        JOIN shop ON shop.shop_id = shops.shop 
                        WHERE {} = %s""".format(attribute_selected)
                        
            columns = (("f_name",), ("l_name",), ("type",), ("location",))
            
        values = value_selected
            
        # get the results from the above query
        results = db_object.select(query=query, values=values)
        print(columns)
        column_index = 0
        print(results)
        # print results
        print("\n")
        print("Results from: " + table_selected)
        if len(results) <= 1:
            for column in columns:
                values = []
                for result in results:
                    #handle formatting back to string
                    if (isinstance(result[column_index], datetime.timedelta) or
                    (isinstance(result[column_index], datetime.date))):
                        values.append(str(result[column_index]))
                    else:
                        values.append(result[column_index])
                print("{}: {}".format(column[0], values) ) # print attribute: value
                column_index+= 1
            print("\n")
            
        # returned many results use different formatting
        else:
            for result in results:
                column_index = 0
                for column in columns:
                    #handle formatting back to string
                    if (isinstance(result[column_index], datetime.timedelta) or
                    (isinstance(result[column_index], datetime.date))):
                        print("{}: {}". format(column[0], str(result[column_index])))
                    else:
                        print("{}: {}".format(column[0], result[column_index]))
                    column_index += 1
                print("\n")
    except:  # handle error
        print("The data requested couldn't be found\n")



# option 4 when user selects insert
def option4(db_object, tables):
    try:
        # show tables names
        show_table_names(tables)

        # get user input for insert
        table_selected = input("\nEnter a table to insert data: ")
        
        #get columns to display to user
        columns = db_object.get_column_names(table=table_selected)
        print("\nColumns in selected table: \n")
        for column in columns:
            print(column[0])
            
        attributes_str = input("Enter the name attribute/s separated by comma: ")
        values_str = input("Enter the values separated by comma: ")

        # from string to list of attributes and values
        if "," in attributes_str:  # multiple attributes
            attributes = attributes_str.split(",")
            values = values_str.split(",")
        else:  # one attribute
            attributes = [attributes_str]
            values = [values_str]

        if db_object.insert(table=table_selected, attributes=attributes, values=values):
            # insert successful, add to transaction log
            value_str = ""
            for value in values:
                value_str += "\"" + value + "\","
                    
            value_str = value_str[:-1]
            transact = """INSERT INTO {} ( {} ) VALUES ( {} );\n\n""".format(table_selected, 
                                                                             attributes_str, value_str)
           
            transactions.write(transact)
            print("Data successfully inserted into {} \n".format(table_selected))

    except: # data was not inserted, then handle error
        print("Error:", values_str, "failed to be inserted in ", table_selected, "\n")



# option 5 when user selects update
def option5(db_object, tables):
    try:
        show_table_names(tables)
        
        table = input("Enter a table to update: ")
        
        #get columns to display to user
        columns = db_object.get_column_names(table=table)
        print("\nColumns in selected table: \n")
        for column in columns:
            print(column[0])
            
        attribute_str = input("Enter attribute/s to update separated by commas: ")
        values_str = input("Enter updated values for attributes separated by commas: ")
        constraint = input("Enter a constraint for update (attribute, value)\n" +
                          "Example(user_id, 1): ")
        
        # if more than one attribute provided, split attributes and values
        if "," in attribute_str:
            attributes = attribute_str.split(",")
            values = values_str.split(",")
        else:
            attributes = [attribute_str]
            values = [values_str]
            
        constraints = constraint.split(",")
        constraint_attr = constraints[0]
        constraint_value = '"' + constraints[1] + '"'
        pair_attr_to_values = ", ".join([str(a) + " = \"" + b + "\"" for a,b in zip(attributes, values)])
        query = """UPDATE {} SET {} WHERE {} = {}""".format(table, pair_attr_to_values, constraint_attr, constraint_value)
        
        # values = [constraint_value]
        if db_object.update(query=query, values=None): 
            # update successful, add to transaction log
            transactions.write(query + ";\n\n")
            print("\nUpdate successful\n\n")
        
    except:
        print("Data failed to update, bad format or constraint applies to no rows")


# option 6 when user selects delete
def option6(db_object, tables):
    
    try:
        show_table_names(tables)
        
        table = input("Enter a table to delete from: ")
        
        #get columns to display to user
        columns = db_object.get_column_names(table=table)
        print("\nColumns in selected table: \n")
        for column in columns:
            print(column[0])
            
        attribute = input("Enter an attribute to specify deletion: ")
        value = input("Enter value for matched attribute: ")
        value = '"' + value + '"'
        query = """DELETE FROM {} WHERE {} = {}""".format(table, attribute, value)
        
        
        if db_object.delete(query=query, values=None):
            # deletion successful, add to transaction log
            transactions.write(query + ";\n\n")
            print("\nDeletion successful\n\n")
        
    except:
        print("Deletion failed, due to restricted data fields or no affected rows")

##### Driver execution.....
from database import DB

logged_in = ""

transactions = open("transactions.sql", "a")

print("Setting up the database......\n")

# DB API object
db = DB(config_file="sqlconfig.conf")

# create a database (must be the same as the one is in your config file)
database = "ZooManagementDB"

if db.create_database(database=database, drop_database_first=False):
    print("Created database {}\n".format(database))
else:
    print("An error occurred while creating database {} ".format(database))

tables = db.get_table_names()

# if table is missing rebuild and run transactions
if len(tables) != 54:
    
    #setup API object
    db.create_database(database=database, drop_database_first=True)
    
    # create all the tables from databasemodel.sql
    db.run_sql_file("databasemodel.sql")
    
    # insert sample data from insert.sql
    db.run_sql_file("insert.sql")
    
    # run transactions script
    db.run_sql_file("transactions.sql")
    
    print("\nSet up process finished\n")
    
    tables = db.get_table_names()

show_menu()
option = int(input("Select one option from the menu: "))
while option != 7:
    # change menu based on login status
    if logged_in == "":
            if option == 1:
                option1(db)
            elif option == 2:
                option2(db)
            show_menu()
            option = int(input("Select one option from the menu: "))
    else:
        if option == 1:
            option1(db)
        elif option == 2:
            option2(db)
        elif option == 3:
            option3(db, tables)
        elif option == 4:
            option4(db, tables)
        elif option == 5:
            option5(db, tables)
        elif option == 6:
            option6(db, tables)
        show_menu()
        option = int(input("Select one option from the menu: "))

transactions.close()

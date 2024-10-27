import subprocess as sp
import pymysql
import pymysql.cursors
import prettytable

def option1(cur,con):
    dest = input("enter the destination for package: ")
    query="select * from (Tour_Packages join Places on Tour_Packages.Package_ID = Places.Package_ID) where  Destination = '%s' " % (dest) 
    try:
        
        cur.execute(query)
        # Commit the changes to the databasequery="select * from (Tour_Packages join Places on Tour_Packages.Package_ID = Places.Package_ID) where  Destination = '%s' " % (dest) 
        con.commit()
        result = cur.fetchall()
        
        table = prettytable.PrettyTable()

        # Set the column names
        table.field_names = result[0].keys()

        # Add rows to the table
        for row in result:
            table.add_row(row.values())

        # Print the table
        print(table)

        print("Commit successful!")
    except Exception as e:
        con.rollback()  # Rollback changes in case of error
        print(f"Commit failed with the following error: {e}")

def option2():
    
    lang = input("enter the language of tour guide: ")
    query= "select * from Tour_Guide where Tour_Guide.Guide_ID in(select Guide_ID from Languages_Spoken as A where A.Languages_Spoken= '%s')" % (lang) 

    try:
        # Pass the values as a tuple to execute to avoid SQL injection
        query_status1 = cur.execute(query)
        
        con.commit()
        result = cur.fetchall()
        table = prettytable.PrettyTable()

        # Set the column names
        table.field_names = result[0].keys()

        # Add rows to the table
        for row in result:
            table.add_row(row.values())

        # Print the table
        print(table)
        # # Print the results
        # for row in result:
        #     print(row)
        print("Commit successful!")
    except Exception as e:
        con.rollback()  # Rollback changes in case of error
        print(f"Commit failed with the following error: {e}")


def option3():
    query="select Destination_name as destination,Place_Name as place from Customizable_Places"
    try:
        query_status1 = cur.execute(query)
        # Commit the changes to the database
        con.commit()
        result = cur.fetchall()
        # Print the results
        # for row in result:
        #     print(row)
        table = prettytable.PrettyTable()

        # Set the column names
        table.field_names = result[0].keys()

        # Add rows to the table
        for row in result:
            table.add_row(row.values())

        # Print the table
        print(table)

        print("Commit successful!")
      
  
    except Exception as e:
        con.rollback()  # Rollback changes in case of error
        print(f"Commit failed with the following error: {e}")


def option4():
    query="select Hotel_Name,Hotel_Rating from Customizable_Hotel"
    try:
        query_status1 = cur.execute(query)
        # Commit the changes to the database
        con.commit()
        result = cur.fetchall()
        # Print the results
        # for row in result:
        #     print(row)
        # print("Commit successful!")
        table = prettytable.PrettyTable()

        # Set the column names
        table.field_names = result[0].keys()

        # Add rows to the table
        for row in result:
            table.add_row(row.values())

        # Print the table
        print(table)

        print("Commit successful!")
    except Exception as e:
        con.rollback()  # Rollback changes in case of error
        print(f"Commit failed with the following error: {e}")


def option5():
    dest = input("enter the destination for package: ")
    query="SELECT * FROM  Tour_Packages WHERE Destination = '%s' ORDER BY Price ASC LIMIT 1" % (dest)

    try:
        query_status1 = cur.execute(query)
        con.commit()
        result = cur.fetchall()
        # for row in result:
        #     print(row)
        # print("Commit successful!")
        table = prettytable.PrettyTable()

        # Set the column names
        table.field_names = result[0].keys()

        # Add rows to the table
        for row in result:
            table.add_row(row.values())

        # Print the table
        print(table)

        print("Commit successful!")
    except Exception as e:
        con.rollback()  
        print(f"Commit failed with the following error: {e}")

def option6():
    given_month = input("enter the month : ")
    given_year = input("enter the year : ")

    query="select sum(Amount_Due) from Bookings2 where Year= '%s' and Month= '%s'" % (given_year,given_month)

    try:
        query_status1 = cur.execute(query)
        con.commit()
        result = cur.fetchall()
        # for row in result:
        #     print(row)
        # print("Commit successful!")
        table = prettytable.PrettyTable()

        # Set the column names
        table.field_names = result[0].keys()

        # Add rows to the table
        for row in result:
            table.add_row(row.values())

        # Print the table
        print(table)

        print("Commit successful!")
    except Exception as e:
        con.rollback()  
        print(f"Commit failed with the following error: {e}")

def option7():
    initial_characters=input("Enter initial characters for matching first name: ")
    initial_characters=initial_characters+'%'
    query="select * from Tourists where First_Name LIKE '%s'" % (initial_characters)
    try:
        query_status1 = cur.execute(query)
        con.commit()
        result = cur.fetchall()
        # for row in result:
        #     print(row)
        # print("Commit successful!")
        table = prettytable.PrettyTable()

        # Set the column names
        table.field_names = result[0].keys()

        # Add rows to the table
        for row in result:
            table.add_row(row.values())

        # Print the table
        print(table)

        print("Commit successful!")
    except Exception as e:
        con.rollback()  
        print(f"Commit failed with the following error: {e}")

def option8():
    initial_characters=input("Enter initial characters for matching first name: ")
    initial_characters +='%'
    query="select * from Tour_Guide where First_Name LIKE '%s' " % (initial_characters)
    try:
        query_status1 = cur.execute(query)
        con.commit()
        result = cur.fetchall()
        # for row in result:
        #     print(row)
        # print("Commit successful!")
        table = prettytable.PrettyTable()

        # Set the column names
        table.field_names = result[0].keys()

        # Add rows to the table
        for row in result:
            table.add_row(row.values())

        # Print the table
        print(table)

        print("Commit successful!")
    except Exception as e:
        con.rollback()  
        print(f"Commit failed with the following error: {e}")
    
def option9():
    query="select Rating,Comments, Day, Month,Year, Package_ID from(Reviews_and_Feedback2 as A join Reviews_and_Feedback1 as B on A.Review_ID=B.Review_ID ) " 
    try:
        query_status1 = cur.execute(query)
        con.commit()
        result = cur.fetchall()
        # for row in result:
        #     print(row)
        # print("Commit successful!")
        table = prettytable.PrettyTable()

        # Set the column names
        table.field_names = result[0].keys()

        # Add rows to the table
        for row in result:
            table.add_row(row.values())

        # Print the table
        print(table)

        print("Commit successful!")
    except Exception as e:
        con.rollback()  
        print(f"Commit failed with the following error: {e}")

def option10():
    query="select A.First_Name,A.Second_Name,count(*) as total_customers_assisted from(Travel_Agents as A left join Tourists as B on A.Agent_ID=B.Agent_ID ) group by A.Agent_ID"

    try:
        query_status1 = cur.execute(query)
        con.commit()
        result = cur.fetchall()
        # for row in result:
        #     print(row)
        # print("Commit successful!")
        table = prettytable.PrettyTable()

        # Set the column names
        table.field_names = result[0].keys()

        # Add rows to the table
        for row in result:
            table.add_row(row.values())

        # Print the table
        print(table)

        print("Commit successful!")
    except Exception as e:
        con.rollback()  
        print(f"Commit failed with the following error: {e}")






# Add a new tour guide
def option11():
    fname=input("Enter first name of tour guide: ")
    sname=input("Enter second name: ")
    identity_type=input("Enter identity type: ")
    identity_number=input("Enter identity number: ")
    gender=input("Enter gender (M/F): ")
    contact_number=int(input("Enter 10-digit contact number: "))
    serving_destination=input("Enter serving destination: ")
    availability=int(input("Is the guide avaialbale (0/1): "))
    query="insert into Tour_Guide(First_Name,Second_Name,Identity_Type,Identity_Number,Gender,Contact_Number,Serving_Destination,Availability_Status) values(%s,%s,%s,%s,%s,%s,%s,%s )"
    
    try:
        # Pass the values as a tuple to execute to avoid SQL injection
        cur.execute(query, (fname, sname, identity_type, identity_number, gender, contact_number, serving_destination, availability))
        # Commit the changes to the database
        con.commit()
        print("Commit successful!")
    except Exception as e:
        con.rollback()  # Rollback changes in case of error
        print(f"Commit failed with the following error: {e}")

# Add a new customizable hotel
def option12(cur, con):
    hname = input("Enter hotel name: ")
    rating_of_hotel = float(input("Enter hotel Rating: "))
    day_price = int(input("Enter one day price: "))
    night_price = int(input("Ente;r one night price: "))
    
    query = "INSERT INTO Customizable_Hotel (Hotel_Name, Hotel_Rating, Day_Price, Night_Price) VALUES ( %s, %s, %s, %s)"
    

    try:
        # Pass the values as a tuple to execute to avoid SQL injection
        cur.execute(query, ( hname, rating_of_hotel,  day_price, night_price))
        # Commit the changes to the database
        con.commit()
        print("Commit successful!")
    except Exception as e:
        con.rollback()  # Rollback changes in case of error
        print(f"Commit failed with the following error: {e}")


# Update rating of a tour guide
def option13():
    guide_id=int(input("Enter guide id: "))
    rating=int(input("Enter rating for the guide: "))
    query=f"update Tour_Guide set Rating={rating} where Guide_ID={guide_id}"
    try:
        # Pass the values as a tuple to execute to avoid SQL injection
        cur.execute(query)
        con.commit()
        print("Commit successful!")
    except Exception as e:
        con.rollback()  # Rollback changes in case of error
        print(f"Commit failed with the following error: {e}")
    
# Update price of customizable hotel
def option14():
    hotel_id=int(input("Enter hotel id: "))
    day_price=int(input("Enter updated day price: "))
    night_price=int(input("Enter updated night price: "))
    query=f"update Customizable_Hotel set Day_Price={day_price}, Night_Price={night_price} where Hotel_ID={hotel_id}"
    try:
        # Pass the values as a tuple to execute to avoid SQL injection
        cur.execute(query)
        # Commit the changes to the database
        con.commit()
        print("Commit successful!")
    except Exception as e:
        con.rollback()  # Rollback changes in case of error
        print(f"Commit failed with the following error: {e}")

# Remove an agent from Travel_Agents table
def option15():
    agent_id=int(input("Enter travel agent id: "))
    query=f"delete from Travel_Agents where Agent_ID={agent_id}"
    try:
        cur.execute(query)
        con.commit()
        print("Commit successful!")
    except Exception as e:
        con.rollback() 
        print(f"Commit failed with the following error: {e}")

# Remove a hotel from Customizable_Hotel table
def option16():
    hotel_id=int(input("Enter hotel id: "))
    query=f"delete from Customizable_Hotel where Hotel_ID={hotel_id}"
    try:
        cur.execute(query)
        con.commit()
        print("Commit successful!")
    except Exception as e:
        con.rollback() 
        print(f"Commit failed with the following error: {e}")

def dispatch(ch, cur, con):

    if(ch == 1):
        option1(cur,con)
    elif(ch == 2):
        option2()
    elif(ch == 3):
        option3()
    elif(ch == 4):
        option4()
    if(ch == 5):
        option5()
    elif(ch == 6):
        option6()
    elif(ch == 7):
        option7()
    elif(ch == 8):
        option8()
    if(ch == 9):
        option9()
    elif(ch == 10):
        option10()
    elif(ch == 11):
        option11()
    elif(ch == 12):
        option12(cur, con)
    if(ch == 13):
        option13()
    elif(ch == 14):
        option14()
    elif(ch == 15):
        option15()
    elif(ch == 16):
        option16()


# Global
while(1):

    try:
        con = pymysql.connect(host='localhost',
                              port=3306,
                              user="gopi",
                              password="abcde54321#",
                              db='TRAVEL_AGENCY',
                              cursorclass=pymysql.cursors.DictCursor)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        with con.cursor() as cur:
            while(1):
                input("Press any key to continue: ")
                print()
                print()
                print()
                # selection
                print("1. Available packages for a destination")  
                print("2. Tour guide speaking a language")  

                # projection
                print("3. Available destination and their places") 
                print("4. Hotel name and Rating") 

                #aggregate
                print("5. minimum priced package for a destination") 
                print("6. total payment due for a month of year") 

                 # search
                print("7. Search all tourits with their name starting with some characters")
                print("8. Search all tour guides with their name starting with some characters")


                #analysis
                print("9. reviews and feedback on packages") 
                print("10. total customers assisted by travel agents") 

                # insert
                print("11. add a new tour guide") 
                print("12. add a new hotel")

                # update
                print("13. update rating of tour guide") 
                print("14. update day and night price of hotel") 

                # delete
                print("15. remove a travel agent") 
                print("16. remove a hotel")  


                ch = int(input("Enter choice: "))
                tmp = sp.call('clear', shell=True)
                dispatch(ch, cur, con)

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")

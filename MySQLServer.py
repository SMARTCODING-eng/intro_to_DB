import mysql.connector
from mysql.connector import Error

# mydb = mysql.connector.connect(host='localhost', user='root', password='@Johnson1519')
mydb = None
try:
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="@Johnson1519"

)

    if mydb.is_connected():
        cursor = mydb.cursor()

        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")


except Error as e:
    print(f"Error while connecting to MYSQL: {e}")

finally:
    if  mydb and mydb.is_connected():
        cursor.close()
        mydb.close()
        print("MYSQL connection is closed")




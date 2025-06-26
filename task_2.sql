import mysql.connector

from mysql.connector import Error

def create_table():
    mydb = None
    cursor = None
    try:
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="@Johnson1519",
            database="alx_book_store"
        )

        if mydb.is_connected():
            cursor = mydb.cursor()

            cursor.execute("""
                CREATE TABLE IF NOT EXISTS Authors(
                    author_id INT AUTO_INCREMENT PRIMARY KEY,
                    author_name VARCHAR(215) NOT NULL
                )
            """)

            cursor.execute("""
                CREATE TABLE IF NOT EXISTS Customers(
                    customer_id INT AUTO_INCREMENT PRIMARY KEY,
                    customer_name VARCHAR(215) NOT NULL,
                    email VARCHAR(215) NOT NULL,
                    address TEXT NOT NULL
                )
            """)

            cursor.execute("""
                CREATE TABLE IF NOT EXISTS Books(
                    book_id INT AUTO_INCREMENT PRIMARY KEY,
                    title VARCHAR(130) NOT NULL,
                    author_id INT NOT NULL,
                    price DOUBLE NOT NULL,
                    publication_date DATE,
                    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
                )
            """)


            cursor.execute("""
                CREATE TABLE IF NOT EXISTS Orders(
                    order_id INT AUTO_INCREMENT PRIMARY KEY,
                    customer_id INT NOT NULL,
                    order_date DATE NOT NULL,
                    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
                )
            """)

            cursor.execute("""
                CREATE TABLE IF NOT EXISTS Order_Details(
                    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
                    order_id INT NOT NULL,
                    book_id INT NOT NULL,
                    quantity DOUBLE NOT NULL,
                    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
                    FOREIGN KEY (book_id) REFERENCES Books(book_id)
                )
            """)
            mydb.commit()
            print("All Tables successfully created in alx_book_store database!")


    except Error as e:
        print(f"Error while connecting to MYSQL: {e}")

    finally:
        if  mydb and mydb.is_connected():
            if cursor:
                cursor.close()
            mydb.close()
            print("MySQL connection is closed")


if __name__ == '__main__':
    create_table()
import mysql.connector

# Connect to MySQL server (assuming XAMPP is running locally with default settings)
conn = mysql.connector.connect(
    host='localhost',
    user='root',  # Replace 'root' with your MySQL username
    password=''   # Replace '' with your MySQL password
)

cursor = conn.cursor()

# Create database if it doesn't exist
cursor.execute('CREATE DATABASE IF NOT EXISTS securityquest')

# Close connection
conn.close()

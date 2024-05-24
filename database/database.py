import mysql.connector

# Connect to MySQL server (assuming XAMPP is running locally with default settings)
conn = mysql.connector.connect(
    host='localhost',
    user='root',  # Replace 'root' with your MySQL username
    password='',  # Replace '' with your MySQL password
    database='securityquest'  # Replace 'securityquest' with your database name
)
cursor = conn.cursor()

# Create UserInfo table
cursor.execute('''
CREATE TABLE IF NOT EXISTS UserInfo (
    user_id INTEGER PRIMARY KEY,
    user_name TEXT,
    user_bio TEXT,
    user_pic BLOB
)
''')

# Create UserLogin table
cursor.execute('''
CREATE TABLE IF NOT EXISTS UserLogin (
    login_id INTEGER PRIMARY KEY,
    last_login_user DATE,
    flag BOOLEAN,
    user_id INTEGER,
    user_password TEXT,
    email TEXT,
    FOREIGN KEY (user_id) REFERENCES UserInfo(user_id)
)
''')

# Create UserToken table
cursor.execute('''
CREATE TABLE IF NOT EXISTS UserToken (
    token INTEGER PRIMARY KEY,
    token_expiration DATE,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES UserInfo(user_id)
)
''')

# Create UserApp table
cursor.execute('''
CREATE TABLE IF NOT EXISTS UserApp (
    app_id INTEGER PRIMARY KEY,
    user_level INTEGER,
    user_points INTEGER,
    user_id INTEGER,
    streak INTEGER,
    subscription_status INTEGER,
    FOREIGN KEY (user_id) REFERENCES UserInfo(user_id)
)
''')

# Create Feedback table
cursor.execute('''
CREATE TABLE IF NOT EXISTS Feedback (
    feedback_id INTEGER PRIMARY KEY,
    feedback_content TEXT,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES UserInfo(user_id)
)
''')

# Create Resource table
cursor.execute('''
CREATE TABLE IF NOT EXISTS Resource (
    resource_id INTEGER PRIMARY KEY,
    resource_type TEXT
)
''')

# Create Book table
cursor.execute('''
CREATE TABLE IF NOT EXISTS Book (
    book_id INTEGER PRIMARY KEY,
    book_name TEXT,
    book_description TEXT,
    book_source TEXT,
    book_pic BLOB,
    resource_id INTEGER,
    FOREIGN KEY (resource_id) REFERENCES Resource(resource_id)
)
''')

# Create Link table
cursor.execute('''
CREATE TABLE IF NOT EXISTS Link (
    link_id INTEGER PRIMARY KEY,
    link_name TEXT,
    link_link TEXT,
    resource_id INTEGER,
    FOREIGN KEY (resource_id) REFERENCES Resource(resource_id)
)
''')

# Create Course table
cursor.execute('''
CREATE TABLE IF NOT EXISTS Course (
    course_id INTEGER PRIMARY KEY,
    course_name TEXT,
    course_bio TEXT,
    course_pic BLOB,
    tag TEXT,
    resource_id INTEGER,
    FOREIGN KEY (resource_id) REFERENCES Resource(resource_id)
)
''')

# Create Quiz table
cursor.execute('''
CREATE TABLE IF NOT EXISTS Quiz (
    quiz_id INTEGER PRIMARY KEY,
    quiz_name TEXT,
    quiz_content TEXT,
    quiz_difficulty TEXT,
    quiz_score INTEGER,
    quiz_category TEXT,
    quiz_pic BLOB,
    course_id INTEGER,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
)
''')

# Create Tutorial table
cursor.execute('''
CREATE TABLE IF NOT EXISTS Tutorial (
    tuto_id INTEGER PRIMARY KEY,
    tuto_name TEXT,
    tuto_content TEXT,
    tuto_pic BLOB,
    tuto_difficulty TEXT,
    progress INTEGER,
    category TEXT,
    course_id INTEGER,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
)
''')

# Create Admin table
cursor.execute('''
CREATE TABLE IF NOT EXISTS Admin (
    admin_id INTEGER PRIMARY KEY,
    admin_username TEXT
)
''')

# Create AdminLogin table
cursor.execute('''
CREATE TABLE IF NOT EXISTS AdminLogin (
    login_id INTEGER PRIMARY KEY,
    admin_password TEXT,
    admin_last_login DATE,
    admin_id INTEGER,
    admin_email TEXT,
    flag BOOLEAN,
    FOREIGN KEY (admin_id) REFERENCES Admin(admin_id)
)
''')

# Create Achievement table
cursor.execute('''
CREATE TABLE IF NOT EXISTS Achievement (
    achiev_id INTEGER PRIMARY KEY,
    badge BLOB,
    achiev_description TEXT,
    user_id INTEGER,
    achiev_name TEXT,
    FOREIGN KEY (user_id) REFERENCES UserInfo(user_id)
)
''')

# Commit changes and close connection
conn.commit()
conn.close()

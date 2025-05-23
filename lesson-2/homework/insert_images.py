import pyodbc
import os

# Database connection details
server = 'Laptop\\SQLEXPRESS'         
database = 'homeworks_db'              
driver = 'ODBC Driver 17 for SQL Server' 
connection_string = f'DRIVER={driver};SERVER={server};DATABASE={database};Trusted_Connection=yes'

# Connect to SQL Server
conn = pyodbc.connect(connection_string)
cursor = conn.cursor()

# Path to the images
folder_path = os.path.dirname(os.path.abspath(__file__))  # Same folder as the script

# Insert each image from the folder into the database
for file_name in os.listdir(folder_path):
    if file_name.lower().endswith(('.jpg', '.png', '.jpeg')):  # Only process image files
        file_path = os.path.join(folder_path, file_name)       # Full path to the image
        print(f"Inserting image: {file_name}")

        # SQL query to insert image into the `photos` table
        query = f"""
        INSERT INTO photos (image_data)
        SELECT * FROM OPENROWSET(
            BULK '{file_path}',
            SINGLE_BLOB
        ) AS BinaryData
        """
        cursor.execute(query)
        conn.commit()

print("All images have been successfully inserted into the database.")

# Close the connection
cursor.close()
conn.close()
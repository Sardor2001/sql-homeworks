import pyodbc
import os

# Your database connection details
server = 'Laptop\\SQLEXPRESS'          
database = 'homeworks_db'              
driver = 'ODBC Driver 17 for SQL Server' 
connection_string = f'DRIVER={driver};SERVER={server};DATABASE={database};Trusted_Connection=yes'

# Connect to SQL Server
conn = pyodbc.connect(connection_string)
cursor = conn.cursor()

# Retrieve all rows from the `photos` table
cursor.execute("SELECT id, image_data FROM photos")
rows = cursor.fetchall()

# Folder path to save retrieved images (same folder as script)
output_folder = os.path.dirname(os.path.abspath(__file__))

# Save each image to disk
for row in rows:
    image_id = row[0]
    image_data = row[1]

    # Generate a file name for the output image
    output_file_path = os.path.join(output_folder, f'output_image_{image_id}.jpg')
    with open(output_file_path, 'wb') as file:
        file.write(image_data)
        print(f"Saved image {image_id} as {output_file_path}")

print("All images have been retrieved and saved.")

# Close the connection
cursor.close()
conn.close()
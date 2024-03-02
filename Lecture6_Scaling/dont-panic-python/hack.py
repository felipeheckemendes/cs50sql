import sqlite3


conn = sqlite3.connect('dont-panic.db')

password = input("Enter a password: ")

cursor = conn.cursor()
cursor.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username" = 'admin';       
    """,
    (password,)
)

cursor.execute(
    """
    SELECT * FROM "users" WHERE "username" = 'admin';
    """

)

rows = cursor.fetchall()

conn.commit()

print("Hacked!")

print(rows)
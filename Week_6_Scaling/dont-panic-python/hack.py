from cs50 import SQL

db = SQL("sqlite:///dont-panic.db")

pwd = input("Enter a password: ").strip()

if pwd and pwd != " ":
    db.execute(
        """
        UPDATE "users"
        SET "password" = ?
        WHERE "username" = 'admin';
        """,
        pwd
    )



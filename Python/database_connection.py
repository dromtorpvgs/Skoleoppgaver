import mysql.connector
from mysql.connector import errorcode


def connect_database():

    try:
        cnx = mysql.connector.Connect(
                                    user='root',
                                    database='Dromtorp',
                                    password='root',
                                    host='localhost',
                                    port='8889')
        return cnx

    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with your user name or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            print(err)
    else:
        cnx.close()


def select_all_from_elev():

    query = "SELECT * FROM elev"
    cnx = connect_database()

    # Cursor
    cursor = cnx.cursor()

    cursor.execute(query)

    return


if __name__ == '__main__':
    select_all_from_elev()

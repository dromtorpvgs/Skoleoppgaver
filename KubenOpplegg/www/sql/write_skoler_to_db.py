from skoleparser import skoler

import mysql.connector

db = mysql.connector.connect(
  host='localhost',
  user='root',
  password='',
  database='utdanning'
)

cursor = db.cursor()

def write_skole_to_db(s, id):
    sql = """INSERT INTO skole (id, navn, studieplasser, 
    sted, fylke, eierform, koordinater, vigo_kode) 
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"""
    val = (id, s.navn, s.studieplasser, s.sted, s.fylke, 
    s.eierform, s.koordinater, s.vigo_kode)
    cursor.execute(sql, val)

for id, s in enumerate(skoler):
    print(f'Saved {id}:{s.navn}')
    write_skole_to_db(s, id)
    
db.commit()
print(f'{cursor.rowcount} records inserted.')

from bs4 import BeautifulSoup
from collections import defaultdict
from pprint import pprint as p

import pickle
import requests

url = 'https://no.wikipedia.org/wiki/Liste_over_norske_videregående_skoler'



class Skole():
    def __init__(self, navn, sted, fylke, eierform, 
    studieplasser, koordinater, vigo_kode):
        self.navn = navn.strip() #str max len 80
        self.sted = sted.strip() #str max len 17
        self.fylke = fylke.strip() #str max len 20
        self.eierform = eierform.strip() #str max len 9
        try: self.studieplasser = int(studieplasser.replace(' ','').strip()) #int
        except ValueError: self.studieplasser = 0
        self.koordinater = koordinater.strip() #str max len 21
        try: self.vigo_kode = int(vigo_kode.strip()) #int
        except ValueError: self.vigo_kode = 0

    def __repr__(self):
        return self.navn

def import_skoler(url):
    
    r = requests.get(url)
    
    soup = BeautifulSoup(r.text, 'html.parser')

    table = soup.find('table', class_='wikitable sortable') #find main table
    rows = table.find_all('tr') #find all rows in table
    rows = rows[1:] #skip first row

    skoler = [] #to return
    for tr in rows:
        tds = tr.find_all('td')

        navn = tds[0].text 
        sted = tds[1].text
        fylke = tds[2].text
        eierform = tds[3].text
        studieplasser = tds[4].text
        koordinater = tds[5].text
        vigo_kode = tds[6].text

        s = Skole(navn, sted, fylke, eierform, studieplasser, koordinater, vigo_kode)
        skoler.append(s)
    return skoler

skoler = import_skoler(url)

print(skoler)

max = defaultdict(int)

for s in skoler:
    for key, val in vars(s).items():
        try:
            if max[key] < len(val):
                max[key] = len(val)
        except TypeError: #its an int
            max[key] = 0
p(max)

#pickle.dump(skoler, open('skoler.pickle','wb'))

types = defaultdict(str)
"""
types['eierform'] = type(s.eierform)
types['fylke'] = type(s.fylke)
types['koordinater'] = type(s.koordinater)
types['navn'] = type(s.navn)
types['sted'] = type(s.sted)
types['studieplasser'] = type(s.studieplasser)
types['vigo_kode'] = type(s.vigo_kode)
p(types)
"""

"""
ret = defaultdict(str)
for key,val in vars(s).items():
    try:
        ret[key] = int(val)
        print(f'{key} is an integer!')
    except ValueError as e:
        print(f'Couldnt convert val {val} to int')
    ret[key] = val
p(ret)
"""
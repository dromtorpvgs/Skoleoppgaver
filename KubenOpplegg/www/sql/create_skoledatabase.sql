/*
     self.navn = navn.strip() #str max len 80
        self.sted = sted.strip() #str max len 17
        self.fylke = fylke.strip() #str max len 20
        self.eierform = eierform.strip() #str max len 9
        try: self.studieplasser = int(studieplasser.replace(' ','').strip()) #int
        except ValueError: self.studieplasser = 0
        self.koordinater = koordinater.strip() #str max len 21
        try: self.vigo_kode = int(vigo_kode.strip()) #int
        except ValueError: self.vigo_kode = 0
        */

create database utdanning;
use utdanning;

create table skole(
    id int primary key not null,
    navn varchar(255) not null,
    studieplasser int,
    sted varchar(255),
    fylke varchar(255),
    eierform varchar(255),
    koordinater varchar(255)
);
alter table skole(
    add column vigo_kode int,
)
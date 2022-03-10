create database uke11;

use uke11;

--create tables
drop table Konsulent;
create table if not exists Konsulent(
    KonsulentNr int primary key not null,
    Fornavn varchar(255) not null,
    Etternavn varchar(255) not null
);

drop table Kunde;
create table if not exists Kunde(
    KundeNr int primary key not null,
    Navn varchar(255) not null
);

drop table Timeliste;
create table if not exists Timeliste(
    TimelisteNr int primary key not null,
    Maned int not null,
    Ar int not null,
    KonsulentNr int not null,
    foreign key(KonsulentNr) references Konsulent(KonsulentNr)
);

drop table Arbeidsperiode;
create table if not exists Arbeidsperiode(
    ArbeidsperiodeNr int primary key not null,
    DagNrStart int not null,
    DagNrSlutt int not null,
    AntallTimer int not null,
    TimelisteNr int not null,
    foreign key(TimelisteNr) references Timeliste(TimelisteNr),
    KundeNr int not null,
    foreign key(KundeNr) references Kunde(KundeNr)
);


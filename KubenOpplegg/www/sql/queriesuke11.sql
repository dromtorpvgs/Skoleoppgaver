use uke11;

--oppgave 1 List opp konsulenter
select * from konsulent;

--oppgave 2 Vis hvilke konsulenter som førte timeliste i januar 2021.
select t.*, k.fornavn, k.etternavn 
from timeliste t, konsulent k 
where t.ar='2021' 
and t.maned = '1' 
and k.konsulentnr = t.konsulentnr;

--oppgave 3 Vis sum timer for alle konsulentene.
SELECT
    k.fornavn as 'Fornavn',
    k.etternavn as 'Etternavn',
    SUM(a.antalltimer) AS 'Sum timer'
FROM
    konsulent k,
    timeliste t,
    arbeidsperiode a
WHERE
    t.konsulentnr = k.konsulentnr AND a.timelistenr = t.timelistenr
GROUP BY
    k.konsulentnr
ORDER BY 
	SUM(a.AntallTimer) desc

--oppgave 4 Hvilken kunde har brukt flest konsulenttimer?
SELECT
    k.*, sum(a.AntallTimer) as 'Antall timer'
FROM
    kunde k, arbeidsperiode a
where k.kundenr = a.KundeNr
group by k.kundenr
order by sum(a.AntallTimer) desc


--oppgave 5 Summer totalt antall konsulenttimer brukt i 2020.
SELECT
    t.ar AS 'År',
    SUM(a.AntallTimer) AS 'Antall timer'
FROM
    arbeidsperiode a,
    timeliste t
WHERE
    a.timelistenr = t.TimelisteNr
GROUP BY
    t.ar
ORDER BY
    SUM(a.AntallTimer)
DESC
    
--oppgave 6 Hvilke konsulenter har vært hos Norgesgruppen?
SELECT
    k.navn,
    ko.*
FROM
    kunde k,
    arbeidsperiode a,
    timeliste t,
    konsulent ko
WHERE
    k.navn LIKE '%norgesgruppen%' AND a.KundeNr = k.KundeNr 
    AND t.TimelisteNr = a.TimelisteNr AND ko.KonsulentNr = t.KonsulentNr

--oppgave 7 Vis oversikt over konsulent, timer og kunde.

SELECT
    ko.Fornavn,
    ko.Etternavn,
    k.navn,
    t.ar,
    t.maned,
    a.AntallTimer
FROM
    kunde k,
    arbeidsperiode a,
    timeliste t,
    konsulent ko
WHERE
    a.KundeNr = k.KundeNr AND t.TimelisteNr = a.TimelisteNr AND ko.KonsulentNr = t.KonsulentNr
ORDER BY
    ko.Etternavn, k.Navn
DESC
    
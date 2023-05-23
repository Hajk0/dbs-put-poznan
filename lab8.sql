-- 1
INSERT INTO PRACOWNICY(id_prac, nazwisko, etat, id_szefa, zatrudniony, placa_pod, placa_dod, id_zesp)
    VALUES (250, 'KOWALSKI', 'ASYSTENT', NULL, DATE '2015-01-13', 1500, NULL, 10);
INSERT INTO PRACOWNICY(id_prac, nazwisko, etat, id_szefa, zatrudniony, placa_pod, placa_dod, id_zesp)
    VALUES (260, 'ADAMSKI', 'ASYSTENT', NULL, DATE '2014-09-10', 1500, NULL, 10);
INSERT INTO PRACOWNICY(id_prac, nazwisko, etat, id_szefa, zatrudniony, placa_pod, placa_dod, id_zesp)
    VALUES (270, 'NOWAK', 'ADIUNKT', NULL, DATE '1990-05-01', 2050, 540, 20);
SELECT * FROM PRACOWNICY;

-- 2
UPDATE PRACOWNICY
    SET 
    PLACA_POD = PLACA_POD * 1.1,
    PLACA_DOD =  
            CASE
                WHEN PLACA_DOD IS NULL THEN 100
                ELSE PLACA_DOD * 1.2
            END
    WHERE ID_PRAC IN (250,260,270);
SELECT * FROM pracownicy;

-- 3
INSERT INTO ZESPOLY(id_zesp, nazwa, adres)
    VALUES(60, 'BAZY DANYCH', 'PIOTROWO 2');
SELECT * FROM ZESPOLY WHERE id_zesp = 60;

-- 4
UPDATE pracownicy
    SET id_zesp = 60
    WHERE id_prac IN (250, 260, 270);
SELECT * FROM pracownicy WHERE id_zesp = 60;

-- 5
UPDATE pracownicy
    SET id_szefa = (SELECT id_prac FROM pracownicy WHERE nazwisko = 'MORZY')
    WHERE id_zesp = (SELECT id_zesp FROM zespoly WHERE nazwa = 'BAZY DANYCH');
SELECT * FROM pracownicy
    WHERE id_szefa = (SELECT id_prac FROM pracownicy WHERE nazwisko = 'MORZY');

-- 6
--DELETE FROM zespoly WHERE nazwa = 'BAZY DANYCH';
-- zakończyło się błędem ponieważ w zespole 'BAZY DANYCH' znajdują się pracownicy

-- 7
DELETE FROM pracownicy WHERE id_zesp = (SELECT id_zesp FROM zespoly WHERE nazwa = 'BAZY DANYCH');
SELECT * FROM pracownicy;
DELETE FROM zespoly WHERE nazwa = 'BAZY DANYCH';
SELECT * FROM zespoly;

-- 8
SELECT P.nazwisko, P.placa_pod, 
    (SELECT 0.1 * AVG(PZ.placa_pod) FROM pracownicy PZ GROUP BY PZ.id_zesp HAVING PZ.id_zesp = P.id_zesp) AS podwyzka 
    FROM pracownicy P ORDER BY P.nazwisko;

-- 9
UPDATE pracownicy P
    SET placa_pod = (placa_pod + (SELECT 0.1 * AVG(PZ.placa_pod) FROM pracownicy PZ 
        GROUP BY PZ.id_zesp HAVING PZ.id_zesp = P.id_zesp));
SELECT nazwisko, placa_pod FROM pracownicy ORDER BY nazwisko;

-- 10
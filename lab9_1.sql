-- 1
CREATE TABLE projekty (
    id_projektu NUMBER(4, 0) GENERATED ALWAYS AS IDENTITY,
    opis_projektu VARCHAR2(20),
    data_rozpoczecia DATE DEFAULT CURRENT_DATE,
    data_zakonczenia DATE,
    fundusz NUMBER(7, 2)
);

-- 2
INSERT INTO projekty(opis_projektu, data_rozpoczecia, data_zakonczenia, fundusz)
    VALUES ('Indeksy bitmapowe', DATE '1999-04-02', DATE '2001-08-31', 25000);
INSERT INTO projekty(opis_projektu, fundusz)
    VALUES ('Sieci kręgosłupowe', 19000);

-- 3
SELECT id_projektu, opis_projektu FROM projekty;

-- 4
-- INSERT INTO projekty(id_projektu, opis_projektu, data_rozpoczecia, data_zakonczenia, fundusz) VALUES (10, 'Indeksy drzewiaste', DATE '2013-12-24', DATE '2014-01-01', 1200);
INSERT INTO projekty(opis_projektu, data_rozpoczecia, data_zakonczenia, fundusz)
    VALUES ('Indeksy drzewiaste', DATE '2013-12-24', DATE '2014-01-01', 1200);

-- 5
-- UPDATE projekty SET id_projektu = 10 WHERE opis_projektu = 'Indeksy drzewiaste';

-- 6
CREATE TABLE projekty_kopia AS
    SELECT * FROM projekty;
SELECT * FROM projekty_kopia;

-- 7
INSERT INTO projekty_kopia(id_projektu, opis_projektu, data_rozpoczecia, data_zakonczenia, fundusz)
    VALUES (10, 'Sieci lokalne', SYSDATE, ADD_MONTHS(SYSDATE, 12), 24500);

-- 8
DELETE FROM projekty WHERE opis_projektu = 'Indeksy drzewiaste';
SELECT * FROM projekty_kopia;

-- 9
SELECT TABLE_NAME FROM USER_TABLES ORDER BY TABLE_NAME;

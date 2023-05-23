CREATE TABLE projekty (
    id_projektu NUMBER(4, 0) GENERATED ALWAYS AS IDENTITY,
    opis_projektu VARCHAR2(20),
    data_rozpoczecia DATE DEFAULT CURRENT_DATE,
    data_zakonczenia DATE,
    fundusz NUMBER(7, 2)
);

INSERT INTO projekty(opis_projektu, data_rozpoczecia, data_zakonczenia, fundusz)
    VALUES ('Indeksy bitmapowe', DATE '1999-04-02', DATE '2001-08-31', 25000);
INSERT INTO projekty(opis_projektu, fundusz)
    VALUES ('Sieci kręgosłupowe', 19000);

SELECT id_projektu, opis_projektu FROM projekty;

INSERT INTO projekty(opis_projektu, data_rozpoczecia, data_zakonczenia, fundusz)
    VALUES ('Indeksy drzewiaste', DATE '2013-12-24', DATE '2014-01-01', 1200);

CREATE TABLE projekty_kopia AS
    SELECT * FROM PROJEKTY;

INSERT INTO projekty_kopia(id_projektu, opis_projektu, data_rozpoczecia, data_zakonczenia, fundusz)
    VALUES (10, 'Sieci lokalne', SYSDATE, ADD_MONTHS(SYSDATE, 12), 24500);

DELETE FROM PROJEKTY WHERE opis_projektu LIKE '%drzew%';

SELECT TABLE_NAME FROM USER_TABLES ORDER BY TABLE_NAME;

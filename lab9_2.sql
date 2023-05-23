-- 1
ALTER TABLE PROJEKTY
    ADD CONSTRAINT PK_PROJEKTY PRIMARY KEY(ID_PROJEKTU);
ALTER TABLE PROJEKTY
    ADD CONSTRAINT UK_PROJEKTY UNIQUE(OPIS_PROJEKTU);
ALTER TABLE PROJEKTY
    MODIFY OPIS_PROJEKTU NOT NULL;
ALTER TABLE PROJEKTY
    ADD CONSTRAINT DATA_ZAKONCZENIA_CHECK CHECK(DATA_ZAKONCZENIA > DATA_ROZPOCZECIA);
ALTER TABLE PROJEKTY
    ADD CONSTRAINT FUNDUSZ_CHECK CHECK(FUNDUSZ > 0);
SELECT * FROM USER_CONSTRAINTS
    WHERE TABLE_NAME = 'PROJEKTY';

-- 2
INSERT INTO PROJEKTY(OPIS_PROJEKTU, DATA_ROZPOCZECIA, DATA_ZAKONCZENIA, FUNDUSZ)
    VALUES('Indeksy bitmapowe', DATE '2015-04-12', DATE '2016-09-30', 40000);

-- 3
CREATE TABLE PRZYDZIALY(
    ID_PROJEKTU NUMBER(4),
    NR_PRACOWNIKA NUMBER(6),
    OD DATE DEFAULT CURRENT_DATE,
    DO DATE,
    STAWKA NUMBER(7, 2)
)










SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE FROM USER_CONSTRAINTS
    WHERE TABLE_NAME = 'PROJEKTY';
SELECT CONSTRAINT_NAME, COLUMN_NAME FROM USER_CONS_COLUMNS
    WHERE TABLE_NAME = 'PRACOWNICY'
    ORDER BY CONSTRAINT_NAME, POSITION;
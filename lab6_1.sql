SELECT NAZWISKO, ETAT, ID_ZESP FROM PRACOWNICY
    WHERE ID_ZESP = (SELECT ID_ZESP FROM PRACOWNICY
        WHERE NAZWISKO = 'BRZEZINSKI')
    ORDER BY NAZWISKO;

SELECT NAZWISKO, ETAT, Z.NAZWA 
    FROM PRACOWNICY P JOIN ZESPOLY Z
        ON Z.ID_ZESP = P.ID_ZESP
    WHERE P.ID_ZESP = (SELECT ID_ZESP FROM PRACOWNICY
        WHERE NAZWISKO = 'BRZEZINSKI')
    ORDER BY NAZWISKO;

SELECT NAZWISKO, ETAT, ZATRUDNIONY FROM PRACOWNICY
    WHERE (ZATRUDNIONY, ETAT) IN (SELECT MIN(ZATRUDNIONY), 'PROFESOR' FROM PRACOWNICY
        WHERE ETAT = 'PROFESOR');

SELECT NAZWISKO, ZATRUDNIONY, ID_ZESP FROM PRACOWNICY
    WHERE ZATRUDNIONY IN (SELECT MAX(ZATRUDNIONY) FROM PRACOWNICY
        GROUP BY ID_ZESP HAVING ID_ZESP IS NOT NULL)
    ORDER BY ZATRUDNIONY;

SELECT ID_ZESP, NAZWA, ADRES FROM ZESPOLY
    WHERE ID_ZESP NOT IN (SELECT ID_ZESP FROM PRACOWNICY GROUP BY ID_ZESP HAVING ID_ZESP IS NOT NULL);

SELECT NAZWISKO FROM PRACOWNICY
    WHERE ETAT = 'PROFESOR' AND ID_PRAC NOT IN (SELECT ID_SZEFA FROM PRACOWNICY WHERE ETAT = 'STAZYSTA');

SELECT ID_ZESP, SUM(PLACA_POD) FROM PRACOWNICY
    GROUP BY ID_ZESP HAVING SUM(PLACA_POD) = (SELECT MAX(SUM(PLACA_POD)) FROM PRACOWNICY GROUP BY ID_ZESP);

SELECT NAZWA, (SELECT MAX(SUM(PLACA_POD)) FROM PRACOWNICY GROUP BY ID_ZESP) FROM ZESPOLY
    WHERE ID_ZESP = (SELECT ID_ZESP FROM PRACOWNICY
        GROUP BY ID_ZESP HAVING SUM(PLACA_POD) = (SELECT MAX(SUM(PLACA_POD)) FROM PRACOWNICY GROUP BY ID_ZESP));
    
SELECT NAZWA, COUNT(*) AS ILU_PRACOWNIKOW
    FROM PRACOWNICY P JOIN ZESPOLY Z 
    ON P.ID_ZESP = Z.ID_ZESP
    GROUP BY Z.NAZWA
    HAVING COUNT(*) > (SELECT COUNT(*) FROM PRACOWNICY P JOIN ZESPOLY Z ON P.ID_ZESP = Z.ID_ZESP WHERE Z.NAZWA = 'ADMINISTRACJA')
    ORDER BY Z.NAZWA;

SELECT P.ETAT
    FROM PRACOWNICY P JOIN ETATY E
    ON P.ETAT = E.NAZWA
    GROUP BY E.NAZWA
    HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM PRACOWNICY P JOIN ETATY E ON P.ETAT = E.NAZWA GROUP BY E.NAZWA)
    ORDER BY E.NAZWA;

SELECT P.ETAT, LISTAGG(P.NAZWISKO, ',') WITHIN GROUP (ORDER BY NAZWISKO) AS PRACOWNICY 
    FROM PRACOWNICY P JOIN ETATY E
    ON P.ETAT = E.NAZWA
    GROUP BY E.NAZWA
    HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM PRACOWNICY P JOIN ETATY E ON P.ETAT = E.NAZWA GROUP BY E.NAZWA)
    ORDER BY E.NAZWA;

SELECT P.NAZWISKO AS PRACOWNIK, S.NAZWISKO AS SZEF
    FROM PRACOWNICY P JOIN PRACOWNICY S
        ON P.ID_SZEFA = S.ID_PRAC
    WHERE (S.PLACA_POD - P.PLACA_POD) = (SELECT MIN(S.PLACA_POD - P.PLACA_POD) FROM PRACOWNICY P JOIN PRACOWNICY S ON P.ID_SZEFA = S.ID_PRAC);

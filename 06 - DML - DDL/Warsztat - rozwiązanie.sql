--1. Stwórz bazę danych

CREATE DATABASE warsztat_sql;


--2. Dodaj tabelę produkty
CREATE TABLE produkty (
    id SERIAL PRIMARY KEY,
    nazwa VARCHAR(100) NOT NULL,
    cena NUMERIC(10,2),
    ilosc INT DEFAULT 0
);

--3,4,5 Zmodyfikuj kolumy
ALTER TABLE produkty
ADD COLUMN opis TEXT;

ALTER TABLE produkty
ALTER COLUMN cena TYPE FLOAT;

ALTER TABLE produkty
DROP COLUMN opis;

--6.
INSERT INTO produkty (nazwa, cena, ilosc)
VALUES
('Jabłko', 1.50, 100),
('Gruszka', 2.00, 50),
('Banan', 1.20, 80);

--7
UPDATE produkty
SET cena = cena * 1.10
WHERE nazwa = 'Banan';

--8
DELETE FROM produkty
WHERE ilosc < 10;


---Z użyciem foreign KEY
CREATE TABLE klienci (
    id SERIAL PRIMARY KEY,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL
);


CREATE TABLE zamowienia (
    id SERIAL PRIMARY KEY,
    data_zamowienia DATE NOT NULL,
    kwota NUMERIC(10,2) NOT NULL,
    klient_id INT NOT NULL,
    CONSTRAINT fk_klient
        FOREIGN KEY (klient_id)
        REFERENCES klienci(id)
        ON DELETE CASCADE
);


INSERT INTO klienci (imie, nazwisko)
VALUES
('Anna', 'Kowalska'),
('Piotr', 'Nowak');


INSERT INTO zamowienia (data_zamowienia, kwota, klient_id)
VALUES
('2025-04-28', 250.00, 1),
('2025-04-28', 150.00, 2);

DELETE FROM klienci
WHERE id = 1;

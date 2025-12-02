
-- Anton Eriksson YH25

CREATE DATABASE bokkis; -- skapar databasen för en liten bokhandel med namn bokkis
USE bokkis; -- går in på databasen för att kunna ändra innehållet.


 -- Skapa Kunder-tabellen 
CREATE TABLE Kunder (   
    KundID INT AUTO_INCREMENT PRIMARY KEY, -- Ett unikt nummer så att man lätt kan hitta rätt kund.
    Namn VARCHAR(100) NOT NULL, 
    Epost VARCHAR(255) UNIQUE NOT NULL, 
    Telefon VARCHAR(30) NOT NULL,
    Adress VARCHAR(100) NOT NULL
);

 -- Skapa Bocker-tabellen
CREATE TABLE Bocker (  
    ISBN BIGINT PRIMARY KEY, -- Ett unikt id för varje bok så att man vet vilken bok det är.
    Forfattare VARCHAR(100) NOT NULL,
    Genre VARCHAR(50) NOT NULL,
    Titel VARCHAR(50) NOT NULL,
    Pris DECIMAL(10,2) NOT NULL CHECK (Pris > 0),  -- "CHECK" kollar så att värdet är större än 0.
    Lagerstatus INT NOT NULL
);

-- Skapa Bestallningar-tabellen 
CREATE TABLE Bestallningar ( 
	Ordernummer INT AUTO_INCREMENT PRIMARY KEY, -- Ett unikt id för varje ordernummer så att man vet vilken bok det är.
    KundID INT NOT NULL,
    Totalbelopp DECIMAL(10,2) NOT NULL CHECK (Totalbelopp > 0), -- "CHECK" kollar så att värdet är större än 0.
    Datum TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (KundID) REFERENCES Kunder(KundID) -- Hämtar primärnyckel från KundID i Kunder-tabellen.
);


-- Skapa Orderrader-tabellen 
CREATE TABLE Orderrader (   
    OrderradID INT AUTO_INCREMENT PRIMARY KEY, -- Ett unikt id för varje orderrad så att man vet vilken bok det är.
    ISBN BIGINT NOT NULL,
    Ordernummer INT NOT NULL,
    Antal INT NOT NULL CHECK (Antal > 0), 
    FOREIGN KEY (Ordernummer) REFERENCES Bestallningar(Ordernummer), -- Lånar primärnyckel från ordernummer i Bestallningar-tabellen.
    FOREIGN KEY (ISBN) REFERENCES Bocker(ISBN) -- Hämtar primärnyckel från ISBN i Böcker-tabellen.
);


-- infogar data i Böcker-tabellen
INSERT INTO Bocker (ISBN, Forfattare, Genre, Titel, Pris, Lagerstatus) VALUES 
    ('9781234500012', 'Lena Falk', 'Fantasy', 'Skogarnas Hemlighet', 149.00, 8), 
    ('9781234500029', 'Torvald Rane', 'Fantasy', 'Eldmärkta', 179.00, 4),
    ('9781234500036', 'Selma Nyström', 'Äventyr', 'Stormens Vandrare', 129.00, 12);


-- Infogar data i Kunder-tabellen
INSERT INTO Kunder (Namn, Epost, Telefon, Adress) VALUES 
    ('Elora Månväktare', 'elora.moon@realm.com', '0706169779', 'Skymningsdalen'),
    ('Brann Järnax', 'brann.iron@realm.com', '0708659852', 'Hammarslätten'),
    ('Mira Solvind', 'mira.wind@realm.com', '0796784512', 'Solgläntan');


-- infogar data i Beställningar-tabellen
INSERT INTO Bestallningar (KundID, Totalbelopp) VALUES
    (1, 149.00),     
    (2, 179.00),
    (3, 258.00);   -- två böcker i denna order


-- infogar data i Orderrader-tabellen
INSERT INTO Orderrader (ISBN, Ordernummer, Antal) VALUES
    (9781234500012, 1, 1),  
    (9781234500029, 2, 1),   
    (9781234500036, 3, 2);

-- För att få fram resultat visuellt från tabellerna.

SELECT * FROM Kunder;            -- Hämtar data från Kunder-tabellen.
SELECT * FROM Bocker;            -- Hämtar data från Böcker-tabellen.
SELECT * FROM Orderrader;        -- Hämtar data från Orderrader-tabellen.
SELECT * FROM Bestallningar;     -- Hämtar data från Bestallningar-tabellen.


-- Hämtar specifik kund
SELECT * FROM Kunder WHERE Namn = 'Elora Månväktare';

-- Hämtar böcker som kostar mer än 100 kr
SELECT * FROM Bocker WHERE Pris > 100;

-- Sorterar böcker efter pris, dyrast först
SELECT * FROM Bocker ORDER BY Pris DESC;

-- Hämtar ordernummer där kunden beställt mer än 1 exemplar
SELECT Ordernummer FROM Orderrader WHERE Antal > 1;

-- Hämtar beställningar där totalbeloppet överstiger 100 kr
SELECT * FROM Bestallningar WHERE Totalbelopp > 100;




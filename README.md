# 📘 Liten Bokhandel – Relationsdatabas  
**Inlämning 1 – av Anton Eriksson (YH25)**

Detta projekt består av en relationsdatabas framtagen för en liten bokhandel med e-handel som fokus. Systemet låter kunder registrera sig, lägga beställningar och köpa böcker genom en strukturerad och tydligt kopplad databasmodell.

---

## 🧩 Databasens struktur

Databasen bygger på tydliga relationer mellan kunder, böcker och beställningar. Den möjliggör:

- En kund kan ha **flera beställningar** (1–M)  
- En bok kan förekomma i **många beställningar** (1–M)  
- En beställning kan innehålla **flera orderrader** (1–M)  
- En **Många-till-Många (N:M)** relation mellan böcker och beställningar genom tabellen `Orderrader`

---

## 📋 Tabeller i databasen

### **1. Kunder**  
Innehåller unik kundinformation såsom namn, e-post och adress.

### **2. Beställningar**  
Representerar kundernas ordrar och kopplas till kunder via `KundID`.

### **3. Böcker**  
Butikens produkter. Varje bok har ett unikt ISBN-nummer.

### **4. Orderrader**  
Kopplar samman böcker och beställningar. Varje rad pekar på:
- en specifik bok (ISBN)
- en specifik beställning (Ordernummer)

`Orderrader` är tabellen som realiserar N:M-relationen.

---

## 🗺️ ER-diagram

Databasens ER-diagram illustrerar relationerna mellan tabellerna:



---


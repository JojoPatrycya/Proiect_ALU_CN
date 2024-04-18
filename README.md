
---
# Modul ALU în Verilog

Acest proiect implementează un modul Arithmetic Logic Unit (ALU) în Verilog. ALU poate efectua diverse operații aritmetice și logice în funcție de codul operațional dat.

## Prezentare generală

Modulul ALU suportă următoarele operații:
- Adunare
- Scădere
- Înmulțire
- Divizare
- Shift la stânga
- Shift la dreapta
- XOR
- XNOR
- NOT
- AND
- SAU
- Înmulțire Booth
- Divizie non-restorativă

Fiecare operație este implementată ca un modul separat în cadrul proiectului.

## Module

Proiectul constă în următoarele module:

- `FullAdder`: Implementeaza un modul Full-Adder pentru operatiile de adunare
- `ADD`: Efectuează adunarea a două numere pe 16 biți.
- `SUB`: Efectuează scăderea a două numere pe 16 biți.
- `MUL`: Efectuează înmulțirea a două numere pe 16 biți.
- `BOOTH_4`: Implementează algoritmul lui Booth pentru înmulțire.
- `DIV`: Efectuează divizarea a două numere pe 16 biți.
- `non_rest_div`: Implementează algoritmul de divizare Non-Restoring.
- `SHIFT_LEFT`: Efectuează deplasarea unui număr pe 16 biți la stânga cu un număr specificat de biți.
- `SHIFT_RIGHT`: Efectuează deplasarea unui număr pe 16 biți la dreapta cu un număr specificat de biți.
- `XOR`: Efectuează operația XOR pe biții a doi numere pe 16 biți.
- `XNOR`: Efectuează operația XNOR pe biții a doi numere pe 16 biți.
- `NOT`: Efectuează operația NOT pe biții unui număr pe 16 biți.
- `AND`: Efectuează operația AND pe biții a doi numere pe 16 biți.
- `OR`: Efectuează operația OR pe biții a doi numere pe 16 biți.
- `ALU16`: Modulul principal ALU care integrează toate operațiile în funcție de opcode.



## Proiect realizat de: 

- Bizoi Fabian-Mario
- Blaga Cristian-Marian
- Daichendt Ioana-Patricia


---

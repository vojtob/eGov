# Kvalita dát

| Kritérium | Popis |
|-----------|-------|
| Referenčná integrita | Percento údajov v objekte evidencie, ktoré sú stotožnené s relevantnými referenčnými údajmi. Percento subjektov evidencie, ktoré majú jednoznačný referencovateľný identifikátor|
| Strojová spracovateľnosť | 5* konvencia |
|  ||
|||
|||
|||

## Referenčná integrita
Týka sa referenčných a referencovaných údajov.

V referenčnom registri musíme pre referenčný údaj uviesť jeho identifikátor
* celkový počet údajov
* počet duplicít
* počet údajov, ktoré nemajú žiaden identifikátor - to je snáď nula

Ak je údaj evidovaný v referenčnom registri, tak IS musí povinne referencovať svoje údaje na referenčný register. Napríklad fyzická alebo právnická osoba musí byť referencovaná na RFO/RPO. 
* Celkový počet údajov
* Objekt je referencovaný na referenčný register
  * Údaje v mojom IS sú synchronizované s údajmi referenčného registra
  * Údaje v mojom IS nie sú synchronizované s údajmi referenčného registra
* Objekt nie je referencovaný na referenčný register
  * Objekt sme sa nepokúsili stotožniť s referenčným registrom, napr. historické údaje
  * Objekt sa v referenčnom registri nenašiel, a ani sa nájsť nemal (napr. zahraničná osoba, ktorá nie je evidovaná v RFO)
  * Objekt sa v referenčnom registri nenašiel, ale mal by sa nájsť
  * Objekt sa nepodarilo jednoznačne identifikovať
  


  
  
## Strojová spracovateľnosť
  


Kvalita referenčného identifikátora
* je použiteľný navonok?
* je jednoznačný?
* je vo forme URI
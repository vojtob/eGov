# Kvalita dát

* Niektoré kritériá sú **kvalitatívne/architektonické**. Sú dlhodobejšie charakteru, nemá zmysel ich vyhodnocovať často. Zmena je viazaná na rozhodnutie vlastníka dát zmeniť napríklad procesy, dátový model a podobne. Posúdenie spĺňania týchto kritérií sa nedá vždy automatizovať a môže vyžadovať manuálne posúdenie. Príkladom je posúdenie, či je identifikátor objektu dobre navrhnutý. 
* Druhá skupina kritérií sú **kvantitatívne/dátové**. Tieto kritériá sa dajú vyhodnocovať automatizovane, ako pribúdajú dáta do registra, ich hodnota sa priebežne mení. Predpokladá sa, že sa budú vyhodnocovať v pravidelných, nie príliš dlhých intervaloch. Príkladom je posúdenie či sú vyplnené atribúty objektu. Aj pri tomto druhu kritérií môže dôjsť k významným skokom, ak vlastník dát zavedie nový proces, napr. default hodnoty pre atribúty objektu.



## Referenčná integrita

Referenčná integrita hovorí o kvalite využívania údajov medzi referenčným registrom ktorý údaj poskytuje a konzumentom, ktorý údaj používa.

### Kvalita referenčného identifikátora

Zmyslom existencie registra je evidovať informácie o objektoch, napr. Register fyzických osôb registruje fyzické osoby, Register vozidiel registruje vozidlá, Obchodný register registruje obchodné spoločnosti, ... . **Referenčná integrita** vyžaduje, aby mal každý takýto objekt priradený referencovateľný identifikátor, ktorý potom využijú konzumenti dát na referencovanie objektu.

1. **Kompletnosť referenčného identifikátora** - či majú všetky objekty evidencie priradený referenčný identifikátor. Vypočíta sa ako podiel počtu objektov, ktoré majú priradený referenčný identifikátor, ku počtu všetkých objektov. Napríklad, v registri vozidiel je definovaných 100 000 vozidiel, z toho 90 000 má priradený referenčný identifikátor, hodnota tohto ukazovateľa je 0,9 alebo 90%. Ide kvantitatívny/dátový ukazovateľ. Predpokladáme, že hodnota tohto ukazovateľa bude zväčša vysoká, chýbať môže iba pri niektorých historických ukazovateľoch
1. **Jedinečnosť referenčného identifikátora** - či sa nepoužíva rovnaký identifikátor pre rôzne objekty. Vypočíta sa ako podiel počtu objektov s opakujúcim sa identifikátorom, ku počtu všetkých objektov. Napríklad, v registri vozidiel je definovaných 100 000 vozidiel, z toho 300 má priradený referenčný identifikátor použitý viac krát, hodnota tohto ukazovateľa je 0,003 alebo 0,3%. Ide kvantitatívny/dátový ukazovateľ. Predpokladáme, že hodnota tohto ukazovateľa bude zväčša veľmi nízka. Príkladom je napr. nejednoznačné rodné číslo, opakujúce sa ičo a podobne.
1. **Použiteľnosť referencovateľného identifikátora** - kvalitatívny/architektonický ukazovateľ. Napr. použitie rodného čísla ako súčasť referencovateľného identifikátora zabraňuje jeho zverejňovaniu, čím sa stáva nepoužiteľným mimo chránených systémov VS.
1. **Stabilita referencovateľného identifikátora** - kvalitatívny/architektonický ukazovateľ. Napr. ak je priezvisko súčasťou identifikátora, dá sa očakávať, že sa časom zmení v nemalom počte prípadov, čo komplikuje jeho použitie. Snahou je navrhnúť identifikátor tak, aby sa nikdy nemenil. 
1. **Formát referencovateľného identifikátora** - kvalitatívny/architektonický ukazovateľ. Očakáva sa, že referencovateľné identifikátory budú mať formát URI, pozri [MetaIS](https://metais.finance.gov.sk/howto/URI.URI/URI_HOWTO)
1. **Interoperabilita referencovateľného identifikátora** - kvalitatívny/architektonický ukazovateľ. Je vhodné, aby referencovateľný identifikátor bol navrhnutý v súlade s ontológiami, best practises zo zahraničia, aby sa zjednodušilo jeho použitie pri integrácii.

Kvalita referencovateľného identifikátora sa netýka iba už vyhlásených referenčných registrov. Každý register obsahuje aspoň jeden objekt ktorý spravuje. Bez ohľadu na to, či tieto údaje sú alebo nie sú vyhlásené za referenčné, cieľom je, aby v krátkej dobe za referenčné vyhlásené boli a preto treba dbať na hodnotenie kvality.


### Referenčná integrita z pohľadu konzumenta údajov

Z pohľadu konzumenta údajov referenčná integrita znamená, či využíva referenčné údaje iných registrov. Nižšie uvedené kritériá majú zmysel aj pre registre, ktoré zatiaľ nie sú vyhlásené za referenčné, pretože referencovanie údajov zvyšuje ich kvalitu aj v takomto prípade.

1. **Počet referencovaných objektov** - kvalitatívny/architektonický ukazovateľ, ktorý hovorí, koľko objektov sa pokúšame referencovať. Napríklad register vecí eviduje informácie o vlastníkovi a používateľovi, pričom vlastníka referencuje na RFO/RPO, ale používateľa nereferencuje. Napriek tomu, že v takomto prípade by sa dalo povedať, že referencovanie je 50%, hodnotnejšia informácia je, čo sa vlastne referencuje a čo nie. Zároveň môže byť pravdou, že osoba sa referencuje voči RPO ale nie voči RFO, čo je čiastočné referencovanie, preto hodnotenie číslom nie je výstižné. Cieľom je pre každý atribút, ktorý je evidovaný v inom registri povedať, či ho referencujeme alebo nie. Súčasťou vyhodnocovania kvality referencovania je aj informácia, či sa údaje automaticky upravujú podľa zmien v referenčnom registry, napr. či sa po zmene mena v RFO zmena prejaví aj v registri vecí. Možné prístupy sú po publikovaní informácie o zmene referečným registrom, pravidelným zisťovaním zmien, neupdatuje sa, ... .
1. **Podiel referencovaných objektov** - kvantitatívny/dátový ukazovateľ. Pre každý atribút, ktorý referencujeme sa vyhodnocuje podiel objektov ktoré sa podarilo referencovať. V predchádzajúcom ukazovateli sme spomenuli, že napr. register vecí referencuje vlastníka voči RFO/RPO. Tento ukazovateľ je rovný podielu počtu vlastníkov, ktorých sa podarilo referencovať, voči počtu všetkých vlastníkov. Ak napr. je v registri 10 000 vlastníkov, pričom 8 000 z nich sa podarilo referencovať voči RFO/RPO, tak hodnota ukazovateľa je 80%. Pre nestotožnené údaje môžeme doplniť upresňujúcu informáciu o tom, prečo sa nepodarilo údaj stotožniť: 
    * Objekt sme sa nepokúsili stotožniť s referenčným registrom, napr. historické údaje
    * Objekt sa v referenčnom registri nenašiel, a ani sa nájsť nemal (napr. zahraničná osoba, ktorá nie je evidovaná v RFO)
    * Objekt sa v referenčnom registri nenašiel, ale mal by sa nájsť
    * Objekt sa nepodarilo jednoznačne identifikovať (napr. sme našli viacero osôb)

	
	
  
## Kvalita dát

Referenčná integrita sa zameriava na možnosť použitia údajov naprieč verejnou správou a nehovorí o samotnej kvalite dát. Ďalšie kritériá kvality sa venujú práve kvalite jednotlivých údajov.

Pri ich vyhodnocovaní sa sústredíme na dáta, ktoré sú doménou daného registra, nie na referencované údaje. Napríklad, ak hovoríme o registri vozidiel, tak nás zaujíma kvalita údajov ako typ vozidla, rok výroby. Aj pri vlastníkovi vozidla, ktorý by mal byť referencovaný na RFO/RPO nás zaujíma jeho kvalita. Ale nezaujímame sa o kvalita mena, priezviska, adresy, ... vlastníka, pretože tieto údaje by sa mali preberať z referenčného registra a ich kvalita je jeho zodpovednosť. Podmienkou je preberanie týchto údajov z referenčného registra, čo je ale hodnotené kritériom referenčná integrita a jeho jednotlivými ukazovateľmi. Špeciálnym prípadom je, ak nevieme objekt stotožniť s referenčným regitrom, v takomto prípade je zodpovednosť za dáta na našej strane a musíme ich kvalitu vyhodnocovať.

V ďalšej časti popíšeme jednotlivé kritéria a ukazovatele hodnotenia kvality údajov. Dôležité je povedať, že v mnohých prípadoch má zmysel dáta registra rozdeliť a počítať na nich kritériá dátovej kvality. Napríklad počítať ich zvlášť pre záznamy zpred roku 2015 a po ňom, pri čom vieme, že pre historické údaje bude kvalita údajov nižšia, ale pre novšie údaje je vďaka zavedeným procesom kvalita údajov vysoká. Takto rozdelený údaj dáva podstatne lepšiu informáciu ako súhrnné číslo. Dáta je možné deliť aj na základe iných kritérií, napr. osobné vs. úžitkové vozidlá, fyzické vs. právnické osoby a podobne.


1. **Strojová spracovateľnosť** meria ako jednoducho je možné údaje automatizovane spracovať. Najčastejšie používaná je [5★ Open Data stupnica](https://5stardata.info/en/). Hovorí o štruktúrovanosti / formáte v ktorom sú dáta poskytované, od strojovo nespracovateľného (napr. pdf), cez proprietárne formáty (napr. excel), cez otvorené formáty (napr. xml, json, csv) až po rdf a lod formát. Ide kvalitatívne/architektonické kritérium.
1. **Aktuálnosť** hovorí, či sú dáta aktuálne, alebo hrozí, že sú tam aj staršie údaje. Problémy s aktuálnosťou údajov môže byť komplikované strojovo identifikovať. Často sú spôsobované komplikovanými procesmi, ktorými sú dáta zapisované do ISVS. Ide o kvalitatívne/architektonické kritérium. Typické hodnoty tohto kritéria sú:
    * Dáta sú aktualizované v systéme okamžite po prijatí rozhodnutia, v ideálnom prípade sa rozhodnutie robí priamo v registri alebo sa do neho automatizovane prenáša.
	* Dáta sú aktualizované automatizovaným spôsobom v pravidelných časových intervaloch. Napríklad prenos údajov z distribuovaných systémov do centra každú noc, raz týždenne a podobne.
	* Údaje sú pravidelne prepisované do systému. Ide o systémový problém, chýbajúca automatizácia nezaručuje aktuálnosť dát.
	* Údaje nie sú aktualizované.
Údaje musia byť aktuálne, časovo príslušné. Nemalo by sa stať, že OVM vydá rozhodnutie, ale do ISVS príslušné údaje zapisuje iba raz za týždeň a teda údaje v registri niekoľko dní nezodpovedajú skutočnosti. 
Ďalšie zdržanie môže byť napríklad medzi zaevidovaním údaju v zdrojovom registri a jeho následnom spracovaní v referenčnom registri. 
Pokiaľ údaj v ISVS nie je, je ťažké zistiť, že nie je aktuálny, nemusí byť jasné, s čím sa má porovnať. 
1. **Kompletnosť** – či sú všetky povinné údaje vyplnené. Podobne ako kompletnosť referenčného identifikátora, ide o kvantitatívny/dátový ukazovateľ. Počíta sa pre každý povinný atribút zvlášť ako podiel počtu vyplnených atribútov, ku počtu všetkých objektov.
1. **Unikátnosť** hovorí o duplicitách v dátach. Spomínaná bola už pri referencovateľných identifikátoroch, kde sa požaduje aby každý identifikátor bol jedinečný. Táto požiadavka môže mať zmysel aj pre iné atribúty, napr. v registri daňových subjektov nemajú dva rôzne subjekty odkazovať na tú istú právnickú či fyzickú osobu. Alebo v obchodnom registri by mal byť názov obchodnej spoločnosti jedinečný, napriek tomu, že nie je referenčným identifikátorom (lebo sa môže v čase meniť). Ide o kvantitatívny/dátový ukazovateľ. Vyhodnocujeme ho podobne ako jedinečnosť referenčného identifikátora, ako podiel počtu objektov s opakujúcim sa identifikátorom, ku počtu všetkých objektov. Napríklad, ak je v obchodnom registri 100 000 obchodných spoločností, z toho 100 má opakujúci sa názov (nie všetkých 100 jeden názov, ale 100 spoločností má názov, ktorý má aj nejaká iná spoločnosť), tak hodnota tohto ukazovateľa je 0,001 alebo 0,1%. Príkladom s názvom obchodnej spoločnosti naznačuje, že toto kritérium môžeme chápať aj o niečo všeobecnejšie, napríklad, že dve spoločnosti majú nie úplne zhodný názov, ale názov, ktorá je príliš podobný, čo tiež nie je dobre. Dá sa povedať, že _unikátnosť_ je špeciálnym prípadom kriéria _konzistentnosť_ alebo _správnosť_.
1. **Konzistentnosť** – či sú splnené základné logické podmienky, napr. či je dátum narodenia pred dátumom úmrtia, minimálna hodnota musí byť menšia ako maximálna a podobne. Počítame zvlášť pre každý atribút alebo skupinu atribútov, ide o kvantitatívne/dátové ukazovatele špecifické pre daný systém. Počítame ako podiel počtu záznamov ktoré spĺňajú podmienku, proti celkovému počtu záznamov.
1. **Správnosť** – či formát údajov zodpovedá definovaným pravidlám. Ide o kvantitatívne/dátové ukazovatele, ktoré počítame zvlášť pre každý atribút alebo skupinu atribútov ako podiel počtu záznamov ktoré spĺňajú podmienku, proti celkovému počtu záznamov. Delíme ich na dve skupiny:
    * Spoločné kritériá definuje [výnos MFSR 55/2014 o štandardoch pre ISVS](https://www.vicepremier.gov.sk/sekcie/informatizacia/governance-a-standardy/standardy-isvs/vynos-o-standardoch/index.html). Príkladom je používanie centrálnych číselníkov (napr. číselník obcí), použitie definovaných dátových prvkov a podobne.
	* Kritériá špecifické pre daný systém, napríklad počet desatinných miest, formát dátumu, maximálna dĺžka reťazca a podobne.
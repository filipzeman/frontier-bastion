# Living Settlement — Herní cyklus (GAME_LOOP)

> **Pracovní návrh · Godot · říjen 2026**  
> Tento dokument zachycuje, **proč by hráč chtěl prožít další den**, jak se propojují budování, expedice a obrana a odkud pramení zajímavá rozhodnutí. **Není to roadmapa ani seznam povinných implementací.** Autor hry určuje tempo vývoje i výsledná pravidla.
>
> **Původ myšlenek:** Základ vychází z `GAME_VISION.md` a našich diskusí: osobní vztah k obyvatelům, trvalé pracovní role, svět se svou historií, expedice ubírající pracovní sílu, vzácnější nebezpečí se skutečnými následky a možnost zotavení. Konkrétní návrhy označené **[NÁVRH]** jsou nová pracovní konkretizace k diskusi, nikoliv již odsouhlasené pravidlo.

## 1. Jedna věta, která popisuje hru

**Veď malou skupinu trpaslíků při obnově jejich domova, rozhoduj, do čeho investují svůj omezený čas, objevuj příležitosti za hranicemi osady a připravuj se na nebezpečí, která mohou změnit její příběh.**

Hra není o maximalizaci produkce za každou cenu. Je o vytváření místa, ke kterému má hráč vztah — a o rozhodnutích, která ten vztah prohlubují.

## 2. Srdce hry: jedna stále se vracející otázka

**„Co je teď pro naši vesnici nejdůležitější a co kvůli tomu odložíme?“**

Trpaslík přidělený na stavbu nemůže současně těžit. Trpaslík vyslaný na expedici chybí doma. Strážný pomáhá s bezpečím, ale nevyrábí nástroje. Dřevo použité na novou dílnu už není rezervou na opravy.

Smyslem není zahlcovat hráče každou minutou. Smyslem je, aby jeho rozhodnutí měla **srozumitelné náklady, viditelné důsledky a nové příležitosti**.

### Základní smyčka (core loop)

```text
Pozoruji vesnici a okolní svět
          ↓
Rozpoznám příležitost / potřebu / hrozbu
          ↓
Rozhodnu o prioritě a rozdělím omezené lidi, čas a zásoby
          ↓
Trpaslíci vykonávají práci podle svých rolí a situace
          ↓
Svět na jejich činy reaguje
          ↓
Získám zdroje, znalosti a bezpečí — nebo utrpím ztráty
          ↓
Změní se možnosti, vztahy a rizika
          ↺
```

**Hráč plánuje, obyvatelé vykonávají.** Hráč nemusí ručně ovládat Borinovu sekeru; musí však chápat, proč si Borin vybral daný strom a co mu brání v práci.

## 3. Rytmus jednoho herního dne

Denní cyklus nemá být povinnou posloupností obrazovek. Je to rytmus simulace, který hráč může pozorovat a ovlivňovat.

| Fáze | Co se děje ve světě | Zajímavé rozhodnutí hráče |
|---|---|---|
| Ráno | Obyvatelé navazují na své role, spotřebovávají zásoby, připravují práci. | Změnit priority, nebo nechat vesnici běžet? |
| Pracovní den | Těžba, doprava, stavby, výroba; expedice jsou na cestě. | Koho dočasně přesunout tam, kde je potřeba? |
| Odpoledne / večer | Práce dobíhá, lidé se vracejí, úkoly se mohou přerušit. | Riskovat další práci mimo bezpečí, nebo se stáhnout? |
| Noc | Vesnice odpočívá; mohou působit počasí, únava a výjimečné události. | Jak jsme připraveni, pokud přijde problém? |
| Další den | Přetrvávají změny: zásoby, stavby, vztahy, zranění, objevy. | Co se po včerejšku změnilo v našich plánech? |

**[NÁVRH]** Čas by měl být čitelný a ideálně umožňovat změnu rychlosti nebo pauzu. Zda práci a spotřebu počítat kontinuálně, po krocích simulace, či po dnech, je technické rozhodnutí; herní pravidla na tom nemusejí záviset.

**Důležité:** Ne každý den musí nabídnout drama. Často stačí příjemný pocit, že se **něco o kousek posunulo**: hotová střecha, nové dřevo ve skladu, zkušenější učedník, vracející se výprava.

## 4. Rytmus několika dnů: plán → investice → výsledek

Jednotlivé dny se spojují do střednědobých cílů. Hráč například chce kovárnu:

1. Zjistí, že mu chybí kámen, kov nebo někdo se znalostí řemesla.
2. Přesměruje práci, založí těžbu nebo vyšle průzkum.
3. Po dobu příprav mu chybějí pracovníci a materiál jinde.
4. Kovárna vznikne, ale potřebuje zásoby, vybavení a člověka.
5. Nové nástroje zlepší jiné činnosti — a otevřou další možnosti.

**Rozvoj = změna toho, co vesnice dovede**, ne pouze větší čísla u produkce.

**[NÁVRH]** Dobře by mohly fungovat cíle ve třech časových horizontech:

- **Dnes:** dokončit zásobu dřeva, vrátit dva pracovníky, nakrmit osadu.
- **V nejbližších dnech:** dostavět dílnu, vycvičit náhradníka, zabezpečit cestu.
- **Jednou:** obnovit starou síň, objevit původ ruin, zřídit hornickou osadu.

Hráč si tyto cíle může stanovit sám; nepotřebujeme mu vnucovat řetěz úkolů.

## 5. Tři pilíře nejsou tři oddělené hry

### A. Settlement — něco tvořím a záleží mi na tom

Práce, role, stavění a logistika tvoří stabilní základ. Každá nová budova přináší užitek, ale také něco stojí: lidi, čas, materiál, údržbu, případně bezpečí.

Zásadní je rozdíl mezi **rolí** (Borin je dlouhodobě dřevorubec) a **akcí** (teď jde ke stromu, potom ho kácí a nakonec nosí dřevo). Hráč může měnit plán, aniž by každou akci zadával ručně.

### B. Expeditions — něco opustím, abych mohl získat něco dalšího

Výprava slibuje vzácné suroviny, informace, lidi, spojence či příběh. Cena je okamžitá: výprava odčerpá lidi a výbavu z osady a přináší nejistotu.

**[NÁVRH]** Dobrá expedice by měla nabídnout alespoň dvě smysluplné varianty: například vrátit se včas s mapou, nebo pokračovat do ruin s šancí na větší objev a vyšším rizikem.

### C. Defense & Recovery — chráním to, co jsem vybudoval

Nebezpečí nutí hráče myslet dopředu. Opatření mají ekonomickou cenu, ale jejich přínos se často projeví až později. Při útoku jsou důležité stejné budovy, lidé, zásoby a vzdálenosti jako v době míru.

Po nebezpečí se hra **nepřepíná zpět na původní stav**. Zůstávají rozbité stavby, zranění, vyčerpané zásoby, ztráta zkušeností nebo změněné vztahy.

### Propojení v jediné situaci

```text
Vesnice potřebuje kvalitní železo
          ↓
Dva lidé vyrážejí na průzkum staré štoly (EXPEDICE)
          ↓
Vesnici chybějí pracovníci na opravu palisády (SETTLEMENT)
          ↓
Výprava objeví ložisko, ale naruší území nepřátelské skupiny (SVĚT)
          ↓
Roste místní nebezpečí, přichází varování (DEFENSE)
          ↓
Hráč volí: stáhnout výpravu, posílit obranu, vyjednat cestu,
nebo pokračovat v těžbě a přijmout riziko
          ↓
Výsledek ovlivní vesnici i budoucí cesty
```

To je zamýšlená síla hry: **jedno rozhodnutí se projeví ve více systémech**.

## 6. Napětí bez „raibu každou noc“

Hrozba má existovat i v obdobích, kdy se nic nestane. Hráč se však nesmí cítit trestaný nepředvídatelnou katastrofou, proti níž nemohl nic dělat.

**[NÁVRH]** Rozlišujme čtyři vrstvy nebezpečí:

1. **Pozadí:** svět není bezpečný, ale osada může dlouho prosperovat bez útoku.
2. **Příčiny:** hluk těžby, průzkum cizího území, konflikt, vypleněné místo či konkrétní volba mohou hrozbu zvýšit nebo změnit její typ.
3. **Signály:** zvěd zahlédne stopy, zmizí obchodník, objeví se kouř, sousedé varují. Některá nebezpečí přesto zůstanou nejasná.
4. **Následek:** útok, přepadení výpravy, blokovaná cesta, sabotáž nebo jiné narušení života — následované obnovou či novou volbou.

### Princip férového rizika

- **Nepravidelně, ne mechanicky.** Žádný povinný raid každý třetí den nebo každou noc.
- **Příčina, ne jen hod kostkou.** Náhoda může rozhodovat o okamžiku a podobě, ale hráč má chápat alespoň část důvodů.
- **Varování, ne vždy jistota.** Příprava má mít hodnotu, aniž by hráč znal přesný čas útoku.
- **Protiopatření, ne absolutní bezpečí.** Stráže, hradby, úkryty, zásoby, průzkum a diplomatická rozhodnutí snižují zranitelnost různými způsoby.
- **Přiměřené následky.** Hra může bolet, ale jeden raný neodvratitelný útok by neměl zničit celé úsilí bez možnosti reakce.
- **Dost prostoru pro klid.** Bez období prosperity není co chránit.

**[NÁVRH]** Pro pozdější design lze uvažovat odděleně o **hrozbě v regionu**, **pozornosti vůči osadě** a **zranitelnosti osady**. Nejsou to zatím tři povinné statistiky ani architektonická specifikace; pomáhají rozlišit „proč by někdo přišel“ od „jak špatně to dopadne“.

## 7. Co znamená prohrát — a proč má smysl pokračovat

Prohra nemusí být konec hry. Může být začátkem kapitoly, kterou by hráč při hladkém růstu nikdy nezažil.

Příklad:

> Nájezdníci poničili kovárnu. Dva trpaslíci byli zraněni. Mistr kovář padl a jediná učednice zná zatím jen část jeho postupů. Vesnice má železo, ale nedokáže už vyrábět nejlepší nástroje.

Najednou se změnily priority: léčení, náhradní výroba, opravy, ochrana učednice, hledání mistra jinde nebo výprava za ztracenými poznámkami.

### Ztráta znalostí je důležitější než odečtení životů

**[NÁVRH]** Znalosti mohou mít různé nositele: konkrétního trpaslíka, jeho učně, zápisky, dílenské postupy nebo komunitní tradici. Smrt mistra pak není automaticky ani zanedbatelná, ani absolutní „softlock“.

Možné důsledky:

- **Okamžitá:** zkušený kovář nevyrábí, jeho místo zůstalo prázdné.
- **Střednědobá:** méně zkušený pracovník pracuje pomaleji nebo zvládá jen základní výrobky.
- **Dlouhodobá:** hráč se rozhodne hledat učitele, chránit dochované znalosti, školit učně či obnovit ztracenou tradici.

Hráč by měl být dopředu schopen poznat, že znalost je vzácná, a dostat možnost ji **předat, zálohovat nebo riskovat**. Trvalá ztráta může být silná; nesmí ale náhodně zablokovat jedinou cestu k dalšímu hraní.

### Následky ano, spirála beznaděje ne

**[NÁVRH]** Po těžké události je dobré nabídnout více obnovovacích cest: jednodušší náhradní výrobu, pomoc sousedů, výměnný obchod, nalezení jiného specialisty, opravu jen části provozu nebo změnu dlouhodobého plánu. Obnova má stát úsilí, ale být hratelná.

## 8. Příběhy, které vznikají z pravidel

Nechceme, aby každá silná chvíle byla předem napsaný quest.

Místo toho mohou trpaslíci a svět uchovávat některé **významné důsledky**:

- Borin byl zraněn při obraně a nyní se zotavuje.
- Učednice se stala jedinou nositelkou kovárenského postupu.
- Výprava objevila stezku k sousedům.
- Osada poškodila vztah s určitou skupinou.
- Opravené Village Center je místem slavnosti po těžké zimě.

**[NÁVRH]** Paměť světa nemusí od začátku znamenat komplexní simulaci psychiky. Stačí několik dobře vybraných událostí, které později ovlivní dostupné možnosti, texty nebo chování.

## 9. Co drží hráče u hry v různých fázích

| Období | Hlavní emoce | Typické otázky |
|---|---|---|
| První dny | Zvědavost, péče, improvizace | Kdo jsme? Co máme? Co zvládneme postavit? |
| První fungující osada | Uspokojení z rytmu a zlepšování | Co nám chybí? Komu svěřit práci? |
| Růst a specializace | Hrdost, náročnější kompromisy | Kde vzít nové lidi a znalosti? Co lze riskovat? |
| První vážnější hrozby | Nejistota, odpovědnost | Co musíme chránit? Co obětujeme? |
| Výpravy a sousedé | Touha poznávat, ambice | Co je za údolím? Komu lze věřit? |
| Obnova po ztrátě | Odhodlání, vztah k historii osady | Co zachráníme? Jak se změní naše budoucnost? |
| Vzdálené osady (možná později) | Strategické vedení | Co delegovat? Jak spolu osady souvisejí? |

Jde o **možný dlouhý oblouk hry**, nikoliv o povinné dějství či pořadí vývoje.

## 10. Ukázka malé herní epizody

*Ilustrativní scénář, nikoliv pevný skript nebo konečné vyvážení.*

**Den 1–2:** Tři trpaslíci obnoví základní provoz u Village Center. Borin se ujme dřeva. Hráč řeší, zda druhého člověka věnovat stavbě, nebo zásobám jídla.

**Den 3–4:** Objeví se potřeba lepších nástrojů. V okolí zatím není dost známých zdrojů kovu. Hráč vyšle jednoho člověka na krátký průzkum; domácí práce zpomalí.

**Den 5:** Průzkumník objeví starou štolu a stopy cizí přítomnosti. Hráč může průzkum ukončit, pokračovat, nebo nejdříve posílit osadu.

**Den 6–7:** Díky objevu vzniká naděje na kovárnu. Zároveň do vesnice dorazí nepřímé varování. Hráč odloží část výstavby, aby připravil úkryt a zásoby.

**Den 8–9:** Dojde k omezenému přepadení či jiné nebezpečné události. Příprava pomůže, ale jedna budova je poškozena a obyvatel zraněn.

**Den 10+:** Hráč si vybírá mezi opravou, pokračováním v rozvoji, navázáním kontaktu s jinou osadou a snahou odstranit zdroj nebezpečí.

**Pozor:** Tohle není návrh, že útok *musí* přijít desátý den. Scénář pouze ukazuje, jak by se všechny tři pilíře mohly protknout během krátké herní zkušenosti.

## 11. Co dává hře znovuhratelnost

Druhé hraní by nemělo znamenat pouze jinak rozmístěné stromy.

**[NÁVRH]** Zajímavé odlišnosti mohou plynout z kombinace:

- jiných zakladatelů, schopností, znalostí a vztahů;
- jiné dostupnosti surovin a geografie;
- odlišných příležitostí v okolí;
- jiných vztahů se sousedy a zdrojů regionálních hrozeb;
- rozhodnutí, která hráč tentokrát udělá jinak;
- následků, které postupně vytvoří neopakovatelnou historii osady.

**Důležitější než náhodné generování je rozdíl v rozhodnutích.** Pokud pokaždé existuje jediná dominantní strategie, náhodnější mapa sama o sobě nestačí.

## 12. Co musí hráč vědět, aby mohl dobře rozhodovat

Hra může být tajemná, ale její pravidla nemají být nečitelná.

Hráč by měl poznat:

- **proč trpaslík nepracuje** (není úkol, není materiál, cesta je nedostupná, je zraněný...);
- **na co se právě spotřebovává čas a práce**;
- **které rezervy jsou kritické a které výdaje lze odložit**;
- **co o hrozbě víme a co pouze tušíme**;
- **proč se po události změnily možnosti**.

**[NÁVRH]** Užitečnější než množství tabulek může být kombinace pozorovatelného chování, stručných stavů („Borin čeká na volný strom“) a historie klíčových událostí. To je návrhový cíl, ne požadavek na konkrétní UI.

## 13. Pět pastí, kterým bychom se měli vyhnout

1. **Produkční hra bez důvodů:** jen stavět další budovu kvůli dalšímu číslu.
2. **Útok jako náhodný trest:** důležitá ztráta bez varování, možnosti prevence či obnovy.
3. **Expedice jako oddělená minihra:** objev nemění každodenní život osady.
4. **Mikromanagement každého kroku:** hráč zadává jednotlivé animace místo rozhodnutí.
5. **Neopravitelná spirála ztrát:** jeden neúspěch zničí možnost rozumně pokračovat.

## 14. Otázky k pozdějšímu společnému rozhodnutí

Tyto body nejsou záměrně uzavřeny:

- Jak dlouhý a výrazný má být jeden den? Má noc měnit chování zásadně, nebo spíše atmosféru?
- Co je hlavní zdroj tlaku na začátku: čas, jídlo, lidé, prostor, suroviny?
- Jaký první objev hráče opravdu láká vyrazit za hranice vesnice?
- Jak funguje obrana z pohledu hráče: příprava a automatická reakce, nebo i přímé taktické rozkazy?
- Jak vážné a jak časté ztráty jsou emocionálně silné, ale ještě příjemné pro hraní?
- Jak přesně funguje předávání znalostí a jak poznat, že ztráta mistra je riziko?
- Jaké jsou podmínky skutečného konce hry a kdy naopak pokračujeme obnovou?
- Kolik informací má hráč o nebezpečí a jak věrohodně je získává?
- Co má být nejzajímavějším důvodem k opakovanému hraní?

## 15. Jak poznáme, že tento loop funguje

Ne podle toho, kolik máme systémů, ale podle chování hráče:

- **Plánuje dopředu**, protože ví, že práci, materiál a bezpečí nelze maximalizovat současně.
- **Dívá se na vesničany**, protože jejich činnost je srozumitelná a mají pro něj hodnotu.
- **Chce prozkoumat svět**, ale vnímá cenu odchodu lidí z osady.
- **Bojí se o vesnici**, aniž by měl pocit, že mu hra každou chvíli nespravedlivě ubližuje.
- **Po ztrátě hledá nový plán** místo okamžitého restartu z frustrace.
- **Po skončení hraní umí vyprávět příběh**: „Přišli jsme o kovárnu, ale učednice udržela řemeslo při životě.“
- **Chce to zkusit znovu**, protože si umí představit jiné rozhodnutí a jiný výsledek.

---

## Závěrečné pravidlo

> **Každý den má vesnice o něco žít. Občas má o co přijít. A hráč má rozumět tomu, proč se obojí stalo.**

`GAME_LOOP.md` je **návrhový kompas**. Následující `PLAYABLE_PROTOTYPE.md` může později určit, jak malou funkční část tohoto cyklu stačí postavit, aby šlo ověřit jeho zábavnost — bez závazku implementovat celou vizi.

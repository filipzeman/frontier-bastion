# Živá trpasličí osada – Herní vize

Pracovní dokument zachycující naši představu hry. Není to plán vývoje ani seznam povinných funkcí.

Tato verze je určená pro Godot. Vývojář sám rozhoduje, co bude vytvářet, kdy a jakým způsobem. Dokument obsahuje jak myšlenky, na kterých jsme se již shodli, tak možnosti, které zatím zůstávají otevřené.

## 1. Jaký pocit má hra vyvolávat

Trpasličí osada by měla působit jako skutečné, živé místo. Ne jako tabulka s čísly, nad kterou se pohybují animovaní pracovníci.

Vesnice a její obyvatelé jsou hlavními protagonisty hry.

Svět existoval dávno před příchodem našich trpaslíků. Má svou historii, tajemství, nebezpečí a obyvatele.

Práce, objevování, nebezpečí a rozhodnutí hráče by měly společně vytvářet příběhy, které si hráč zapamatuje.

Na začátku hráč zná každého obyvatele jménem. Sleduje jeho práci, úspěchy a neúspěchy.

Postupně může vesnice růst a časem se možná proměnit v rozsáhlejší společenství několika osad.

Příklad toho, čeho chceme dosáhnout

Borin pracuje jako dřevorubec.

Ráno vyjde ze svého domova, vybere vhodný strom, dojde k němu, pokácí ho a odnese získané dřevo zpět do vesnice.

To podstatné není samotná animace těžby.

Každá jeho činnost má svůj důvod.

Podobně mohou přirozeně vznikat další situace:

Jiný dřevorubec pokácí strom, ke kterému právě mířil Borin.
Pracovník se nestihne před setměním vrátit domů.
Oprava poškozené budovy přeruší běžnou výrobu.
Nedostatek materiálu způsobí zastavení stavby.

Takové okamžiky by měly vznikat především vzájemným působením herních systémů, nikoliv pomocí předem připravených scénářů.

## 2. Tři hlavní pilíře hry

Naše představa hry stojí na třech vzájemně propojených pilířích.

### I. Settlement – Život a rozvoj vesnice

Hráč postupně buduje a spravuje trpasličí osadu.

Důležitou součástí jsou:

Každodenní život obyvatel.
Pracovní role a povolání.
Těžba a výroba surovin.
Přeprava materiálu a logistika.
Stavba nových budov.
Zajištění potravin a nástrojů.
Získávání a předávání znalostí.
Údržba a opravy.
Příprava na nebezpečí.

Vesnice by měla postupně získávat vlastní rytmus.

Trpaslíci vykonávají své povinnosti a hráč nemusí každou jednotlivou činnost neustále řídit.

### II. Expeditions – Výpravy a objevování světa

Svět nekončí hranicemi vesnice.

Hráč může postupně vysílat výpravy do okolí, prozkoumávat staré údolí, hledat nové suroviny a odhalovat jeho minulost.

Výpravy mohou objevit:

Zapomenuté ruiny.
Nová naleziště surovin.
Staré cesty a mapy.
Opuštěná místa.
Přeživší obyvatele.
Vzdálené osady.
Nová nebezpečí.
Události vyžadující rozhodnutí hráče.

Výpravy by měly mít skutečný dopad na život osady.

Trpaslík, který odešel na výpravu, nemůže současně pracovat ve vesnici.

Každá expedice tak představuje určité rozhodnutí a oběť.

### III. Defense & Recovery – Obrana a zotavení

Vesnice není dokonale bezpečné místo.

Ve světě existují nebezpečí, která mohou osadu ohrozit.

Hráč se na ně může připravovat prostřednictvím:

Průzkumníků a včasného varování.
Strážných.
Obranných staveb.
Zásob.
Organizace obyvatel při nebezpečí.
Oprav a obnovy po útoku.

Útoky nemusí být časté. Mohou být vzácné, ale o to významnější.

Porážka nemusí automaticky znamenat konec hry.

Vesnice může přijít o suroviny, budovy nebo obyvatele. Někteří trpaslíci mohou být zajati.

Hráč se pak musí rozhodnout, jak vzniklou situaci vyřešit.

Tyto tři pilíře představují naši dlouhodobou vizi. Neznamená to, že je musíme implementovat v určitém pořadí.

## 3. Začátek hry

Jednou z možností je začátek příběhu se třemi trpaslíky, kteří byli nuceni opustit svůj původní domov.

Mohli přežít útok, katastrofu nebo jinou událost.

Dorazí na místo, kde kdysi stála vesnice. Zůstaly po ní jen ruiny a několik použitelných staveb či zásob.

Zde se rozhodnou začít znovu.

Prvním známým obyvatelem je Borin.

Jména Edda a Toma byla zatím pouze pracovními návrhy.

Skupina má několik základních surovin, které jí umožní přežít první dny.

Village Center – Srdce vesnice

Village Center představuje centrum nově vznikající osady.

Může fungovat jako:

Místo setkávání.
Dočasné obydlí prvních obyvatel.
Prostor pro společné události.
Místo sezónních slavností.
Symbol založení vesnice.

Později by podobná stavba mohla představovat základ nových vzdálených osad.

Z technického hlediska však Village Center nemusí být speciální třídou.

Může jít o běžnou budovu, jejíž význam vyplývá z jejích vlastností a herních systémů.

## 4. Práce, povolání a každodenní život

Budovy mohou poskytovat pracovní místa, kterým říkáme Assignments.

Například:

Logging Camp
    └── Lumberjack
            └── Borin

Borin má přiřazené povolání dřevorubce.

To však neznamená, že neustále provádí jednu konkrétní akci.

Během dne může:

Dojít na pracoviště.
Vybrat vhodný strom.
Přemístit se k němu.
Pokácet ho.
Odnést dřevo.
Vrátit se domů.

Pracovní role přetrvává. Aktuální činnost se mění.

Mezi možná povolání patří dřevorubec, horník, farmář, sběrač, lovec, stavitel, nosič, kovář, kuchař, strážný nebo opravář.

Výjimečné situace

Běžná práce může být přerušena událostí, která má vyšší prioritu.

Například při útoku na vesnici mohou někteří obyvatelé:

Pomáhat s obranou.
Evakuovat ostatní.
Přenášet zásoby.
Opravovat poškozené stavby.

Po skončení nebezpečí se mohou vrátit ke svým původním povoláním.

Hráč plánuje, obyvatelé vykonávají

Na začátku hry rozhoduje hráč.

Určuje, jaké budovy postaví, komu přidělí práci a co je důležité.

Později může vzniknout potřeba automatizace.

Například vzdálená hornická osada může dostat jednoduchý cíl:

Každý den dodávej hlavní vesnici 20 jednotek železa.

Osada by pak měla být schopná tento cíl plnit prostřednictvím stejných pracovních systémů, které hráč dříve používal ručně.

Automatizace není nutná od začátku.

## 5. Obyvatelé a populace

Upřednostňujeme menší počet zapamatovatelných obyvatel před anonymními čísly pracovní síly.

Každý obyvatel může mít vlastní identitu.

Mezi možné vlastnosti patří:

Jméno a věk.
Původ.
Povolání.
Aktuální činnost.
Silné a slabé stránky.
Vztahy s ostatními.
Zkušenosti.
Vzpomínky.
Získané tituly.

Povolání není neměnnou součástí osobnosti.

Trpaslík může během života vystřídat různé práce a získat nové zkušenosti.

Znalosti a jejich předávání

Jedním ze zajímavých směrů je přenos znalostí mezi obyvateli.

Zkušený mistr může předávat své znalosti učni.

To by znamenalo, že některé schopnosti nejsou odemykány pouze postavením budovy nebo výzkumem v technologickém stromě.

Jsou spojeny s konkrétními lidmi.

Děti mohou být po určitou dobu spíše součástí života vesnice a teprve později se začít učit řemeslu.

Růst populace

Možné způsoby příchodu nových obyvatel:

Pocestní.
Uprchlíci.
Zachránění přeživší.
Specialisté přilákaní dobrou pověstí.
Narození nových obyvatel.
Migrace mezi osadami.

Zatím jsme neurčili jeden závazný systém.

Důležité je, aby příchod nového obyvatele byl zejména v prvních fázích hry významnou událostí.

## 6. Ekonomika, logistika a závazky

Je důležité rozlišovat mezi dvěma druhy surovin.

Fyzické suroviny ve světě

Například:

Strom.
Kámen.
Ložisko železa.
Naleziště dalších materiálů.

Tyto objekty skutečně existují na mapě.

Skladové zásoby vesnice

Například:

Dřevo.
Potraviny.
Nástroje.
Železo.

Jde o materiály, které vesnice vlastní a může používat.

První prototyp může některé procesy zjednodušovat.

Později však může být získávání materiálů fyzicky simulováno:

Najít zdroj
    ↓
Dojít k němu
    ↓
Získat materiál
    ↓
Odnést materiál
    ↓
Uložit do skladu
Stavba jako závazek

Jedním z možných budoucích systémů je rezervace materiálu na plánované stavby.

Pokud hráč rozhodne o stavbě nové budovy, vesnice může potřebný materiál rezervovat.

Tím vzniká určitý závazek.

Změna priorit, pozastavení nebo zrušení projektu může být možné, ale nemusí být vždy bez následků.

Podobně mohou fungovat výrobní fronty a pracovní priority.

Čas, vzdálenosti, nedostatek surovin a omezený počet pracovníků vytvářejí zajímavá rozhodnutí.

Dlouhodobou představou je, že významné činnosti potřebují čas.

Neznamená to však, že první prototyp musí okamžitě obsahovat dokonale simulovanou logistiku.

## 7. Nebezpečí, následky a paměť světa

Útoky by neměly fungovat jako samostatná minihra odtržená od života vesnice.

Měly by zasahovat do již existujících systémů.

Například:

Strážné je potřeba přidělit.
Obranné věže mohou potřebovat zásoby a údržbu.
Běžní pracovníci mohou převzít nouzové úkoly.
Budovy mohou být poškozeny.
Obnova spotřebovává materiál a pracovní čas.
Svět reaguje na rozhodnutí hráče

Nebezpečí nemusí přicházet pouze náhodně.

Může být důsledkem hráčových akcí.

Například:

Těžba v horách probudí něco, co mělo zůstat skryté.
Kácení prastarého lesa naruší vztahy s místními duchy.
Útok na nepřátelský tábor zvýší nebezpečí v regionu.

Stejně důležitá jako samotné útoky jsou období klidu.

Právě během nich se vesnice rozvíjí, připravuje a vytváří něco, o co může později přijít.

Paměť světa

Svět by si mohl pamatovat významné události.

Lidé a místa mohou postupně získávat historii, pověst nebo nové vlastnosti.

Důležitá událost tak nemusí po skončení okamžitě zmizet z herního světa.

Roční období a počasí

Roční období by neměla pouze měnit barvu krajiny.

Mohou ovlivňovat:

Každodenní práci.
Dostupnost surovin.
Zásobování.
Cestování.
Atmosféru.
Životní rytmus vesnice.

Slavnosti a společná setkání ve Village Center mohou připomínat plynutí času.

## 8. Průzkum, další vesnice a vzdálené osady

Průzkum může odhalovat:

Nové cesty.
Vzácné materiály.
Přeživší obyvatele.
Ruiny.
Nepřátelské skupiny.
Obchodní partnery.

Další vesnice mohou mít své vlastní potřeby.

Mohou mezi sebou obchodovat, spolupracovat, soupeřit nebo se dostávat do konfliktů.

Vzdálené osady

Hráč může později zakládat vlastní vzdálené osady.

Ty se mohou specializovat například na těžbu železa.

Zpočátku je hráč může spravovat přímo.

Postupně však může jejich řízení delegovat.

Cílem by nemělo být, aby hráč musel ručně kontrolovat každou jednotlivou činnost v každé osadě.

Otevřené otázky

Zatím jsme nerozhodli:

Jak přesně bude vypadat mapa světa.
Jak bude fungovat odhalování neznámého území.
Jak budou technicky řešeny expedice.
Jak komplexní bude diplomacie.
Jakým způsobem budou spravovány vzdálené osady.

Tyto otázky zatím necháváme otevřené.

## 9. Vizuální a emocionální směřování

Hra by měla mít stylizovanou 2D / 2.5D grafiku.

Důležitá je prostorová hloubka, čitelnost a atmosféra.

Vizuální styl by se měl pohybovat mezi příjemnou pohádkovou stylizací a trochu temnějším, opotřebovaným fantasy světem.

Nechceme příliš dětský vzhled.

Možné vizuální prostředky
Více vrstev prostředí.
Řazení objektů podle hloubky.
Stíny.
Animace.
Částicové efekty.
Kouř z komínů.
Déšť a jiné počasí.
Osvětlení.
Parallax.

Původně jsme tento směr zkoumali pro Defold, ale samotná výtvarná vize není závislá na enginu.

V Godotu můžeme používat odpovídající 2D techniky podle potřeby.

Není nutné přecházet na 3D.

Souřadnice a pravidla simulace by měly zůstat oddělené od vizuálních triků, jako jsou posuny spritů nebo vykreslovací hloubka.

Během vývoje mechanik je zcela v pořádku používat jednoduchou zástupnou grafiku.

## 10. Důležité herní principy

Tohle jsou myšlenky, ke kterým bychom se měli během vývoje pravidelně vracet.

Hráč plánuje, obyvatelé vykonávají.

Trpaslíci by měli jednat podle srozumitelných pravidel, nikoli pouze přehrávat připravené animace.

Příběhy mají vznikat přirozeně.

Upřednostňujeme situace vznikající interakcí systémů před náhodnými, izolovanými scénáři.

Nové mechaniky by měly obohacovat ty stávající.

Ideálně by nová mechanika měla ovlivňovat více než jednu oblast hry.

Nový systém by měl řešit skutečný herní problém.

Nemusíme implementovat složitou automatizaci, dokud hráč nemá důvod ji potřebovat.

Důležité činnosti vyžadují čas a prostředky.

Pracovní síla, čas a suroviny jsou omezené.

Neúspěch nemusí znamenat konec.

Ztráty mohou vytvořit nové situace, příběhy a příležitosti k obnově.

Vesnice by měla být s každou další iterací živější.

Nové systémy by měly přispívat k pocitu fungujícího světa.

Nebojíme se odstranit mechaniky, které hru nezlepšují.

Žádný nápad není nedotknutelný jen proto, že jsme ho kdysi vymysleli.

## 11. Otázky, které zatím necháváme otevřené

Nechceme předčasně rozhodovat o všem.

Mezi dosud otevřené otázky patří:

Přesný model herního času.
Výběr a plánování jednotlivých úkolů.
Velikost světa.
Podoba mapy a expedic.
Získávání nových obyvatel.
Soubojový systém.
Diplomacie.
Výzkum a odemykání technologií.
Podrobnost inventáře.
Fyzická přeprava materiálů.
Vlastnosti obyvatel.
Předávání znalostí.
Ukládání hry.
Vyvážení ekonomiky.
Míra automatizace.
Vzájemná priorita tří hlavních pilířů.

Na tyto otázky budeme odpovídat postupně podle toho, jak se bude hra vyvíjet.

## 12. Dlouhodobá představa vývoje světa

Nejde o pevný plán implementace, ale o možný vývoj samotné hry.

Malá skupina přeživších
          ↓
Založení vesnice
          ↓
První funkční budovy
          ↓
Každodenní práce a výroba
          ↓
Růst populace
          ↓
Specializace obyvatel
          ↓
Nedostatek surovin a nebezpečí
          ↓
Výpravy do okolního světa
          ↓
Objevování dalších osad
          ↓
Obchod, vztahy a konflikty
          ↓
Zakládání vlastních osad
          ↓
Delegování jejich správy

Tato představa se může kdykoliv změnit.

Vývojář rozhoduje, které části skutečně vzniknou a jakým způsobem.

Závěrečná myšlenka

Chceme vytvořit hru, ve které hráč nezačne jako vládce rozsáhlého království.

Začne s několika trpaslíky na místě, které se teprve může stát jejich domovem.

Zná jejich jména. Ví, kdo co umí. Sleduje jejich každodenní práci.

Postupně se kolem nich vytváří fungující společenství.

Svět však není bezpečný ani lhostejný. Reaguje na jejich činy, nabízí příležitosti a přináší nebezpečí.

Vesnice může růst, prosperovat, utrpět ztráty a znovu se postavit na nohy.

Cílem není pouze postavit co největší osadu. Cílem je vytvořit místo, které má vlastní historii a na jehož obyvatelích hráči záleží.
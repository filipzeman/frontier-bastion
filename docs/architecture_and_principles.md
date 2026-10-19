## Frontier Bastion — Architektura a návrhové principy (Godot)

Dřívější rozhodnutí převedená do podoby doporučení pro Godot, nikoliv závazných implementačních pravidel. Tento dokument není sada instrukcí pro Codex, plán milníků ani evidence stavu projektu. O návrhu, kódu, tempu, milnících a prioritách rozhoduje autor hry.

## 1. Naše nová dohoda o spolupráci (říjen 2026)

Engine: Godot. Vybrali jsme ho proto, že s ním má autor hry nejvíc zkušeností.

Autor hry samostatně řídí projekt, vybírá milníky, píše a organizuje kód a rozhoduje, kdy změnit směr.

ChatGPT je konzultační partner na vyžádání: pro architekturu, herní design, vizuální koncepty, porovnávání možností a návrhy přístupů na vyšší úrovni. Nemá určovat další úkol, pokud o to autor výslovně nepožádá.

Codex je volitelná pomoc především pro konkrétní problémy v kódu, když se autor zasekne. Nemusí řídit vývoj ani udržovat roadmapu.

Nemáme povinné číslování funkcí, každodenní hlášení postupu, předepsaný postup commitování ani povinný PROJECT_STATE.md. Autor si může vést poznámky, jak mu vyhovuje.

## 2. Architektonické myšlenky, které si chceme zachovat

### Vlastnictví a odpovědnost (ownership)

Svět obsahuje fyzické zdroje a osady. Osady obsahují obyvatele, budovy a zásoby. Budovy mohou nabízet pracovní místa neboli Assignments.

World
├── fyzické zdroje (stromy, ložiska, ...)
└── Villages
    ├── Villagers
    ├── Buildings
    │   └── Assignments
    └── zásoby / inventář

Při práci v Defoldu nám pomáhala zásada „Vlastník vytváří to, co vlastní.“ V Godotu ale nemusí být struktura scén (SceneTree), vlastnictví dat a řízení životního cyklu přesně totéž. Konkrétní řešení navrhneme podle potřeb hry, nikoli podle starého kódu.

### Realita versus rozhodování

World state popisuje, co ve světě existuje a co se právě děje. Hráčovy příkazy — případně později pravidla autonomní osady — určují, co se má stát. Obyvatelé a pracovní systémy tyto záměry vykonávají.

Chceme se vyhnout jednomu obřímu controlleru, který zároveň vlastní všechna data a rozhoduje úplně o všem.

### Konfigurace versus runtime state

Definice stromu, budovy nebo typu obyvatele není totéž jako proměnlivý stav jejich konkrétní instance.

Godot Resources (.tres/.res) mohou uchovávat znovupoužitelná definiční data. Nodes nebo obyčejné datové objekty mohou nést runtime state.

Pozor na pojmy: Godot Resource znamená datový objekt enginu. V původním projektu jsme slovem „Resource“ označovali fyzické věci ve světě, například strom nebo kámen. Aby nevznikal zmatek, můžeme používat jednoznačnější názvy jako WorldResourceNode, ResourceDeposit, ItemDefinition nebo BuildingDefinition.

### Simulace versus prezentace

Tam, kde to dává smysl, oddělujeme herní pravidla od jejich vizuálního zobrazení.

Godot Nodes a Scenes mohou přímo reprezentovat postavy a objekty světa. Jejich sprite, animace, vizuální posuny a efekty (VFX) by ale neměly určovat ekonomickou ani herní pravdu.

V Godotu můžeme pragmaticky kombinovat simulaci se SceneTree. Nemusíme vytvářet za každou cenu zcela nezávislou doménovou vrstvu, jak jsme se o to pokoušeli v Lua/Defoldu.

### Význam objektu díky složení a datům

Village Center může být běžný typ/scéna budovy se zvláštními schopnostmi a daty. Nepotřebuje nutně vlastní hlubokou dědičnou hierarchii.

Pro práci, produkci, inventář, role a interakce se podle potřeby mohou hodit menší komponenty nebo schopnosti (composition / capabilities) spíše než rozsáhlé stromy tříd.

### Pracovní role versus aktuální akce

Dlouhodobý Assignment (například dřevorubec) není totéž jako konkrétní bezprostřední úkol: dojít ke stromu, pokácet ho, odnést dřevo.

Nouzová situace může dočasně přerušit právě vykonávanou činnost, aniž by trpaslík přišel o své původní pracovní zařazení.

### Fyzické zdroje versus skladové zásoby

Strom nebo ložisko na mapě není totéž jako 30 jednotek dřeva ve skladu vesnice. Rozlišování těchto věcí nám později umožní rozvíjet logistiku a ekonomiku.

## 3. Možnosti implementace v Godotu — návrhy, nikoli rozhodnutí

Koncept       Možná podoba v Godotu                     Na co myslet

World         Hlavní scéna světa / koordinační Node     Nedělat z něj automaticky vševědoucí      
                                                        singleton.
Village       Node nebo doménový objekt s podřízenými entitami

Hierarchie scén a logické vlastnictví nemusí být totožné.

Villager

Scéna založená na CharacterBody2D nebo Node2D

CharacterBody2D má smysl, pokud ho skutečně potřebujeme kvůli pohybu/kolizím.

Building

Scéna Node2D a definiční Resource

Podle složitosti může být vhodná společná scéna nebo specializované scény.

Fyzický zdroj

Scéna Node2D nebo Area2D

Může nést množství, pozici a interakce.

Definice objektů

Vlastní typy Godot Resource

Pozor na sdílené měnitelné Resources; pro úpravy jednotlivých instancí může být nutná kopie.

Práce a role

Datový objekt, komponenta nebo manager

Oddělit dlouhodobou roli od konkrétních naplánovaných akcí.

Komunikace

Signals a explicitní volání metod

Signály pro události, přímá volání pro požadavky/příkazy tam, kde jsou přehlednější.

Čas

Samostatná služba hodin / komponenta světa

Uchovávat autoritativní čas; den a období podle potřeby odvozovat.

Vizuální hloubka

Y-sort, vrstvy, posuny a stíny

Oddělit světovou/kolizní pozici od ukotvení grafiky a řazení vykreslování.

Tohle jsou výchozí možnosti k diskusi, nikoli předepsaná struktura složek ani závazná architektura kódu.

4. Co nás naučil původní prototyp

V prototypu v Defoldu/Lua jsme pracovali s koncepty World, Village, Villager, Building, Assignment, fyzickými instancemi zdrojů a rendererem, který pozoroval stav simulace. Zkoušeli jsme i inicializaci nové hry.

Ověřili jsme si hodnotu nezávislého stavu instancí, jasných odpovědností a toho, že vizuální podoba vychází ze simulace.

Poslední známá rozpracovaná část se týkala počátečních zásob, tří obyvatel, Village Center a přehledového výpisu vesnice.

Nepředpokládáme, že některý z těchto kusů kódu existuje v novém Godot repozitáři. Jsou to zkušenosti a koncepty, nikoli úkoly pro migraci.

5. Pružný technický přístup

Začátek vývoje si určí autor podle toho, co ho právě motivuje. Může to být jednoduchá denní rutina trpaslíka, hratelná scéna vesnice, interakce s budovou, inventář, střídání dne a noci nebo vizuální prototyp.

O konkrétních technických variantách budeme diskutovat, až na ně narazíme.

První verze nějaké mechaniky může být abstraktní a později se stát fyzickou simulací — třeba přírůstek zásob se změní na skutečné sbírání a přepravu surovin. Je to možnost, nikoli povinné pořadí vývoje.

6. Co spolu můžeme konzultovat

Hranice odpovědností: kdo vlastní stav, kdo žádá o práci, kdo ji vykonává?

Skládání Godot Scenes, Nodes a Resources; kdy využít Signals a kdy přímé volání.

Simulační tick oproti _process() / _physics_process(); ukládání stavu a deterministické chování.

Plánování práce, priority, přerušení a návrat k původní činnosti.

Navigaci, interakční body a přenášení materiálu.

Architekturu vykreslování stylizované 2.5D vesnice.

Porovnání možných řešení předtím, než autor udělá konečné rozhodnutí.
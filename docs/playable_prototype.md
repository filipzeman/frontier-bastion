# Living Settlement — Návrh hratelného prototypu

> **Pracovní návrh · Godot · říjen 2026**  
> Účel: v rozumně omezeném rozsahu ověřit, jestli je **zábavné rozhodovat o osudu malé trpasličí vesnice**, nejen jestli funguje simulace. Nejde o závaznou roadmapu, seznam implementačních úkolů ani technickou specifikaci. O rozsahu a pořadí vývoje rozhoduje autor hry.
>
> **Původ:** Dokument rozvíjí naše `GAME_VISION.md` a `GAME_LOOP.md`. Zachovává tři propojené pilíře — **Settlement, Expeditions, Defense & Recovery** — a osobní vztah k obyvatelům. Konkrétní počty, pravidla, scénáře a hranice prototypu níže jsou **[NÁVRH] k ověření**, ne již schválené herní zákony.

## 1. Co má prototyp zodpovědět

Nejprve neřešme, kolik funkcí hra obsahuje. Prototyp má odpovědět na pět otázek:

1. **Baví mě běžný život vesnice i tehdy, když se zrovna nic dramatického neděje?**
2. **Dělám skutečná rozhodnutí?** Nestačí, aby bylo možné kliknout na stavbu; záleží na tom, koho zaměstnám, co odložím a co riskuji?
3. **Záleží mi na konkrétních obyvatelích?** Je jiné přijít o Borina než o anonymní číslo v přehledu populace?
4. **Ovlivňují se budování, expedice a obrana navzájem?** Nebo jde o tři oddělené minihry?
5. **Chci po skončení zkusit další partii jinak?** A pokud ne, co přesně tomu chybělo?

**Úspěch prototypu neznamená „máme všechny mechaniky“.** Znamená, že už existuje aspoň jeden úplný a znovu hratelný příběh, jehož průběh závisí na rozhodnutích hráče.

## 2. Jeden uzavřený herní příběh

**[NÁVRH] Jedna krátká partie** trvá přibližně **30–60 minut** (číslo je pouze testovací cíl, ne pevná podmínka) a obsahuje tento oblouk:

```text
Tři přeživší dorazí k ruinám
             ↓
Zprovozním základ vesnice
             ↓
Rozdělím práci, rozběhnu výrobu a stavbu
             ↓
Narazím na nedostatek nebo příležitost
             ↓
Rozhodnu se, zda pošlu někoho na výpravu
             ↓
Výprava něco přinese, ale může také zvýšit nebezpečí
             ↓
Musím se rozhodnout mezi rozvojem a přípravou obrany
             ↓
Přijde nebezpečí nebo hrozba, které mohu rozumně čelit
             ↓
Nesu následky: škody, spotřebované zásoby, zranění či ztráty
             ↓
Obnovím fungování osady a rozhodnu, co dál
```

Podstatné je, aby hráč **během jedné partie alespoň jednou litoval nebo ocenil své předchozí rozhodnutí**: „Kdybych tehdy neposlal dva lidi pryč…“ nebo „Ještě že jsem nechal postavit strážní stanoviště.“

Není nutné, aby hra po posledním kroku skončila nápisem *Victory*. Může pokračovat, ale prototyp musí mít **čitelný okamžik vyhodnocení**, například po překonání první významné krize.

## 3. Vědomě omezený svět

**[NÁVRH]** Pro první hratelný celek stačí:

| Oblast | Záměrně omezená podoba | Proč stačí |
|---|---|---|
| Mapa | Jedna malá vesnická mapa a několik pojmenovaných míst mimo ni | Testujeme rozhodování, ne generování kontinentu. |
| Obyvatelé | Tři pojmenovaní zakladatelé; případně jeden nový člověk během partie | Každý člověk má váhu. |
| Suroviny | Například dřevo, kámen a jídlo; jedna zvláštní surovina či nález z expedice | Má vznikat nedostatek a možnost volby, nikoli katalog materiálů. |
| Budovy | Village Center, místo těžby dřeva, jednoduché místo pro jídlo či zásoby, jedna obranná možnost | Každá budova má změnit rozhodování. |
| Práce | Několik jasných rolí: získávání surovin, stavba, stráž/obrana | Stačí k ověření konkurence o pracovní sílu. |
| Expedice | Jedna až dvě lokality a jednoduché rozhodnutí o riziku | Výprava má něco stát a něco změnit. |
| Hrozby | Jeden typ nebezpečí s několika výsledky | Testujeme přípravu a následky, nikoli bojový systém. |
| Obnova | Opravy, zotavení zraněného nebo nahrazení výpadku práce | Ukáže, zda neúspěch vytváří další hru. |

Tyto položky jsou **rozpočtem složitosti**, ne závaznými čísly. Pokud nějaká mechanika skutečně nepotřebuje samostatnou budovu či zdroj, vynechme je.

## 4. Minimum, které musí být opravdu hratelné

### A. Osada žije a hráč jí dává směr

Na začátku existuje Village Center, tři obyvatelé a malé zásoby. Svět má čas (den a noc nebo jiný čitelný rytmus). Hráč dokáže zjistit, kdo co dělá, jaké jsou zásoby a co je právě důležité.

Hráč může rozhodnout o práci obyvatel a o alespoň jedné smysluplné investici. **Práce spotřebovává čas; jeden člověk nemůže dělat všechno najednou.** Přiřazená role přetrvává, jednotlivé akce se podle ní vykonávají.

**Nutná zkušenost hráče:** „Když Borin staví, nemám ho na těžbu. Vědomě jsem to zvolil.“

**Co lze zjednodušit:** Chůze může být zpočátku abstraktní, stavba se může dokončit po určité době a logistika nemusí fyzicky zobrazovat každý kus dřeva. Pokud je pro tebe pohyb trpaslíků hlavním zdrojem radosti, je legitimní implementovat ho dřív — ale není to podmínka návrhu.

### B. Malá ekonomika vytváří volby

Alespoň jeden zdroj je užitečný pro **dvě vzájemně soupeřící věci**. Například dřevo lze dát do rozšíření výroby **nebo** do provizorní obrany/oprav.

Důležité je, aby hráč měl informaci o ceně rozhodnutí a viděl důsledek. Čisté „+20 dřeva za den“ je přijatelné, pokud už kvůli tomuto dřevu musí rozhodovat.

**Nutná zkušenost:** „Mohl jsem posílit produkci, ale raději jsem část zásob nechal jako rezervu.“

### C. Výprava oslabí domov a změní svět

Hráč vyšle alespoň jednoho obyvatele na výpravu. Tento člověk **po určitou dobu skutečně chybí** ve vesnické ekonomice. Výprava má zřejmou cenu, slibovaný přínos a alespoň jednu nejistotu nebo volbu.

Výsledek může přinést surovinu, znalost o místě, nového člověka nebo informaci o hrozbě. Nemusíme vytvářet samostatnou expediční mapu — postačí mapa s jedním místem, jednoduché rozhraní a událost odvozená z hráčova rozhodnutí.

**Nutná zkušenost:** „Poslal jsem toho správného člověka? A stálo to za to?“

### D. Hrozba má příčinu, varování a následky

Prototyp nemusí mít časté raidy ani taktický boj. Má ale obsahovat **nejméně jednu situaci ohrožení**, na kterou lze reagovat dřív, než dopadne.

**[NÁVRH]** Hrozbu může reprezentovat jednoduchá veličina *napětí regionu* nebo příznak *nebezpečná oblast objevena*. Výprava může riziko zvýšit. Zvěsti, stopy či varování dají hráči přibližnou představu, že něco hrozí; přesný čas nebo síla útoku nemusí být známa.

Možné reakce: stáhnout výpravu, přesunout člověka na stráž, investovat dřevo do obrany, nechat si zásoby na opravy. Rozhodnutí má stát reálný čas či prostředky.

**Nutná zkušenost:** „Měl jsem signály a mohl jsem jednat. Když to dopadlo špatně, rozumím alespoň přibližně proč.“

**Pozor:** Neprokázaná náhodná likvidace vesnice netestuje strategii — testuje trpělivost hráče.

### E. Po krizi hra pokračuje

Hrozba může poškodit budovu, vyčerpat zásoby nebo zranit obyvatele. Následuje volba, jak obnovit fungování osady. Vznikne **nová práce**, nikoliv pouhé „počkat 30 sekund, než se vše vrátí do normálu“.

**[NÁVRH]** Pro první prototyp bych **nevyžadovala trvalou smrt jediného nositele unikátní znalosti**. Je to silná součást dlouhodobé vize, ale pro test prvního loopu může být těžké ji férově vyvážit. Výpadek zraněného zkušeného pracovníka už může ukázat, že na konkrétních lidech záleží. Trvalé ztráty a přenos znalostí lze přidat, až bude funkční náhrada a obnova.

**Nutná zkušenost:** „Útok změnil můj plán na příští dny, ale pořád mám možnosti.“

## 5. Co bych do prvního prototypu vědomě nedávala

- Rozsáhlý generovaný svět, plnohodnotnou fog of war a vlastní ovládání expedic.
- Diplomacii, obchodní trasy a druhou plně simulovanou vesnici.
- Kompletní bojový systém s mnoha jednotkami, schopnostmi a animacemi.
- Rozsáhlý strom technologií, celý systém učňů a desítky dovedností.
- Děti, stárnutí, rodokmeny a dlouhodobou demografii.
- Pokročilé AI řízení celé vesnice nebo autonomní outposty.
- Fyzickou logistiku všeho, pokud nepřináší zajímavé rozhodnutí.
- Finální grafiku, propracované počasí a plnou sadu budov.

To nejsou špatné nápady; jsou důležité pro vizi. **První prototyp musí dokázat, že základní konflikt funguje, než ho rozšíříme.**

## 6. Jak zajistit napětí, aniž bychom simulovali „raid každou noc“

**[NÁVRH] Prototyp může testovat dvě vrstvy:**

**Nejistota v běžném životě.** Hráč ví, že svět není bezpečný. Vidí stopy, slyší zprávy z expedice, zaznamená pohyb v okolí. Nemusí každou noc očekávat útok. Investice do obrany je volba s odloženým přínosem.

**Jedna zkouška připravenosti během partie.** V první testovací verzi může být hrozba záměrně zaručena během definovaného období, abychom spolehlivě otestovali obranu a obnovu. **To je testovací pomůcka, nikoli návrh finální frekvence raidů.** Její průběh nebo intenzitu mohou ovlivnit hráčovy činy.

Až bude prototyp fungovat, dá se otestovat varianta s větší nejistotou: některé partie bez útoku, některé s jiným typem problému. Základní otázka zůstává, zda hráče **baví připravovat se**, i když k boji vůbec nedojde.

## 7. Dva rozdílné průchody stejným prototypem

### Partie A — Opatrná vesnice

Hráč nechá dva lidi získávat a zpracovávat suroviny, třetího využije na stavby. Výpravu odloží, dokud nemá rezervy. Před první krizí má lepší zabezpečení, ale méně nových informací či vzácných nálezů. Krizi přečká s menšími škodami; rozvoj je však pomalejší.

### Partie B — Riskantní objevitel

Hráč vysílá výpravu dřív. Získá něco cenného a může si otevřít novou možnost, ale jeden zkušený pracovník doma chybí a napětí v okolí roste. Před krizí stihne méně příprav. Krize může poškodit důležitou budovu; hráč potom improvizuje a obnovuje provoz.

**Test znovuhratelnosti:** Obě partie se musí lišit *příčinou a důsledky*, ne jen počtem nasbíraných surovin. Pokud je jedna strategie vždy nejlepší a ostatní jen pomalejší, budeme to muset upravit.

## 8. Co musí hráč vědět

Aby rozhodnutí byla férová, měl by hráč bez dlouhého pátrání poznat:

- **Lidi:** kdo je kde, co dělá, zda je dostupný, a co se stane, když ho přeřadí.
- **Zásoby a závazky:** co máme, co potřebujeme a kde se právě spotřebovávají prostředky.
- **Čas:** jak dlouho asi potrvá práce, návrat výpravy nebo dokončení obrany.
- **Riziko:** přibližně co víme a co nevíme; varování nemá být pouhá dekorace.
- **Následky:** co se změnilo po expedici a krizi a proč.

Rozhraní může být prosté. **Srozumitelnost je důležitější než grafická dokonalost.**

## 9. Testovací otázky po jedné partii

Neodpovídej pouze „bavilo mě to?“ Zkus si po každém průchodu krátce zapsat:

1. **Kdy jsem musel udělat nejtěžší rozhodnutí?** Pokud nikdy, jsou zdroje a lidé možná příliš dostupní.
2. **Jaké rozhodnutí mě později potěšilo nebo mrzelo?** Pokud žádné, následky jsou možná slabé nebo nečitelné.
3. **Zajímal mě osud konkrétního trpaslíka?** Pokud ne, možná jsou obyvatelé příliš zaměnitelní.
4. **Proč jsem vyslal výpravu?** Pokud jen proto, že hra nabídla tlačítko, chybí přirozená motivace.
5. **Byla hrozba napínavá, nebo jen otravná?** Mohl jsem se na ni připravit a něco ovlivnit?
6. **Bylo po útoku co zajímavého dělat?** Nebo jsem jen čekal na doplnění čísel?
7. **Chtěl bych to hrát znovu jiným způsobem? Jakým?** Konkrétní odpověď je cennější než obecné nadšení.
8. **Kdy jsem se nudil nebo nevěděl, co dělat?** To je stejně důležitý výsledek jako povedený moment.

**[NÁVRH]** Zkus prototyp projít alespoň třikrát s různými úmysly: opatrně, riskantně, experimentálně. Pak ho dej někomu, kdo nezná všechny naše návrhové úvahy, a sleduj, zda rozumí možnostem bez vysvětlování.

## 10. Jak poznáme, že má smysl pokračovat

**Dobré signály:**

- Během klidných minut tě baví sledovat, jak osada funguje.
- Dokážeš popsat alespoň jedno konkrétní rozhodnutí, které změnilo další průběh.
- Po expedici musíš upravit původní plán.
- Před nebezpečím cítíš napětí, ale ne bezmoc.
- Po krizi máš důvod pokračovat, ne jen načíst uloženou pozici.
- Po dokončení máš vlastní nápad na jinou strategii další partie.

**Varovné signály:**

- Většinu času jen čekáš na produkční čísla.
- Expedice je oddělená od vesnice a lze ji bezmyšlenkovitě spouštět.
- Obrana funguje pouze jako povinný poplatek za přežití.
- Obyvatelé jsou navzájem zaměnitelní a jejich jména nic nemění.
- Jedna volba je vždy výhodnější než ostatní.
- Poškození vesnice vede jen k nudnému opakování stejné práce.

**Žádný závěr není automatická prohra projektu.** Prototyp má odhalit, *který pilíř je slabý a proč*. Teprve potom má smysl investovat do větší hloubky.

## 11. Kdy je prototyp „dost hotový“

Ne až tehdy, když vypadá jako trailer. Stačí, když:

- lze začít novou partii se třemi obyvateli a základními zásobami,
- hráč má srozumitelnou kontrolu nad omezenou prací a alespoň jednou stavbou/investicí,
- funguje výroba a její náklady,
- výprava někoho odebere z vesnice a změní možnosti nebo riziko,
- hrozba dovolí přípravu a má hmatatelné důsledky,
- po krizi existuje smysluplná obnova,
- lze bez vývojářských zásahů odehrát celou epizodu,
- lze vyhodnotit otázky z předchozí části.

Tohle je **hranice herního prototypu**, ne instrukce, abys všechno stavěl najednou nebo v uvedeném pořadí.

## 12. Co bude prototypem neověřené

Úspěšný výsledek **neprokáže**, že budou automaticky zábavné desítky hodin hraní, větší populace, více vesnic, komplikovaná logistika, historie generací nebo pokročilé souboje. A také neověří finální vizuální atmosféru, pokud budou použity placeholdery.

Měl by však ukázat, jestli stojí za to tuto vizi dál rozvíjet — zda funguje **malé propojené jádro**, na které lze pozdější systémy smysluplně navazovat.

---

## Závěrečné pravidlo

> **Nejmenší prototyp není ten, který má nejméně funkcí. Je to ten, ve kterém už jedno rozhodnutí může zachránit nebo poškodit něco, na čem hráči záleží.**
>
> Zkusme vytvořit jednu malou vesnici, jeden skutečný důvod k výpravě, jednu uvěřitelnou hrozbu a jednu možnost vzpamatovat se z následků. Pokud se kvůli nim budeme chtít vrátit do další partie, máme důvod pokračovat.

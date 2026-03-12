# Javelin

# Struktur for MATLAB / Simulink-prosjekt

Dette prosjektet er strukturert slik at kode, modeller og data holdes adskilt.
Målet er at alle i gruppen enkelt skal kunne finne hvor ting hører hjemme og unngå at logikk, simulering og data blandes i samme filer.

Repository-strukturen er:

```
repo/
 ├── project.prj
 ├── models/
 │    └── system_model.slx
 ├── scripts/
 │    └── run_simulation.m
 ├── functions/
 │    └── control/
 │         └── pid_controller.m
 ├── data/
 └── tests/
```

---

# Generelle prinsipper

* **Simulink-modeller** skal kun beskrive systemstrukturen.
* **MATLAB-scripts** brukes til å starte simuleringer og analysere resultater.
* **Funksjoner** inneholder gjenbrukbar algoritmisk kode.
* **Datafiler** inneholder parametere og inngangsdata.
* **Tester** brukes til å verifisere at enkeltkomponenter fungerer.

Å holde disse rollene adskilt gjør prosjektet enklere å forstå og vedlikeholde.

---

# project.prj

MATLAB Project-fil.

Brukes til å:

* definere prosjektet i MATLAB
* sette riktig MATLAB path
* holde oversikt over avhengigheter

Denne filen opprettes vanligvis via:

```
MATLAB → New → Project → From Folder
```

Den bør ligge i repo-roten og commit-es til git.

---

# models/

Inneholder **Simulink-modeller (.slx)**.

Disse representerer selve simuleringen som blokkdiagram.

Typisk innhold:

* systemdynamikk
* sensorer
* aktuatorer
* kontrollsløyfer

Retningslinjer:

* ikke legg store datasett i modellen
* parametere bør komme fra MATLAB workspace eller datafiler
* bruk tydelige subsystemer

Eksempel:

```
models/system_model.slx
```

---

# scripts/

Inneholder **MATLAB scripts (.m)** som brukes til å kjøre simuleringer.

Scripts brukes til å:

* laste parametere
* sette initialbetingelser
* starte simuleringen
* lagre resultater
* generere plots

Scripts fungerer ofte som prosjektets **entry point**.

Eksempel:

```
scripts/run_simulation.m
```

Typisk arbeidsflyt i scriptet:

1. last inn data fra `data/`
2. sett opp variabler
3. kjør Simulink-modellen
4. lagre resultater

---

# functions/

Inneholder **gjenbrukbare MATLAB-funksjoner**.

Dette er kode som brukes flere steder i prosjektet.

Eksempler:

* kontrollalgoritmer
* matematiske beregninger
* koordinattransformasjoner
* filtrering

Funksjoner bør:

* gjøre én ting
* ta input og returnere output
* ikke gjøre plotting eller filskriving

Strukturen kan organiseres i undermapper etter funksjon:

```
functions/
 ├── control/
 ├── guidance/
 ├── dynamics/
 └── utilities/
```

---

# data/

Inneholder **parametere og inngangsdata** til simuleringen.

Eksempler:

* systemparametere
* aerodynamiske koeffisienter
* initialbetingelser
* testscenarier

Vanlige filtyper:

```
parameters.mat
initial_conditions.mat
environment.mat
```

Fordelen med å samle dette her er at simuleringen kan endres uten å modifisere modell eller algoritmekode.

---

# tests/

Inneholder **tester og verifikasjonsskripter**.

Disse brukes til å teste enkeltkomponenter isolert.

Eksempler:

```
tests/test_controller.m
tests/test_dynamics.m
```

Tester kan brukes til å:

* verifisere at funksjoner fungerer korrekt
* sjekke at endringer ikke ødelegger eksisterende funksjonalitet
* validere delsystemer før de integreres i hovedmodellen

---

# Anbefalt arbeidsflyt

1. Legg algoritmer i `functions/`
2. Legg systemmodellen i `models/`
3. Lag scripts i `scripts/` som kjører simuleringen
4. Lagre parametere i `data/`
5. Test delsystemer i `tests/`

Dette gjør at prosjektet forblir strukturert selv når det vokser.

---
mainfont: "Fira Sans"
sansfont: "Fira Sans"
geometry:
  - a4paper
  - left=3cm
  - right=2cm
  - top=2.5cm
  - bottom=3cm
  - includefoot # include spazio piede pagina nei calcoli
---

# La Matematica del Suono Digitale

## **Slide: Perché la matematica per il DSP?**

Quando iniziamo a parlare di Digital Signal Processing, molti musicisti e produttori si spaventano alla parola "matematica". Ma c'è una ragione fondamentale per cui non possiamo evitarla: il suono è fisica, e la fisica si descrive con la matematica.

Pensa a cosa succede quando suoni una corda di chitarra. La corda vibra, sposta l'aria circostante, crea onde di pressione che si propagano nello spazio fino alle tue orecchie. Questo è un fenomeno fisico, governato da leggi precise: tensione della corda, massa, lunghezza, frequenza di vibrazione. Tutte queste grandezze sono legate da relazioni matematiche. La frequenza fondamentale di una corda è inversamente proporzionale alla sua lunghezza - dimezzi la lunghezza, raddoppi la frequenza, sali di un'ottava. Questa è matematica.

Ma perché ti serve capire la matematica per fare DSP? Perché non puoi manipolare ciò che non sai descrivere con precisione. Quando apri un equalizzatore e abbassi i bassi a 100 Hz con uno shelf filter, stai applicando una funzione matematica al tuo segnale audio. Quando usi un compressore con ratio 4:1, stai applicando una funzione matematica che riduce l'ampiezza del segnale quando supera una certa soglia. Quando aggiungi un riverbero, stai eseguendo una convoluzione - un'operazione matematica che combina il tuo segnale dry con la risposta impulsiva di uno spazio.

Ogni singolo processo in un DAW, ogni plugin, ogni effetto, ogni sintesi, è matematica applicata. La sintesi FM (Frequency Modulation) inventata da John Chowning negli anni '60? Matematica - modulazione di frequenza tramite funzioni trigonometriche. La sintesi additiva? Somma di onde sinusoidali, ognuna descritta da funzioni matematiche. I filtri analogici che imitiamo digitalmente? Equazioni differenziali tradotte in algoritmi.

Il ponte essenziale tra il fenomeno fisico del suono e la tua capacità di controllarlo digitalmente è la matematica. Non è un ostacolo, è uno strumento di potere creativo. Comprendere la matematica significa comprendere cosa sta realmente accadendo al tuo audio, non premere bottoni a caso sperando in un risultato. Significa poter predire l'effetto di un processo prima di applicarlo. Significa poter creare i tuoi strumenti invece di limitarti a usare quelli esistenti.

La matematica è il linguaggio del DSP. E come ogni linguaggio, una volta imparato, apre un mondo nuovo. In questa presentazione, partiremo dalle basi assolute - cos'è una funzione, cos'è un grafico - e arriveremo a capire come il computer traduce il suono continuo del mondo reale in sequenze di numeri che può manipolare. Questo è il viaggio dalla matematica al DSP.

---

## **Slide: Il suono come fenomeno matematico**

Un'onda sonora è, fondamentalmente, una funzione matematica. Cosa significa? Significa che possiamo descriverla come una relazione precisa tra il tempo e un'altra grandezza - tipicamente la pressione dell'aria in un punto dello spazio.

Quando dico P(t) - "P di t" - sto usando la notazione matematica per dire "la pressione in funzione del tempo". Il simbolo P rappresenta la pressione, il simbolo t rappresenta il tempo, e P(t) significa "dimmi che tempo è, e io ti dirò quale pressione c'è in quel momento". Questo è esattamente ciò che un microfono fa: campiona continuamente la pressione dell'aria e la converte in segnale elettrico. Il diagramma che vedi - tempo sull'asse orizzontale, ampiezza sull'asse verticale - è la rappresentazione grafica di questa funzione.

L'esempio che vedi è un'onda sinusoidale a 440 Hz, il La centrale del pianoforte. Questa curva matematicamente perfetta descrive come varia la pressione nel tempo per produrre quel suono specifico. Perché proprio questa forma? Perché il seno (sin) è una funzione matematica che descrive movimenti oscillatori perfetti, come quello di un pendolo o di una corda che vibra nel suo modo fondamentale. La frequenza - 440 Hz - significa che questa oscillazione si ripete 440 volte al secondo. Matematicamente: 

$$
sin(2 * pi * 440 * t)
$$

dove t è il tempo in secondi.

Ma il vero potere della visione matematica del suono emerge quando iniziamo a parlare di trasformazioni. Ogni processo audio che applichi è una funzione matematica che trasforma il segnale in ingresso in un segnale in uscita.

Un filtro passa-basso è una funzione che, data una frequenza in ingresso, decide quanto guadagno dare in uscita. Sotto la frequenza di taglio, il guadagno è circa 1 (il segnale passa inalterato). Sopra la frequenza di taglio, il guadagno diminuisce progressivamente. Questa relazione frequenza → guadagno è una funzione matematica, e la forma di questa funzione determina il carattere del filtro (Butterworth, Chebyshev, ellittico, ecc.).

Un riverbero è qualcosa di più complesso: è una convoluzione. Tecnicamente, prendi il tuo segnale dry e lo "convolvi" con la risposta impulsiva di uno spazio. La convoluzione è un'operazione matematica che, punto per punto, combina due funzioni. Il risultato? Il tuo suono che sembra provenire da quello spazio.

Un compressore applica una funzione non lineare. Sotto la soglia (threshold), l'uscita è uguale all'ingresso (funzione identità: y = x). Sopra la soglia, l'uscita cresce più lentamente dell'ingresso secondo il ratio. Se il ratio è 4:1, per ogni 4 dB che il segnale sale sopra la threshold, l'uscita sale solo di 1 dB. Questa è una funzione a tratti: lineare sotto un certo punto, con pendenza diversa sopra quel punto.

Un delay è una funzione con shift temporale. Matematicamente, se il tuo segnale è x(t), il delay produce x(t - d), dove d è il tempo di ritardo. Stai letteralmente spostando la funzione nel tempo.

L'obiettivo di questa presentazione è darti gli strumenti matematici di base per capire queste trasformazioni. Inizieremo dalle funzioni più semplici - funzioni lineari, quadratiche, esponenziali, trigonometriche - e capiremo come ognuna di esse appare in contesti audio reali. Poi vedremo come passiamo dal mondo continuo (onde analogiche) al mondo discreto (sequenze di numeri digitali). Alla fine, avrai la base matematica per comprendere qualsiasi algoritmo DSP.

Non serve essere un matematico per capire questi concetti. Serve solo curiosità e la volontà di vedere il suono attraverso una lente diversa - la lente della matematica, che è il linguaggio naturale con cui i computer "pensano" al suono.


## **Slide: La funzione come "macchina trasformatrice"**

Prima di parlare di matematica complessa, dobbiamo capire cos'è una funzione nel modo più semplice possibile. E la metafora migliore è quella della macchina: una funzione è una macchina che trasforma input in output secondo una regola fissa.

Immagina un distributore automatico. Metti dentro dei soldi (input), premi un bottone (la regola), e ricevi uno snack (output). Ogni volta che metti la stessa quantità di soldi e premi lo stesso bottone, ricevi lo stesso snack. Non è casuale. È deterministico. Questa è l'essenza di una funzione: una relazione precisa e ripetibile tra input e output.

Nel contesto audio, pensa a un pedale effetto - per esempio un distorsore. Il segnale pulito della tua chitarra entra nel pedale (input), il circuito del pedale applica una trasformazione al segnale (la regola - tipicamente una funzione non lineare che "clippa" i picchi del segnale), e esce un suono distorto (output). Ogni volta che suoni la stessa nota con la stessa intensità e le stesse impostazioni del pedale, ottieni lo stesso suono distorto. Questo è una funzione in azione.

La caratteristica fondamentale di una funzione è che è deterministica: stesso input produce sempre lo stesso output. Se metti x = 2 e la funzione è f(x) = x², ottieni sempre y = 4. Se metti x = 5, ottieni sempre y = 25. Non c'è randomicità, non c'è imprevedibilità. La regola è fissa.

Nel diagramma vedi una rappresentazione schematica: una "scatola" che rappresenta la funzione f. Entra x (in blu), la macchina applica la sua regola interna, esce y (in rosso). Nel nostro esempio, la regola è "eleva al quadrato": qualsiasi numero tu metta dentro, la macchina lo moltiplica per se stesso e restituisce il risultato.

Perché questo concetto è così importante per l'audio digitale? Perché ogni singolo processo che applichi al tuo audio può essere visto come una funzione. Un inviluppo è una funzione che, dato un tempo t (quanti secondi sono passati dalla pressione del tasto), restituisce un'ampiezza (quanto forte dovrebbe suonare la nota in quel momento). Un filtro è una funzione che, data una frequenza, decide quanto guadagno darle. Un delay è una funzione che prende il segnale e lo sposta nel tempo. Tutto è funzione.

Quando comprendi questo, inizi a vedere la produzione audio in modo completamente diverso. Non stai solo "applicando effetti" - stai componendo funzioni matematiche, stai costruendo catene di trasformazioni deterministiche che plasmano il suono esattamente come vuoi tu.

---

## **Slide: Dominio e codominio: i limiti della macchina**

Ogni funzione ha dei limiti. Non puoi mettere qualsiasi cosa dentro, e non puoi aspettarti qualsiasi cosa fuori. Questi limiti si chiamano dominio e codominio.

Il **dominio** è l'insieme di tutti i valori che puoi mettere dentro la funzione. È la risposta alla domanda "quali x posso usare?". Alcune funzioni accettano qualsiasi numero: la funzione f(x) = 2x funziona con qualsiasi x, da -infinito a +infinito. Altre funzioni hanno restrizioni: la radice quadrata di x ha senso solo per x ≥ 0, perché non puoi fare la radice quadrata di un numero negativo (almeno non nei numeri reali). In quel caso, il dominio è [0, +∞).

Il **codominio** è l'insieme di tutti i valori che la funzione può restituire. È la risposta alla domanda "quali y posso ottenere?". Per esempio, se la funzione è f(x) = x² (elevare al quadrato), il codominio è [0, +∞) perché un numero al quadrato è sempre positivo o zero, mai negativo.

Nell'audio, dominio e codominio hanno significati molto concreti. Prendiamo l'esempio di una forma d'onda digitale. Il dominio è il tempo: se hai registrato 10 secondi di audio, il dominio è l'intervallo [0, 10] secondi. Il codominio è l'ampiezza del segnale: in audio digitale normalizzato, questo è tipicamente [-1, +1], dove -1 è il minimo assoluto, +1 è il massimo assoluto, e 0 è il silenzio.

La funzione stessa è la forma d'onda: per ogni istante di tempo t nel dominio [0, 10], la funzione ti dice quale ampiezza A(t) c'è in quel momento. Se dici "dimmi cosa succede a t = 3.5 secondi", la funzione risponde "A(3.5) = 0.7" - in quel momento il segnale ha ampiezza 0.7.

Nel diagramma vedi due insiemi: a sinistra il dominio (in blu), a destra il codominio (in rosso). Le frecce rappresentano la funzione: prendono elementi dal dominio e li collegano a elementi del codominio. Nota una cosa importante: ogni elemento del dominio ha **una e una sola** freccia che esce. Questo è cruciale nella definizione di funzione. Non puoi avere x₁ che punta sia a y₁ che a y₂ - questo violerebbe il principio "stesso input, stesso output". Però è perfettamente legale che più elementi del dominio puntino allo stesso elemento del codominio (per esempio, f(x) = x² manda sia -2 che +2 a 4).

Capire dominio e codominio ti aiuta a pensare in modo più chiaro a cosa stai facendo con l'audio. Quando applichi un limiter che taglia tutto sopra 0 dB, stai restringendo il codominio. Quando usi un time-stretching che raddoppia la durata di un campione, stai espandendo il dominio. Quando fai pitch shifting, stai modificando la funzione in modo non lineare nel tempo. Ogni operazione può essere descritta in termini di dominio, codominio, e trasformazione della funzione.

---

## **Slide: Notazione matematica (semplificata)****

Ora che capisci cos'è una funzione concettualmente, vediamo come i matematici la scrivono. La notazione standard è:

**y = f(x)**

oppure equivalentemente

**f(x) = y**

Si legge "y uguale f di x" oppure "f di x uguale y". Cosa significano questi simboli?

- **x** è la variabile di input, l'argomento della funzione. È il valore che metti dentro.
- **f** è il nome della funzione, la "regola" che viene applicata. Puoi chiamare le funzioni come vuoi: f, g, h, A, B, Volume, Frequenza... è solo un nome.
- **y** è il valore di output, il risultato della funzione applicata a x.

Esempi concreti. Se scrivo f(x) = 2x, sto dicendo "la funzione f prende un numero x e lo moltiplica per 2". Quindi f(3) = 6, f(10) = 20, f(-5) = -10. La regola è "moltiplica per 2".

Se scrivo g(t) = sin(t), sto dicendo "la funzione g prende un valore t (che tipicamente rappresenta il tempo) e calcola il seno di quel valore". Questa è la funzione che descrive un'oscillazione sinusoidale.

A volte, invece di scrivere y = f(x), scriviamo direttamente il nome della funzione con il suo argomento senza definire y esplicitamente. Per esempio, in audio scriviamo A(t) per indicare "l'ampiezza in funzione del tempo". Non stiamo dicendo "y uguale A di t", stiamo semplicemente dicendo "A dipende da t", "A è funzione di t".

Nel diagramma vedi la formula y = f(x) con annotazioni colorate. In blu c'è y, l'output. In arancione c'è f, la funzione stessa. In rosso c'è x, l'input. Questa è la struttura base che vedrai in quasi tutta la matematica che riguarda il DSP.

Un esempio audio concreto: A(t) = 0.5. Questa è una funzione costante. Qualsiasi tempo t tu metta dentro, l'ampiezza è sempre 0.5. Questo potrebbe rappresentare un suono sostenuto a volume medio costante, come un organo che tiene premuto un tasto.

Altro esempio: A(t) = t / 10. Questa è una funzione lineare. L'ampiezza cresce proporzionalmente al tempo. A t = 0, A = 0 (silenzio). A t = 5, A = 0.5 (metà volume). A t = 10, A = 1 (volume massimo). Questo è un fade-in lineare di 10 secondi.

La notazione matematica può sembrare astrusa all'inizio, ma in realtà è estremamente pratica: ti permette di scrivere in modo compatto e non ambiguo relazioni complesse. Invece di dire a parole "l'ampiezza del suono in ogni momento è uguale al seno di due pi greco per la frequenza fondamentale per il tempo", scrivi semplicemente: A(t) = sin(2πf₀t). Molto più chiaro, molto più preciso.

---

## **Slide: Funzioni nell'audio: esempi concreti**

Ora colleghiamo tutto quanto abbiamo detto a situazioni audio reali. Vediamo tre esempi fondamentali di funzioni che incontri continuamente nel DSP.

**1. Inviluppo ADSR**

Quando premi un tasto su un sintetizzatore, il volume del suono non passa istantaneamente da zero al massimo e poi torna a zero quando rilasci il tasto. C'è un'evoluzione temporale controllata dall'inviluppo, e il tipo più comune è l'ADSR: Attack, Decay, Sustain, Release.

Matematicamente, questo è una funzione A(t) - ampiezza in funzione del tempo - definita "a tratti". Cosa significa? Significa che la regola cambia in diverse fasi:

- **Attack (0 ≤ t < t_attack)**: l'ampiezza sale linearmente da 0 a 1. La funzione potrebbe essere A(t) = t / t_attack.
- **Decay (t_attack ≤ t < t_decay)**: l'ampiezza scende da 1 al livello di sustain. Potrebbe essere A(t) = 1 - (1-sustain)×(t-t_attack)/(t_decay-t_attack).
- **Sustain (t_decay ≤ t < t_release)**: l'ampiezza rimane costante. A(t) = sustain.
- **Release (t ≥ t_release)**: l'ampiezza scende dal sustain a 0. Potrebbe essere A(t) = sustain × (1 - (t-t_release)/t_release_time).

Il dominio è il tempo (da quando premi il tasto a quando finisce il release). Il codominio è l'ampiezza [0, 1]. Nel grafico che vedi, puoi vedere chiaramente le quattro fasi: una salita rapida (attack), una discesa (decay), un plateau orizzontale (sustain), e una discesa finale (release). Questa è una funzione matematica precisa che controlla esattamente come evolve il volume della nota nel tempo.

**2. Risposta di un filtro**

Un filtro è, fondamentalmente, una funzione che dice "per ogni frequenza che entra, quanto guadagno le do in uscita?". Un filtro passa-basso lascia passare le basse frequenze e attenua le alte. Matematicamente, se chiamiamo questa funzione G(f) - guadagno in funzione della frequenza - potremmo avere:

- Per f < f_cutoff (sotto la frequenza di taglio): G(f) ≈ 1 (passa quasi inalterato, 0 dB)
- Per f > f_cutoff (sopra la frequenza di taglio): G(f) decresce, tipicamente come 1/(f/f_cutoff)^n dove n determina la "pendenza" del filtro (6 dB/ottava per n=1, 12 dB/ottava per n=2, ecc.)

Il dominio è la frequenza (tipicamente 20 Hz - 20 kHz, lo spettro udibile). Il codominio è il guadagno, spesso espresso in dB. Questo è fondamentale per capire equalizzatori, filtri, crossover, qualsiasi cosa riguardi lo shaping spettrale.

**3. Oscillatore**

L'esempio più puro di funzione in audio è un oscillatore sinusoidale. La formula è:

y(t) = A × sin(2πf₀t + φ)

Dove:
- t è il tempo (dominio)
- A è l'ampiezza massima (controlla il volume)
- f₀ è la frequenza fondamentale in Hz (quante oscillazioni al secondo)
- φ è la fase iniziale (da dove parte l'onda)
- y(t) è la posizione dell'onda in quel momento (codominio, tipicamente [-A, +A])

Se f₀ = 440 Hz, questa funzione produce il La centrale. Se f₀ = 880 Hz, produce il La un'ottava sopra. L'onda oscilla esattamente f₀ volte al secondo, in modo perfettamente periodico.

Il bello della matematica è che possiamo combinare queste funzioni. La sintesi additiva, per esempio, somma tanti oscillatori a frequenze diverse:

y(t) = A₁sin(2πf₁t) + A₂sin(2πf₂t) + A₃sin(2πf₃t) + ...

Ogni termine è una funzione. La somma è ancora una funzione. E il risultato è un timbro complesso fatto di armoniche.

Questi tre esempi - inviluppo, filtro, oscillatore - sono i mattoni fondamentali di qualsiasi sintesi digitale. E tutti sono funzioni matematiche. Quando capisci le funzioni, capisci come controllare ogni aspetto del tuo suono con precisione assoluta.

## **Slide: Introduzione al piano cartesiano**

Il piano cartesiano è uno degli strumenti più potenti mai inventati in matematica, e probabilmente lo usi già senza saperlo ogni volta che guardi una forma d'onda nel tuo DAW. Ma partiamo dall'inizio: cos'è esattamente?

Il piano cartesiano è semplicemente un modo per rappresentare visivamente relazioni tra due grandezze. Immagina di avere due linee rette perpendicolari - una orizzontale e una verticale - che si incrociano. La linea orizzontale si chiama asse X (o asse delle ascisse), la verticale si chiama asse Y (o asse delle ordinate). Il punto dove si incrociano si chiama origine e ha coordinate (0, 0).

Questa invenzione, che risale a René Descartes nel 1637, rivoluzionò la matematica perché permise di tradurre problemi geometrici in problemi algebrici e viceversa. Il nome "cartesiano" viene proprio dal nome latino di Descartes: Cartesius. Prima del piano cartesiano, geometria e algebra erano mondi separati. Descartes li unificò.

Ma a cosa serve concretamente? Serve a visualizzare relazioni. Invece di dire a parole "la temperatura aumenta di 2 gradi ogni ora", puoi tracciare un grafico e vedere immediatamente l'andamento. Invece di avere una tabella con 1000 numeri che descrivono un'onda sonora, puoi tracciare la curva e vedere istantaneamente la forma dell'onda. Il piano cartesiano trasforma numeri in immagini, e il nostro cervello è molto più bravo a elaborare informazioni visive che lunghe liste di numeri.

Nel grafico che vedi, nota che ci sono quattro "quadranti" - quattro zone divise dagli assi. Il primo quadrante (in alto a destra) ha sia X che Y positive. Il secondo (in alto a sinistra) ha X negative e Y positive. Il terzo (in basso a sinistra) ha entrambe negative. Il quarto (in basso a destra) ha X positive e Y negative. Questo sistema ti permette di rappresentare valori sia positivi che negativi in entrambe le direzioni.

Nell'audio, questo è fondamentale. Un'onda sonora oscilla sopra e sotto lo zero - ha ampiezze positive e negative. Il piano cartesiano ti permette di rappresentare tutto questo in modo naturale. L'asse X sarà il tempo (sempre positivo - il tempo va avanti), l'asse Y sarà l'ampiezza (positiva e negativa - l'onda oscilla).

---

## **Slide: Come si legge un grafico**

Ora che sai cos'è il piano cartesiano, dobbiamo capire come "leggere" i punti su di esso. Ogni punto sul piano ha una coppia di numeri associata, chiamata coordinate, scritte come (x, y).

Il primo numero - x - ti dice dove sei sull'asse orizzontale. Il secondo numero - y - ti dice dove sei sull'asse verticale. L'ordine è importantissimo: (2, 3) è un punto completamente diverso da (3, 2). Il primo è "2 in orizzontale, 3 in verticale", il secondo è "3 in orizzontale, 2 in verticale".

Come trovi fisicamente un punto? È come dare indicazioni stradali. Parti dall'origine (0, 0). Se la prima coordinata è positiva, vai a destra; se è negativa, vai a sinistra. Poi, dalla posizione dove sei arrivato, se la seconda coordinata è positiva vai in su, se è negativa vai in giù.

Esempio pratico: il punto (2, 3). Parti dall'origine. Vai 2 unità a destra lungo l'asse X. Poi, da lì, vai 3 unità in su. Sei arrivato al punto (2, 3). Nel grafico che vedi, questo è il punto blu marcato con A.

Il punto (-1, 2) - punto rosso B - si trova andando 1 unità a sinistra (perché è -1) e poi 2 in su. Il punto (1, -2) - punto verde C - si trova andando 1 a destra e poi 2 in giù (perché è -2).

Nel grafico ho tracciato in blu tratteggiato il "percorso" per arrivare al punto A: prima ti muovi di +2 in orizzontale (freccia lungo X), poi di +3 in verticale (freccia lungo Y). Questo chiarisce visivamente il processo.

Perché è importante capire questo? Perché quando guardi qualsiasi grafico in audio - risposta in frequenza di un filtro, curva di un compressore, envelope di un synth - stai guardando punti sul piano cartesiano. Se un grafico ti dice che a 1000 Hz il filtro ha guadagno -6 dB, quel punto è (1000, -6). L'asse X è la frequenza, l'asse Y è il guadagno. Il punto ti dice "quando l'input è 1000 Hz, l'output è -6 dB".

L'origine (0, 0) è sempre il punto di riferimento. In un grafico ampiezza-tempo di una forma d'onda, (0, 0) significa "al tempo zero, l'ampiezza è zero" - cioè, all'inizio della registrazione c'è silenzio. In un grafico frequenza-guadagno di un EQ, (0, 0) significa "a 0 Hz (DC), il guadagno è 0 dB" - anche se in pratica l'asse X partirà da 20 Hz, non da 0, perché 0 Hz non è nell'audio.

---

## **Slide: Dal grafico alla funzione**

Ora colleghiamo il piano cartesiano alle funzioni. Una funzione y = f(x) può essere rappresentata come una curva sul piano cartesiano. Ogni punto (x, y) sulla curva soddisfa l'equazione y = f(x).

Cosa significa? Significa che se prendi qualsiasi punto sulla curva e guardi le sue coordinate, la seconda coordinata (y) è esattamente uguale a f applicata alla prima coordinata (x). Se la funzione è f(x) = x², e prendi il punto (2, 4) sulla curva, verifica: f(2) = 2² = 4. Funziona. Il punto (3, 9) è sulla curva perché f(3) = 3² = 9. Il punto (3, 8) NON è sulla curva perché f(3) ≠ 8.

Nel grafico vedi una parabola - la curva della funzione f(x) = 0.3x². I punti rossi sono punti specifici sulla curva. Per esempio, il punto a x = 2 ha y = 0.3 × 2² = 0.3 × 4 = 1.2. Infatti nel grafico vedi che quando x = 2, la curva è all'altezza y ≈ 1.2.

Ma c'è una proprietà cruciale che distingue le funzioni da generiche curve: per ogni valore di x, ci può essere UN SOLO valore di y. Questo è il cuore della definizione di funzione. Non puoi avere un x che punta a due y diversi.

Esiste un test visivo semplice per verificare se una curva rappresenta una funzione: il "vertical line test" (test della linea verticale). Immagina di tracciare una linea verticale (parallela all'asse Y) in qualsiasi punto del grafico. Se questa linea tocca la curva in più di un punto, allora quella curva NON è una funzione. Se tocca sempre e solo un punto (o nessuno), allora è una funzione.

Nel nostro grafico ho tracciato una linea verticale arancione a x = 2. Vedi che tocca la curva esattamente in un punto. Puoi spostare mentalmente quella linea a sinistra o destra - toccherà sempre un solo punto. Questa curva passa il test: è una funzione.

Perché questo test funziona? Perché una linea verticale a un certo x significa "tutti i punti che hanno questa coordinata x". Se la linea tocca la curva in due punti, significa che ci sono due punti con lo stesso x ma diversi y. E questo viola la definizione di funzione: stesso input, stesso output.

Nell'audio, tutte le forme d'onda sono funzioni nel senso matematico. A(t) = ampiezza al tempo t. Per ogni istante di tempo t, c'è una e una sola ampiezza. Non puoi avere t = 0.5 secondi dove l'ampiezza è contemporaneamente 0.3 e 0.7 - sarebbe fisicamente impossibile. Il segnale audio ha un valore definito in ogni istante.

---

## **Slide: Esempio audio: forma d'onda**

Ora applichiamo tutto quello che abbiamo visto al caso più concreto possibile: la forma d'onda che vedi ogni giorno nel tuo DAW.

Quando registri audio e guardi la rappresentazione visiva del file audio, stai guardando un grafico sul piano cartesiano. L'asse orizzontale (X) rappresenta il tempo - tipicamente in secondi, millisecondi, o samples. L'asse verticale (Y) rappresenta l'ampiezza del segnale - tipicamente normalizzata tra -1 e +1, oppure in dBFS (decibel Full Scale).

La curva che vedi - la "waveform" - è letteralmente il grafico della funzione A(t), dove A è l'ampiezza e t è il tempo. Ogni punto sulla curva ti dice "a questo tempo, l'ampiezza era questo valore".

Nel grafico che vedi ho tracciato un'onda sinusoidale pura a 440 Hz - il La centrale. L'asse X va da 0 a 20 millisecondi. L'asse Y va da -1 a +1 (ampiezza normalizzata). La curva blu è A(t) = sin(2π × 440 × t).

Noti i punti rossi? Quello all'origine (0, 0) significa "al tempo zero, l'ampiezza è zero". Il punto al picco superiore è a circa (0.57 ms, 1), che significa "dopo 0.57 millisecondi, l'ampiezza è al massimo positivo". Il punto successivo a zero è a (1.14 ms, 0), che significa "dopo 1.14 millisecondi, l'ampiezza è tornata a zero".

La distanza tra questi zeri - circa 2.27 millisecondi - è il periodo dell'onda. Il periodo è 1/frequenza. Se la frequenza è 440 Hz, il periodo è 1/440 secondi ≈ 2.27 millisecondi. In 20 millisecondi, l'onda completa circa 8.8 cicli (20 ms / 2.27 ms ≈ 8.8).

Quando apri un DAW e zoomi su una forma d'onda, stai letteralmente guardando questo tipo di grafico. Se vedi oscillazioni molto ravvicinate, la frequenza è alta. Se vedi oscillazioni più lente e larghe, la frequenza è bassa. Se i picchi sono alti, il volume è alto. Se i picchi sono piccoli, il volume è basso. Se la linea è piatta a zero, c'è silenzio.

Ogni operazione che fai in un DAW è una trasformazione di questa funzione. Normalizzi l'audio? Stai moltiplicando tutti i valori di A(t) per una costante in modo che il massimo diventi 1. Inverte la fase? Stai moltiplicando A(t) per -1, ribaltando il grafico sull'asse X. Fai un fade-in? Stai moltiplicando A(t) per una funzione che parte da 0 e sale gradualmente a 1.

Il piano cartesiano non è solo uno strumento matematico astratto. È il modo in cui il tuo computer rappresenta, visualizza, e ti permette di manipolare l'audio. Ogni pixel verticale nella waveform display corrisponde a un valore di ampiezza. Ogni pixel orizzontale corrisponde a un intervallo di tempo. La curva è la funzione. E ora sai esattamente cosa significa tutto questo, matematicamente.


## **Slide: Funzione costante: y = k**

Iniziamo il nostro viaggio attraverso le funzioni fondamentali con la più semplice di tutte: la funzione costante. Matematicamente, si scrive semplicemente y = k, dove k è un numero fisso, una costante.

Cosa significa? Significa che non importa quale valore di x metti dentro, l'output è sempre lo stesso numero k. Se k = 5, allora y è sempre 5. Metti x = 0? y = 5. Metti x = 100? y = 5. Metti x = -73.5? y = 5. Sempre lo stesso risultato. La funzione è "indifferente" all'input.

Sul piano cartesiano, questo si manifesta come una linea perfettamente orizzontale. Se k = 2, la linea sta tutta all'altezza y = 2. Se k = 0, la linea coincide con l'asse X. Nel grafico che vedi ci sono tre funzioni costanti: y = 2 (blu), y = 1 (rosso), e y = 0.5 (verde). Sono tutte linee orizzontali, parallele tra loro, a diverse altezze.

La pendenza di una funzione costante è zero. Non sale e non scende - è perfettamente piatta. In termini di "tasso di cambiamento", il tasso è zero: y non cambia mai, indipendentemente da come cambia x.

Nell'audio, le funzioni costanti appaiono in contesti specifici. Un esempio classico è il DC offset - quando un segnale audio ha un valore medio non nullo. Idealmente, un'onda audio dovrebbe oscillare simmetricamente sopra e sotto lo zero, con media zero. Ma se c'è un offset DC, il segnale è "spostato" di una costante - per esempio, invece di oscillare tra -1 e +1, oscilla tra -0.5 e +1.5. Quel -0.5 di offset è una componente costante aggiunta al segnale.

Altro esempio audio: il sustain di un organo. Quando premi un tasto di un organo e lo tieni premuto, il volume rimane costante finché non rilasci. Se rappresenti l'ampiezza nel tempo durante il sustain, è una funzione costante: A(t) = k, dove k è il livello di sustain. Non cresce, non decresce, rimane lì finché non intervieni.

Anche se sembra banale, la funzione costante è un building block importante. Ogni funzione più complessa può essere vista come una funzione costante più qualcosa che varia. E nei sistemi audio digitali, il concetto di "valore costante" è fondamentale per bias, offset, gain fisso, e altro.

---

## **Slide: Funzione lineare: y = mx + q**

Passiamo alla funzione lineare, la forma più semplice di funzione che effettivamente *cambia*. La formula generale è y = mx + q.

Scomponiamo i parametri. Il parametro m è la pendenza (in inglese "slope"). Ti dice quanto velocemente y cresce (o decresce) quando x aumenta. Se m = 2, significa che ogni volta che x aumenta di 1, y aumenta di 2. Se m = -1, ogni volta che x aumenta di 1, y *diminuisce* di 1. Se m = 0, torniamo alla funzione costante - nessun cambiamento.

Il segno di m determina la direzione: m positivo significa che la funzione sale (crescente), m negativo significa che scende (decrescente). Il valore assoluto |m| determina quanto è ripida la salita o discesa: |m| grande = pendenza ripida, |m| piccolo = pendenza dolce.

Il parametro q è l'intercetta, il valore di y quando x = 0. Geometricamente, è il punto dove la retta incrocia l'asse Y. Se q = 1 e m = 2, la funzione è y = 2x + 1: quando x = 0, y = 1; quando x = 1, y = 3; quando x = 2, y = 5. Vedi il pattern? Ogni step di x produce un incremento costante di 2 in y.

La proprietà chiave della funzione lineare è che ha un tasso di cambiamento costante. Δy / Δx è sempre uguale a m, indipendentemente da dove sei sulla retta. Questo la rende prevedibile e semplice da analizzare.

Nel grafico vedi tre rette con diverse pendenze. La blu (y = 2x + 1) ha pendenza positiva ripida. La rossa (y = -x + 2) ha pendenza negativa. La verde (y = 0.5x) ha pendenza positiva ma dolce. Nota che la blu incrocia l'asse Y a y = 1 (q = 1), evidenziato dal puntino blu e dalla linea tratteggiata.

Le funzioni lineari sono ovunque nella matematica e nella fisica perché approssimare linearmente un problema è spesso il primo passo per risolverlo. "Locally linear" - localmente lineare - è un concetto potente: anche se una funzione complessa non è lineare globalmente, in un piccolo intervallo può essere approssimata da una retta.

---

## **Slide: Applicazioni audio lineari**

Nell'audio, le funzioni lineari appaiono ogni volta che vuoi una transizione graduale a velocità costante.

**Fade in e fade out.** Quando fai un fade in lineare, stai moltiplicando il segnale audio per una funzione che cresce linearmente da 0 a 1. Matematicamente: A(t) = t / T, dove T è la durata del fade. A t = 0, A = 0 (silenzio). A t = T, A = 1 (volume pieno). Nel mezzo, il volume cresce a velocità costante. Nel grafico vedi esattamente questo: una rampa da 0 a 1 in 5 secondi, con pendenza costante.

Il fade out è l'inverso: A(t) = 1 - t/T. Parti da 1, finisci a 0, sempre con decrescita lineare costante.

**Glissando lineare.** Un glissando è uno scivolamento continuo di frequenza, come quando fai scorrere il dito su una corda o usi un pitch bend. Se il glissando è lineare, la frequenza cambia a velocità costante: f(t) = f₀ + kt, dove f₀ è la frequenza iniziale e k è la velocità di cambiamento in Hz al secondo. Se parti da 440 Hz e vuoi arrivare a 880 Hz (un'ottava) in 2 secondi, allora k = (880-440)/2 = 220 Hz/s. Ogni secondo, la frequenza sale di 220 Hz.

**Pan lineare.** Quando panni un suono da sinistra a destra in modo lineare, il gain del canale sinistro decresce linearmente mentre quello destro cresce linearmente. L(t) = 1 - t/T, R(t) = t/T. La somma è sempre 1 (legge di potenza costante), ma la distribuzione stereo si sposta uniformemente.

**Velocity mapping.** In MIDI, la velocity (quanto forte premi un tasto) è un numero da 0 a 127. Spesso, questo viene mappato linearmente al volume: velocity 0 = silenzio, velocity 127 = volume massimo. La relazione è lineare: volume = velocity / 127. Anche se, per realismo, molti strumenti virtuali usano curve non lineari (quadratiche o esponenziali) per rendere la risposta più espressiva.

Le transizioni lineari sono semplici da calcolare e concettualmente chiare, ma non sempre sono le più "musicali". Il tuo orecchio e il tuo cervello spesso percepiscono fade lineari come troppo bruschi all'inizio o alla fine. Per questo, in molti contesti audio, si preferiscono fade con curve esponenziali o quadratiche, che risultano più naturali. Ma la funzione lineare rimane il punto di partenza e la baseline di riferimento.

---

## **Slide: Funzione quadratica: y = ax² + bx + c**

Ora facciamo un salto di complessità: la funzione quadratica. La forma più generale è y = ax² + bx + c, ma spesso, per capire l'essenza, guardiamo la forma semplificata: y = ax².

La differenza chiave rispetto alla lineare è l'esponente: x viene elevato al quadrato. Questo introduce curvatura. La funzione quadratica non ha un tasso di cambiamento costante - il tasso di cambiamento stesso cambia. Questo produce una curva chiamata parabola.

Il parametro a controlla la curvatura e la direzione. Se a > 0, la parabola si apre verso l'alto (forma di U). Se a < 0, si apre verso il basso (forma di n). Il valore assoluto di a determina quanto è "stretta" o "larga" la parabola. Un |a| grande produce una parabola stretta e ripida. Un |a| piccolo produce una parabola larga e dolce.

Nel grafico vedi tre parabole: y = 0.5x² (blu, larga), y = x² (rosso, media), y = 2x² (verde, stretta). Tutte passano per l'origine (0, 0) perché non c'è termine costante (c = 0) e tutte sono simmetriche rispetto all'asse Y.

La proprietà chiave della quadratica è l'accelerazione o decelerazione. Pensa al moto di un oggetto lanciato in aria: la posizione verticale nel tempo segue una parabola a causa della gravità costante. All'inizio l'oggetto sale velocemente, poi rallenta, si ferma al picco, poi accelera di nuovo nella discesa. Questo comportamento "non lineare ma regolare" è catturato dalla funzione quadratica.

In termini di tasso di cambiamento, se y = x², allora dy/dx = 2x. Il tasso di cambiamento è proporzionale a x: più sei lontano dall'origine, più velocemente la funzione cambia. Vicino all'origine, la funzione è quasi piatta. Lontano dall'origine, sale (o scende) ripidamente.

Le funzioni quadratiche appaiono ovunque in fisica: energia cinetica (½mv²), area di un cerchio (πr²), legge di gravitazione (distanza²). Nell'audio, le usiamo per modellare comportamenti che hanno accelerazione o decelerazione graduali, più "naturali" delle transizioni lineari.

---

## **Slide: Applicazioni audio quadratiche**

Le funzioni quadratiche nell'audio servono principalmente a creare transizioni "smooth" - morbide, naturali, con accelerazione o decelerazione graduale.

**Inviluppi naturali.** Quando ascolti un piatto colpito, l'attacco non è istantaneo né lineare. C'è un'accelerazione: il suono parte piano e accelera verso il picco. Questo può essere modellato con A(t) = k·t² durante la fase di attack. Il suono cresce lentamente all'inizio, poi sempre più rapidamente. Questo è più realistico di un attack lineare, che cresce a velocità costante.

Nel grafico confrontiamo un attack quadratico (blu) con uno lineare (rosso). Vedi come la curva quadratica parte più dolcemente, rimane sotto la lineare per un po', poi accelera e raggiunge il picco contemporaneamente. La "forma" della curva è diversa: dolce all'inizio, rapida alla fine.

**Velocity curves.** Nei controller MIDI e nei virtual instruments, spesso la relazione tra la velocity (quanto forte premi un tasto) e il volume effettivo non è lineare. Una curva quadratica - o esponenziale - può rendere la risposta più espressiva. Con una curva quadratica, i tocchi leggeri (velocity basse) hanno un range di dinamica più ampio - più controllo fine. I tocchi forti comprimono un po'. Questo simula il comportamento di molti strumenti acustici, dove la risposta non è perfettamente lineare.

**Distorsione soft-clip.** Quando vuoi "saturare" un segnale audio senza il clipping brutale (taglio netto), puoi usare una funzione quadratica (o cubica) per comprimere dolcemente i picchi. La funzione y = x - (x³/3) è un'approssimazione classica: vicino a zero, y ≈ x (quasi lineare, nessuna distorsione). Quando |x| si avvicina a 1, la cubica "piega" la curva, comprimendo i picchi senza tagliarli nettamente. Il risultato è una saturazione "calda", tipica dei dispositivi analogici.

**Fade smooth.** Un fade lineare suona spesso brusco, specialmente all'inizio o alla fine. Un fade quadratico - o con curva esponenziale - è più naturale. Per un fade-in: A(t) = (t/T)². All'inizio, il volume cresce lentamente (quasi impercettibile). Verso la fine, accelera. Il nostro orecchio percepisce questo come più naturale.

Le funzioni quadratiche, essendo il passo successivo oltre le lineari, offrono quel minimo di complessità in più per modellare fenomeni che hanno curvatura ma non sono ancora troppo complicati da calcolare o capire.

---

## **Slide: Funzione esponenziale: y = a·e^(bx)**

Ora entriamo in un territorio fondamentale per l'audio: la funzione esponenziale. Questa è probabilmente la funzione più importante in fisica e ingegneria dopo le trigonometriche, e nell'audio digitale è onnipresente.

La forma generale è y = a · e^(bx), dove e è il numero di Eulero, circa 2.718. Questo numero speciale ha proprietà matematiche uniche che lo rendono la "base naturale" per gli esponenziali.

La caratteristica chiave dell'esponenziale è che il tasso di cambiamento è proporzionale al valore attuale. In termini matematici: dy/dx = b·y. Cosa significa in pratica? Significa che più grande è y, più velocemente y cambia. Questo crea crescita (o decrescita) accelerata.

Se b > 0, hai crescita esponenziale: e^x. Parte lentamente, poi accelera sempre di più, fino a "esplodere" verso l'infinito. Questo modella fenomeni come crescita batterica, interesse composto, reazioni a catena.

Se b < 0, hai decadimento esponenziale: e^(-x). Parti da un valore massimo, poi decadi rapidamente all'inizio, poi sempre più lentamente, avvicinandoti asintoticamente a zero ma senza mai raggiungerlo veramente. Questo modella radioattività, raffreddamento, dissipazione di energia.

Nel grafico vedi entrambe: e^x (blu) cresce esponenzialmente, e^(-x) (rosso) decade esponenzialmente. Nota che entrambe passano per il punto (0, 1), perché e^0 = 1, indipendentemente dal segno dell'esponente.

Un concetto cruciale nell'esponenziale è la "costante di tempo" τ (tau). Nell'equazione y = e^(-t/τ), il parametro τ determina quanto velocemente decade. Dopo un tempo t = τ, il valore è sceso a e^(-1) ≈ 0.368, circa il 37% del valore iniziale. Dopo t = 2τ, è circa 13.5%. Dopo t = 3τ, è circa 5%. Dopo t = 5τ, è praticamente zero (meno dell'1%).

Nell'audio, τ è il "tempo di decadimento". Un piatto con τ = 2 secondi decade molto più lentamente di uno con τ = 0.5 secondi. Questo singolo parametro caratterizza completamente la velocità di dissipazione dell'energia.

---

## **Slide: Applicazioni audio esponenziali**

Le funzioni esponenziali sono fondamentali nell'audio perché moltissimi fenomeni fisici seguono dinamiche esponenziali.

**Decay naturale.** Quando una corda di chitarra vibra, l'ampiezza delle oscillazioni non decresce linearmente - decresce esponenzialmente. Perde energia per attrito, resistenza dell'aria, dissipazione interna. Il tasso di perdita è proporzionale all'energia residua: più energia c'è, più velocemente si perde. Risultato: A(t) = A₀ · e^(-t/τ).

Stesso discorso per tamburi, piatti, campane, qualsiasi sistema fisico che dissipa energia. Nel grafico vedi un decay esponenziale classico. L'ampiezza parte da 1, cala rapidamente all'inizio, poi sempre più lentamente, avvicinandosi asintoticamente a zero. La linea tratteggiata rossa evidenzia il punto τ = 1, dove l'ampiezza è scesa a circa 0.368 (e^(-1)).

**Percezione logaritmica.** L'orecchio umano percepisce il volume in modo logaritmico, non lineare. Questo significa che per percepire un raddoppio del "loudness", l'ampiezza del segnale deve crescere molto di più del doppio. La scala dei decibel riflette questa percezione: dB = 20 log₁₀(A), dove A è l'ampiezza. Il logaritmo è l'inverso dell'esponenziale - sono funzioni strettamente legate.

Per questo, quando fai un fade-out esponenziale invece che lineare, il suono percepito decresce più uniformemente. Un fade lineare suona come se il volume rimanesse alto a lungo e poi crollasse improvvisamente alla fine. Un fade esponenziale suona come un decay continuo e naturale.

**Release di envelope.** Nella maggior parte dei synth moderni, la fase di release (quando rilasci il tasto) usa un decay esponenziale invece che lineare. Questo perché simula il comportamento fisico: quando smetti di fornire energia (rilasci il tasto), il sistema dissipa l'energia residua esponenzialmente. È più realistico, più naturale all'orecchio.

**Filter resonance decay.** Quando ecciti un filtro risonante (come un filtro Moog con resonance alta) con un impulso, la risonanza non scompare istantaneamente - decade esponenzialmente. Il filtro è un sistema dinamico con dissipazione, e l'energia immagazzinata nella risonanza si dissipa con una costante di tempo che dipende dal Q del filtro.

L'esponenziale è la firma del comportamento "naturale" nel mondo fisico. Ecco perché è così centrale nell'audio: non stiamo solo applicando matematica arbitraria, stiamo modellando fenomeni fisici reali.

---

## **Slide: Funzione seno: y = A·sin(ωx + φ)**

Arriviamo ora alla funzione più importante di tutte per l'audio: il seno. Questa funzione, insieme al coseno, è il mattone fondamentale di qualsiasi segnale audio.

La forma generale è y = A · sin(ωx + φ). Scomponiamo i parametri, perché ognuno ha un significato fisico preciso.

**A = ampiezza.** Questo parametro controlla l'altezza dell'onda, quanto oscilla sopra e sotto lo zero. Se A = 1, l'onda va da -1 a +1. Se A = 0.5, va da -0.5 a +0.5. Nell'audio, A è il volume: ampiezza maggiore = suono più forte.

**ω = frequenza angolare.** Questo parametro controlla quanto velocemente l'onda oscilla. È legato alla frequenza f (in Hz) dalla relazione ω = 2πf. Se f = 440 Hz (La centrale), allora ω = 2π × 440 ≈ 2764 rad/s. Ogni secondo, l'argomento del seno avanza di 2764 radianti, completando 440 cicli completi (perché un ciclo completo è 2π radianti).

**φ = fase.** Questo parametro sposta l'onda orizzontalmente. Se φ = 0, l'onda parte da zero al tempo zero. Se φ = π/2, l'onda parte dal massimo (diventa un coseno). La fase è cruciale quando combini più onde - interferenza costruttiva o distruttiva dipende dalla differenza di fase.

La funzione seno è **periodica**: si ripete identicamente all'infinito. Il periodo - il tempo per un ciclo completo - è T = 2π/ω = 1/f. Se f = 440 Hz, il periodo è T = 1/440 ≈ 2.27 millisecondi. Ogni 2.27 ms, l'onda si ripete esattamente uguale.

Nel grafico vedi y = sin(x) con A = 1, ω = 1, φ = 0. L'asse X è in radianti. L'onda passa per zero a x = 0, raggiunge il massimo (1) a x = π/2, torna a zero a x = π, raggiunge il minimo (-1) a x = 3π/2, e completa il ciclo a x = 2π. I punti rossi evidenziano i picchi massimo e minimo.

La freccia rossa sotto mostra il periodo: da 0 a 2π, un ciclo completo. Dopo 2π, l'onda ricomincia identica.

La funzione seno è "liscia" - matematicamente, è infinitamente derivabile. Non ha spigoli, salti, discontinuità. Questo la rende ideale per rappresentare oscillazioni fisiche reali, che tendono a essere continue e smooth.

---

## **Slide: Il seno nell'audio**

Il seno non è solo una funzione matematica astratta - è **il** suono fondamentale in audio digitale.

**Tono puro (oscillatore).** Un'onda sinusoidale pura è il suono più semplice possibile: una singola frequenza, senza armoniche. La formula y(t) = A · sin(2πf₀t) genera un tono puro a frequenza f₀. Se f₀ = 440 Hz, stai generando il La centrale. Se f₀ = 880 Hz, il La un'ottava sopra. Se f₀ = 1000 Hz, un tono di test standard.

Nessuno strumento acustico produce toni puri perfetti - sempre ci sono armoniche, timbro, complessità. Ma nell'audio digitale, puoi generare seni perfetti matematicamente. Questi sono il punto di partenza per ogni sintesi.

**Building block della sintesi.** Teorema di Fourier: qualsiasi segnale periodico può essere scomposto in una somma (potenzialmente infinita) di onde sinusoidali a frequenze multiple. Questo è il fondamento della sintesi additiva: prendi tanti oscillatori sinusoidali a diverse frequenze e ampiezze, li sommi, e ottieni timbri complessi.

Per esempio, un'onda quadrata è approssimativamente: sin(x) + (1/3)sin(3x) + (1/5)sin(5x) + (1/7)sin(7x) + ... (somma delle armoniche dispari). Un'onda a dente di sega è: sin(x) - (1/2)sin(2x) + (1/3)sin(3x) - (1/4)sin(4x) + ... (somma di tutte le armoniche con segni alternati).

**LFO (Low Frequency Oscillator).** Un oscillatore a bassa frequenza (tipicamente 0.1-20 Hz, sotto la soglia udibile) che modula altri parametri invece di generare suono diretto. Un LFO sinusoidale a 5 Hz che modula il volume crea un tremolo smooth. Un LFO che modula la frequenza crea un vibrato. Un LFO che modula il pan crea un auto-pan oscillante. Il seno, essendo smooth e prevedibile, è perfetto per questi movimenti ciclici.

**Analisi spettrale.** La FFT (Fast Fourier Transform) scompone qualsiasi segnale audio in una somma di seni e coseni a diverse frequenze. Quando guardi un analizzatore di spettro, stai vedendo quanto "peso" ha ogni frequenza (quanto è grande l'ampiezza del seno a quella frequenza). Questo è il cuore dell'analisi audio digitale.

Nel grafico vedi un'onda a 440 Hz nel dominio del tempo. L'asse X è in millisecondi. Il periodo è evidenziato: circa 2.27 ms per ciclo. Questa onda, se riprodotta, suonerebbe come un tono puro, pulito, senza timbro - solo la frequenza fondamentale.

---

## **Slide: Funzione coseno: y = A·cos(ωx + φ)**

L'ultima funzione fondamentale che vediamo è il coseno. In realtà, il coseno è strettamente legato al seno - così strettamente che potresti considerarli la stessa funzione con una diversa "fase iniziale".

La relazione matematica è: cos(x) = sin(x + π/2). Il coseno è un seno spostato di 90 gradi (π/2 radianti) a sinistra. Oppure, equivalentemente: sin(x) = cos(x - π/2). Sono intercambiabili con uno shift di fase.

La differenza visiva è che il seno parte da zero quando x = 0, mentre il coseno parte dal massimo (1). Guarda il grafico: la curva rossa tratteggiata (coseno) è identica alla blu (seno) ma spostata orizzontalmente. L'area verde evidenziata mostra esattamente lo shift di π/2.

In termini di proprietà matematiche, seno e coseno sono identici: entrambi periodici con periodo 2π, entrambi oscillano tra -1 e +1, entrambi lisci e derivabili, entrambi hanno le stesse simmetrie (con differenze minori - il seno è dispari, il coseno è pari).

Nell'audio, seno e coseno vengono usati insieme, specialmente in contesti di analisi e sintesi. La FFT usa sia seni che coseni per rappresentare completamente un segnale. Questo perché un seno da solo non può catturare tutte le possibili fasi - serve anche il coseno per rappresentare componenti "in quadratura" (sfasate di 90 gradi).

Quando generi un oscillatore in un synth, stai generando un seno (o coseno - matematicamente equivalenti). Quando applichi una modulazione di fase, stai shiftando l'argomento del seno/coseno. Quando analizzi il contenuto spettrale di un suono, lo stai scomponendo in componenti seno e coseno.

La coppia seno-coseno è fondamentale perché forma una "base ortogonale" per lo spazio delle funzioni periodiche. Qualsiasi oscillazione può essere espressa come combinazione lineare di seni e coseni. Questo è il cuore della teoria di Fourier, che a sua volta è il cuore del DSP.

In pratica, quando lavori con audio, spesso non distingui esplicitamente tra seno e coseno - usi "oscillatori" o "componenti spettrali" e la fase viene gestita come parametro separato. Ma sotto il cofano, matematicamente, sono sempre seni e coseni che lavorano insieme per rappresentare qualsiasi forma d'onda immaginabile.

## **Slide: Continuo vs Discreto: il grande salto**

Arriviamo ora al concetto più fondamentale di tutto il DSP: la differenza tra continuo e discreto, e come passiamo dall'uno all'altro. Questo è il cuore della digitalizzazione del suono.

Il mondo reale - il mondo fisico - è continuo. Quando un'onda sonora si propaga nell'aria, la pressione varia in modo continuo nel tempo. Non ci sono "salti" - in ogni istante, anche infinitesimamente piccolo, la pressione ha un valore definito. Tra due istanti qualsiasi, per quanto vicini, esistono infiniti altri istanti. Tra due valori di pressione qualsiasi esistono infiniti altri valori possibili.

Questo è il mondo analogico: infiniti valori possibili, continuo senza interruzioni. Quando guardi una forma d'onda analogica (o la sua rappresentazione matematica), vedi una curva liscia che puoi tracciare con una matita senza mai staccarla dal foglio.

Il computer, invece, vive nel mondo discreto. Non può gestire "infinito" - può solo contare, memorizzare e manipolare sequenze finite di numeri. Il computer non può rappresentare una curva continua: può solo memorizzare punti specifici, valori numerici a intervalli definiti.

Questo è il grande salto che dobbiamo fare per portare l'audio nel dominio digitale: trasformare qualcosa di continuo (onde sonore reali) in qualcosa di discreto (sequenze di numeri). Il problema fondamentale è: come traduciamo infinito in finito senza perdere l'essenza dell'informazione?

Nel grafico vedi esattamente questa differenza. La curva blu è il segnale continuo - matematicamente, una funzione che esiste in ogni istante. I punti rossi sono il segnale discreto - campioni presi a intervalli regolari. Tra un punto rosso e il successivo, nel dominio discreto, non esiste nulla. Ci sono solo i punti.

La domanda cruciale: quanti punti servono? Se prendi troppo pochi punti, perdi informazione - la ricostruzione sarà imprecisa. Se prendi troppi punti, sperechi memoria e potenza di calcolo senza guadagnare qualità. La risposta a questa domanda è il teorema di Nyquist, che vedremo tra poco.

Il passaggio da continuo a discreto richiede due operazioni separate: campionamento (discretizzazione nel tempo) e quantizzazione (discretizzazione nell'ampiezza). Prima guardiamo il campionamento.

---

## **Slide: Il campionamento (sampling)**

Il campionamento è il processo di "fotografare" il segnale continuo a intervalli regolari nel tempo. Immagina di avere un'onda sonora che scorre continuamente, e tu scatti foto istantanee a intervalli precisi. Ogni foto cattura il valore dell'onda in quel preciso istante. L'insieme di tutte queste foto è il segnale campionato.

La frequenza di campionamento (sample rate), indicata con fs, è il numero di campioni presi al secondo, misurato in Hertz. Il CD audio usa 44100 Hz - significa 44100 campioni ogni secondo. L'audio professionale spesso usa 48000 Hz, 96000 Hz, o anche 192000 Hz per applicazioni specifiche.

Il periodo di campionamento Ts è l'intervallo di tempo tra due campioni consecutivi, e è l'inverso della frequenza: Ts = 1/fs. A 44.1 kHz, Ts ≈ 22.7 microsecondi. Ogni 22.7 millesimi di millisecondo, il sistema ADC (Analog-to-Digital Converter) misura l'ampiezza del segnale e la memorizza.

Nel grafico vedi un'onda sinusoidale a 440 Hz (il La centrale) rappresentata in blu molto chiaro - questo è il segnale analogico continuo. I punti rossi sono i campioni presi a 44.1 kHz. In 10 millisecondi di audio, a quella frequenza di campionamento, hai circa 441 campioni. Sembra tantissimo, ma nota che l'onda a 440 Hz completa circa 4.4 cicli in quei 10 ms, quindi hai circa 100 campioni per ciclo - più che sufficienti per rappresentare fedelmente l'onda.

La freccia verde sotto evidenzia il periodo di campionamento Ts - la distanza temporale tra due campioni consecutivi. È piccolissima, quasi impercettibile alla scala del grafico, ma è fondamentale: è la risoluzione temporale del sistema.

Più alto è il sample rate, più campioni prendi al secondo, più fedele è la rappresentazione del segnale originale. Ma c'è un trade-off: più campioni significano più dati da memorizzare (file più grandi), più banda necessaria per la trasmissione, più potenza di calcolo per processare in tempo reale. Per questo bisogna trovare il giusto equilibrio: abbastanza alto da catturare tutto il contenuto udibile, ma non così alto da sprecare risorse.

44.1 kHz è diventato lo standard per il CD perché, come vedremo, permette di rappresentare frequenze fino a circa 22 kHz, che copre completamente lo spettro udibile umano (20 Hz - 20 kHz) con un margine di sicurezza. 48 kHz è comune in video e produzione professionale per vari motivi tecnici e storici. 96 kHz e oltre è considerato "overkill" per l'ascolto umano, ma può avere benefici nel workflow di produzione (headroom per processing pesante, riduzione di artefatti da conversione, ecc.).

---

## **Slide: Teorema di Nyquist (semplificato)**

Il teorema di Nyquist-Shannon è uno dei risultati più importanti dell'intera teoria dell'informazione e del signal processing. Risponde alla domanda: quanto velocemente devo campionare per non perdere informazione?

La risposta è sorprendentemente semplice: per rappresentare fedelmente una frequenza f, devi campionarla **almeno 2 volte per ogni ciclo completo**. Matematicamente: fs ≥ 2·fmax, dove fmax è la massima frequenza presente nel segnale.

Questo significa che la massima frequenza che puoi rappresentare con un certo sample rate è fs/2. Questa si chiama **frequenza di Nyquist**. È il limite superiore assoluto: qualsiasi cosa sopra fs/2 non può essere rappresentata correttamente.

Esempi pratici. Con 44.1 kHz sample rate, la frequenza di Nyquist è 22.05 kHz. Puoi rappresentare fedelmente qualsiasi suono fino a 22 kHz. Lo spettro udibile umano arriva a circa 20 kHz (e per molti adulti si ferma ben prima), quindi 44.1 kHz copre tutto l'udibile con un margine. Con 48 kHz, la Nyquist è 24 kHz. Con 96 kHz, è 48 kHz - ben oltre l'udibile, il che è il motivo per cui molti considerano 96 kHz eccessivo per l'ascolto finale.

Nel grafico vedi il caso di campionamento "corretto" - sopra il limite di Nyquist. L'onda ha una certa frequenza, e il sample rate è abbastanza alto da catturare almeno 2 campioni per ciclo - in questo caso, molto di più: circa 8 campioni per ciclo. Con così tanti campioni, la ricostruzione dell'onda sarà quasi perfetta.

Perché proprio "2 volte per ciclo" e non di più o di meno? Il ragionamento intuitivo è questo: per identificare un'oscillazione, hai bisogno di sapere quando sale e quando scende. Se campioni solo una volta per ciclo, potresti sempre beccare il picco (e il segnale sembrerebbe costante), o sempre lo zero (e sembrerebbe silenzio). Con 2 campioni per ciclo - uno sulla salita, uno sulla discesa - catturi l'oscillazione. Matematicamente, la dimostrazione rigorosa del teorema di Nyquist è più complessa, ma l'intuizione è questa.

Sotto il limite di Nyquist, la ricostruzione perfetta è possibile in teoria (con filtri ideali). Sopra la Nyquist, è impossibile - si verifica aliasing.

---

## **Slide: Aliasing: quando campioniamo troppo lentamente**

L'aliasing è uno dei fenomeni più insidiosi nel DSP, e capirlo è cruciale per evitare problemi seri nell'audio digitale.

Cosa succede se campioniamo un segnale che contiene frequenze superiori a fs/2? La risposta è: quelle frequenze "alte" si mascherano come frequenze "basse". Il segnale ricostruito sarà completamente sbagliato - conterrà frequenze che non erano presenti nell'originale, e perderai le frequenze che c'erano. È una distorsione non lineare e non musicale.

L'esempio classico per visualizzare l'aliasing è la ruota di un carro nei film western. Hai presente quando la ruota sembra girare all'indietro o più lentamente di quanto dovrebbe? Questo succede perché la frequenza di rotazione della ruota è più alta della metà della frequenza di campionamento della telecamera (24 o 30 fps). Il movimento reale "si traveste" da movimento più lento o inverso.

Nel grafico vedi esattamente questo fenomeno in forma audio. La curva blu chiara è il segnale vero - un'onda a 5 Hz. I punti rossi sono i campioni, ma sono troppo pochi (solo 6 campioni per l'intero periodo mostrato). Se provi a ricostruire l'onda originale da questi punti, il miglior fit è la curva rossa tratteggiata - un'onda a 1 Hz! Completamente sbagliata. L'onda vera a 5 Hz ha creato un "alias" a 1 Hz.

Matematicamente, le frequenze sopra fs/2 "si ripiegano" (fold back) attorno alla Nyquist. Una frequenza a fs - f viene percepita come una frequenza a f. Una frequenza a fs + f viene percepita come f. E così via. Questo crea un pattern di ripiegamento che produce artefatti spettrali complessi e disarmonici.

In audio pratico, l'aliasing si manifesta come suoni metallici, artefatti digitali, componenti tonali che non c'erano nel segnale originale. È particolarmente problematico in processi non lineari come distorsione, dove il processing può generare armoniche alte che, se non controllate, creano aliasing.

La soluzione è il filtro anti-aliasing. Prima di campionare un segnale analogico, lo si fa passare attraverso un filtro passa-basso (low-pass filter) che taglia drasticamente tutte le frequenze sopra fs/2. Questo garantisce che nessuna frequenza problematica entri nel sistema digitale. Tutti i convertitori ADC di qualità hanno filtri anti-aliasing integrati.

È importante capire che l'aliasing è **irreversibile**. Una volta che il segnale è stato campionato in modo scorretto e l'aliasing si è verificato, non puoi "de-aliasare" - l'informazione originale è persa. Per questo la prevenzione (filtri anti-aliasing) è essenziale.

---

## **Slide: Quantizzazione: da infinito a finito**

Finora abbiamo parlato solo di discretizzazione nel tempo - il campionamento. Ma c'è una seconda discretizzazione necessaria: la quantizzazione dell'ampiezza.

Nel mondo analogico, l'ampiezza può assumere qualsiasi valore - esiste un continuum infinito di ampiezze possibili. Ma il computer può memorizzare solo numeri finiti, rappresentati con un numero finito di bit. La quantizzazione è il processo di arrotondare ogni campione al livello discreto più vicino tra quelli disponibili.

Il numero di livelli disponibili dipende dalla **bit depth** (profondità di bit). Con N bit, hai 2^N livelli possibili.

- 8 bit = 2^8 = 256 livelli. Sufficiente per telefonia, ma audio di bassa qualità.
- 16 bit = 2^16 = 65536 livelli. Standard CD - qualità molto buona.
- 24 bit = 2^24 = 16.777.216 livelli. Standard professionale - qualità eccellente.
- 32 bit float = circa 4 miliardi di valori discreti, ma soprattutto enorme range dinamico.

Nel grafico vedi un'onda sinusoidale continua (blu chiaro) e la stessa onda quantizzata con solo 4 bit, quindi 16 livelli (rosso). Le linee orizzontali rosse chiare sono i livelli di quantizzazione disponibili. Ogni campione viene "arrotondato" al livello più vicino, creando la caratteristica forma a "gradini".

Nota come la curva quantizzata approssima quella continua, ma con errore. La differenza tra il valore vero e il valore quantizzato è il **quantization error**. Questo errore introduce rumore nel segnale - il "quantization noise". Con pochi bit, come nell'esempio (4 bit), il rumore è molto udibile - si sente come un rumore di fondo granuloso. Con 16 bit, il rumore è circa -96 dB sotto il segnale massimo - praticamente impercettibile nella maggior parte dei contesti. Con 24 bit, è -144 dB - completamente inudibile.

Il range dinamico - il rapporto tra il segnale più forte e il rumore di quantizzazione più debole - è approssimativamente 6 dB per bit. 16 bit = 96 dB, 24 bit = 144 dB. Per confronto, il range dinamico dell'orecchio umano in condizioni ideali è circa 120 dB, ma in contesti pratici di ascolto musicale, 96 dB (16 bit) sono più che sufficienti.

La quantizzazione, come l'aliasing, introduce una distorsione non lineare. A differenza dell'aliasing, però, con abbastanza bit (16 o più), il quantization noise diventa così basso da essere trascurabile per l'ascolto finale. Per questo il CD audio a 16 bit/44.1 kHz è considerato "transparent" - la differenza rispetto al segnale analogico originale è sotto la soglia di percezione umana.

---

## **Slide: Il cerchio si chiude: funzione digitale**

Finalmente il cerchio si chiude: dopo campionamento e quantizzazione, l'audio digitale è una sequenza di numeri interi. Tutto quello che abbiamo visto sulle funzioni matematiche trova la sua applicazione finale qui.

Una forma d'onda digitale non è più una funzione continua A(t). È un array discreto A[n], dove n è l'indice del campione (0, 1, 2, 3, ...) e A[n] è il valore quantizzato dell'ampiezza in quel campione. Il tempo corrispondente è tn = n · Ts.

Per esempio, con 16 bit e 44.1 kHz, un secondo di audio mono è un array di 44100 numeri interi, ognuno compreso tra -32768 e +32767 (il range di un intero a 16 bit con segno). Questi numeri rappresentano campioni dell'ampiezza dell'onda sonora, presi ogni 22.7 microsecondi.

Nel riquadro vedi un esempio di array: [0, 12453, 23421, 28934, 23421, 12453, 0, -12453, -23421, ...]. Questa sequenza potrebbe rappresentare un'onda sinusoidale quantizzata. Il primo valore (0) è il campione a t = 0. Il secondo (12453) è il campione a t = Ts. Il terzo (23421) è a t = 2Ts. E così via.

Nel grafico vedi la rappresentazione visiva: un "stem plot" - punti discreti con linee verticali. Non c'è nulla tra i punti. Nel dominio digitale, concettualmente, il segnale esiste solo agli istanti tn. Quando lo riproduci (conversione DAC - Digital-to-Analog), il convertitore ricostruisce un'onda continua interpolando questi punti (in realtà, usando filtri di ricostruzione), ma nel dominio digitale, sono solo punti.

Processare audio digitale significa applicare operazioni matematiche a questi array di numeri. Un filtro digitale? Una combinazione di moltiplicazioni, addizioni, e ritardi (shift dell'array). Un delay? Copiare l'array e sfasarlo di N campioni. Un riverbero? Convoluzione - somma pesata di versioni ritardate del segnale. Compressione dinamica? Analizzare l'ampiezza, calcolare un gain reduction, moltiplicare.

Tutto quello che abbiamo visto - funzioni lineari, quadratiche, esponenziali, seno, coseno - viene applicato a questi numeri. L'inviluppo esponenziale? Moltiplica ogni campione per e^(-n/τ). L'oscillatore sinusoidale? Calcola A[n] = A · sin(2πf·n·Ts) per ogni n. Il fade lineare? Moltiplica A[n] per (n/N).

Il DSP è matematica applicata a sequenze di numeri. Quando capisci che l'audio digitale è solo una lunga lista di valori numerici, e che ogni processo è una funzione matematica applicata a quei numeri, tutto il DSP diventa chiaro e logico. Non è magia - è matematica. E ora hai gli strumenti per capire quella matematica.

## **Slide: Ricapitolo: dalla fisica alla matematica**

Siamo arrivati alla fine di questo viaggio attraverso la matematica fondamentale per il DSP. Ricapitoliamo brevemente il percorso che abbiamo fatto, perché ogni concetto che abbiamo visto costruisce sul precedente, formando un'architettura logica completa.

Abbiamo iniziato con il concetto di **funzione** - l'idea fondamentale che una funzione è come una macchina trasformatrice: metti qualcosa dentro (input), applichi una regola precisa, ottieni qualcosa fuori (output). Abbiamo capito che ogni funzione ha un dominio (cosa può entrare) e un codominio (cosa può uscire), e che questa relazione input-output è deterministica - stesso input produce sempre stesso output.

Poi abbiamo introdotto il **piano cartesiano** - lo strumento per visualizzare le funzioni. Due assi perpendicolari, coordinate (x, y), la possibilità di rappresentare relazioni astratte come curve concrete che puoi vedere. Abbiamo capito come leggere un grafico, come ogni punto racconta una storia ("quando x vale questo, y vale quello"), e come questo si collega direttamente all'audio - una forma d'onda è semplicemente un grafico con tempo sull'asse X e ampiezza sull'asse Y.

Poi abbiamo esplorato i **tipi fondamentali di funzioni**, ognuna con caratteristiche e applicazioni specifiche nell'audio:

- **Funzione costante** (y = k): nessun cambiamento, output sempre uguale. Nell'audio: DC offset, sustain di organo.

- **Funzione lineare** (y = mx + q): cambiamento a velocità costante. Nell'audio: fade lineari, glissando, pan.

- **Funzione quadratica** (y = ax²): accelerazione, curvatura. Nell'audio: inviluppi naturali, velocity curves, fade smooth.

- **Funzione esponenziale** (y = a·e^(bx)): crescita o decadimento dove il tasso dipende dal valore attuale. Nell'audio: decay naturale di corde e piatti, envelope release, percezione logaritmica del volume.

- **Funzioni trigonometriche** (seno e coseno): oscillazioni perfette, periodiche. Nell'audio: oscillatori, toni puri, building block di ogni suono (teorema di Fourier), LFO, analisi spettrale.

Ogni funzione che abbiamo visto non è solo matematica astratta - è uno strumento pratico per descrivere, capire e manipolare il suono. Quando applichi un inviluppo ADSR, stai usando funzioni a tratti. Quando fai un fade out esponenziale, stai moltiplicando il segnale per e^(-t/τ). Quando generi un tono con un synth, stai calcolando sin(2πft) campione per campione.

Il diagramma che vedi mostra questa progressione logica: dalle funzioni come concetto astratto, al piano cartesiano per visualizzarle, ai tipi specifici di funzioni, alle loro applicazioni audio, fino al DSP digitale dove tutto si concretizza in algoritmi. Ogni livello costruisce sul precedente. Non puoi saltare passi - devi capire cosa sono le funzioni prima di capire i grafici, devi capire i tipi di funzioni prima di capire come applicarle all'audio, devi capire il continuo prima di capire il discreto.

---

## **Slide: Dal mondo analogico al digitale**

Il viaggio finale - il più importante per il DSP - è capire come passiamo dal mondo analogico continuo al mondo digitale discreto.

Il mondo reale, il mondo fisico, è analogico. Le onde sonore sono variazioni continue di pressione. Esistono in ogni istante, possono assumere infiniti valori. Quando una corda di chitarra vibra, l'oscillazione è continua e smooth - matematicamente, una funzione continua del tempo. Questo è il dominio dell'audio analogico: microfoni che traducono pressione in voltaggio, amplificatori che processano segnali elettrici continui, altoparlanti che convertono voltaggio in movimento dell'aria.

Ma il computer non può lavorare con continuo. Può solo contare, memorizzare numeri, eseguire operazioni aritmetiche su dati discreti. Per portare l'audio nel dominio digitale, dobbiamo fare due trasformazioni fondamentali:

**Campionamento**: discretizzazione nel tempo. Invece di avere un segnale che esiste in ogni istante, prendiamo "foto" del segnale a intervalli regolari. Con 44.1 kHz, prendiamo 44100 foto al secondo. Il teorema di Nyquist ci dice che se il segnale non contiene frequenze sopra fs/2, queste foto contengono tutta l'informazione - possiamo ricostruire perfettamente il segnale continuo dai punti discreti.

**Quantizzazione**: discretizzazione nell'ampiezza. Invece di infiniti valori possibili, arrotondiamo ogni campione a uno di un numero finito di livelli. Con 16 bit, abbiamo 65536 livelli. Con abbastanza bit, l'errore di quantizzazione diventa trascurabile - sotto la soglia di percezione.

Il risultato finale? Una sequenza di numeri interi. Un array. Nel grafico in alto vedi la transizione visivamente: l'onda blu continua diventa punti rossi discreti. Nel flow diagram sotto vedi il processo completo:

1. **Suono fisico** - onde nell'aria, fenomeno continuo
2. **Funzione matematica** - descriviamo il suono come A(t), pressione in funzione del tempo
3. **Array di numeri** - campioniamo e quantizziamo, otteniamo A[0], A[1], A[2], ...
4. **Algoritmi DSP** - processiamo l'array con operazioni matematiche

La matematica è il ponte, il linguaggio che permette questa traduzione. Il computer "pensa" in numeri, quindi dobbiamo tradurre il suono in numeri. Ma non numeri casuali - numeri che preservano l'informazione, che possono essere riconvertiti in suono udibile senza perdite percettibili.

Ogni algoritmo DSP che userai - filtri, riverberi, compressori, pitch shifters, time stretchers, analizzatori spettrali - è una funzione matematica applicata a questi array di numeri. Quando capisci la matematica, capisci cosa sta realmente facendo l'algoritmo, non solo "quale knob giri per ottenere quale effetto".

Comprendere è potere. Comprendere la matematica del DSP ti dà il potere di:
- Capire perché un filtro suona in un certo modo
- Predire l'effetto di un processo prima di applicarlo
- Debuggare quando qualcosa non suona come dovrebbe
- Creare i tuoi strumenti e effetti invece di limitarti a usare quelli esistenti
- Innovare, sperimentare, esplorare territori sonori nuovi

La matematica non è un ostacolo alla creatività - è un amplificatore di creatività. Ti libera dai limiti dell'intuizione cieca e ti dà controllo preciso sul tuo materiale sonoro. I più grandi innovatori della musica elettronica - da Mathews a Chowning, da Moog a Roads - erano tutti profondamente versati nella matematica. Non perché la matematica fosse fine a se stessa, ma perché era lo strumento per realizzare visioni sonore impossibili altrimenti.

Ora hai le basi. Sai cos'è una funzione. Sai visualizzare relazioni sul piano cartesiano. Conosci le funzioni fondamentali e le loro applicazioni audio. Capisci come passiamo da analogico a digitale. Questo è il fondamento su cui costruirai tutta la tua comprensione del DSP. Da qui, puoi esplorare filtri digitali, trasformate di Fourier, convoluzione, sintesi avanzata - ogni concetto farà riferimento a queste basi che abbiamo posto oggi.

Il suono è matematica. La matematica è il linguaggio del suono digitale. E ora parli quel linguaggio.
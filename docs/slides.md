---
title: "La Matematica del Suono Digitale"
subtitle: "Dalle Funzioni al Campionamento: i Fondamenti del DSP"
institute: MEduLab
date: \today
theme: default
colortheme: default
aspectratio: 169
navigation: empty
section-titles: true
mainfont: "Fira Sans"
sansfont: "Fira Sans"
fontsize: 10pt
lang: it
header-includes:
  - \usepackage{tikz}
  - \usepackage{pgfplots}
  - \pgfplotsset{compat=newest}
---

# **INTRODUZIONE**

## Perché la matematica per il DSP?

:::::::::::::: {.columns}
::: {.column width="55%"}
- Il suono è un **fenomeno fisico**
- La fisica si descrive con la **matematica**
- Non possiamo manipolare ciò che non sappiamo descrivere
- Dai filtri alla sintesi: tutto parte da **funzioni matematiche**

**Il ponte essenziale:**

- Comprendere = controllare
- Matematica = linguaggio del DSP
:::
::: {.column width="50%"}
\begin{tikzpicture}
  % Box per Suono Fisico
  \node[draw, rectangle, minimum width=3cm, minimum height=1cm, fill=blue!20] (sound) at (0,3) {Suono Fisico};
  
  % Box per Matematica
  \node[draw, rectangle, minimum width=3cm, minimum height=1cm, fill=green!20] (math) at (0,1.5) {Matematica};
  
  % Box per DSP
  \node[draw, rectangle, minimum width=3cm, minimum height=1cm, fill=red!20] (dsp) at (0,0) {DSP/Controllo};
  
  % Frecce
  \draw[->, very thick] (math) -- (sound) node[midway, right] {descrive};
  \draw[->, very thick] (math) -- (dsp) node[midway, right] {permette};
\end{tikzpicture}
:::
::::::::::::::

## Il suono come fenomeno matematico

:::::::::::::: {.columns}
::: {.column width="45%"}
**Onde sonore = funzioni:**

- Variazione di pressione nel tempo
- $P(t)$ = pressione in funzione del tempo

**Ogni trasformazione audio:**

- Filtro = funzione matematica
- Riverbero = convoluzione
- Compressore = funzione non lineare
- Delay = funzione con shift temporale

**Obiettivo:** capire le funzioni base
:::
::: {.column width="55%"}
\begin{tikzpicture}
\begin{axis}[
    width=7cm,
    height=6cm,
    axis lines=middle,
    xlabel={Tempo (s)},
    ylabel={Ampiezza},
    xmin=0, xmax=0.012,
    ymin=-1.6, ymax=1.6,
    xtick={0,0.005,0.01},
    xticklabels={0,0.005,0.01},
    ytick={-1,0,1},
    samples=200,
    smooth,
    grid=major,
    grid style={dashed,gray!30}
]
\addplot[blue, thick, domain=0:0.01] {sin(deg(2*pi*200*x))};
\end{axis}
\end{tikzpicture}

\vspace{0.3cm}
Onda sinusoidale 440 Hz (La)
:::
::::::::::::::

# **COS'È UNA FUNZIONE**

## La funzione come "macchina trasformatrice"

:::::::::::::: {.columns}
::: {.column width="55%"}
**Una funzione è come una macchina:**

- Metti qualcosa dentro (INPUT)
- La macchina elabora secondo una regola
- Esce qualcosa fuori (OUTPUT)

**Caratteristiche fondamentali:**

- Regola precisa e ripetibile
- Stesso input → sempre stesso output
- NON è casuale, è deterministica

**Esempi concreti:**

- Vending machine: soldi → snack
- Pedale effetto: suono pulito → suono distorto
- Inviluppo: tempo → ampiezza
:::
::: {.column width="45%"}
\begin{tikzpicture}[scale=0.9]
  % La "macchina" funzione
  \node[draw, rectangle, rounded corners, minimum width=2.5cm, minimum height=2cm, fill=yellow!30, very thick] (func) at (0,0.5) {\Large \textbf{f}};
  
  % Input
  \draw[<-, very thick, blue] (-1.375,0.5) -- (-2.5,0.5) node[midway, above] {\footnotesize input};
  \node[blue] at (-3,0.5) {\textbf{x}};
  
  % Output
  \draw[->, very thick, red] (1.375,0.5) -- (2.5,0.5) node[midway, above] {\footnotesize output};
  \node[red] at (3,0.5) {\textbf{y}};
  
  % Regola interna
  \node[align=center, font=\footnotesize] at (0,-0.3) {REGOLA FISSA};
  
  % Esempio sotto
  \node[align=center, font=\footnotesize, text width=4cm] at (0,-2.5) {Esempio:\\$x = 2 \rightarrow y = 4$\\$x = 5 \rightarrow y = 25$\\(regola: $y = x^2$)};
\end{tikzpicture}
:::
::::::::::::::

## Dominio e codominio: i limiti della macchina

:::::::::::::: {.columns}
::: {.column width="55%"}
**DOMINIO** = cosa può entrare:

- Insieme di tutti i valori di input possibili
- "Quali x posso usare?"

**CODOMINIO** = cosa può uscire:

- Insieme di tutti i valori di output possibili
- "Quali y posso ottenere?"

**Esempio audio pratico:**

- **Dominio**: tempo [0, 10] secondi
- **Codominio**: ampiezza [-1, +1]
- Funzione: forma d'onda in quei 10 secondi
:::
::: {.column width="45%"}
\begin{tikzpicture}[scale=0.85]
  % Dominio (insieme di input)
  \draw[blue, very thick] (-0.5,3) ellipse (1cm and 1.5cm);
  \node[blue, font=\small] at (-0.5,5) {\textbf{DOMINIO}};
  \node[blue, font=\small] at (-0.5,4) {(input)};
  \node at (-0.5,3.5) {$x_1$};
  \node at (-0.5,3) {$x_2$};
  \node at (-0.5,2.5) {$x_3$};
  \node at (-0.5,2) {$...$};
  
  % Codominio (insieme di output)
  \draw[red, very thick] (3.5,3) ellipse (1cm and 1.5cm);
  \node[red, font=\small] at (3.5,5) {\textbf{CODOMINIO}};
  \node[red, font=\small] at (3.5,4) {(output)};
  \node at (3.5,3.5) {$y_1$};
  \node at (3.5,3) {$y_2$};
  \node at (3.5,2.5) {$y_3$};
  \node at (3.5,2) {$...$};
  
  % Frecce che collegano
  \draw[->, thick] (0.1,3.5) -- (2.9,3.5);
  \draw[->, thick] (0.1,3) -- (2.9,3);
  \draw[->, thick] (0.1,2.5) -- (2.9,2.5);
  
  % Label funzione
  \node[fill=yellow!30, rounded corners] at (1.5,1) {\textbf{funzione f}};
\end{tikzpicture}
:::
::::::::::::::

## Notazione matematica (semplificata)

:::::::::::::: {.columns}
::: {.column width="55%"}
**Come scriviamo una funzione:**
$y = f(x)$ oppure $f(x) = y$ **Si legge:** "y uguale f di x"



**Significa:**

- $x$ = valore in ingresso
- $f$ = nome della funzione (la regola)
- $y$ = valore in uscita

**Esempi:**

- $f(x) = 2x$ → "f di x uguale due per x"
- $g(t) = \sin(t)$ → "g di t uguale seno di t"
- $A(t)$ → "A in funzione di t"
:::
::: {.column width="45%"}
\begin{tikzpicture}[scale=0.9]
  % Scrittura matematica evidenziata
  \node[font=\Large] at (0,3) {$y = f(x)$};
  
  % Annotazioni
  \draw[blue, thick, ->] (-0.7,1.5) -- (-0.7,2.2);
  \node[blue, font=\small, align=center] at (-1.5,1) {OUTPUT\\(risultato)};
  
  \draw[orange, thick, ->] (0,1.3) -- (0,2.5);
  \node[orange, font=\small, align=center] at (0,0.5) {FUNZIONE\\(regola)};
  
  \draw[red, thick, ->] (0.8,1.5) -- (0.8,2.2);
  \node[red, font=\small, align=center] at (1.5,1) {INPUT\\(dato)};
  
  % Esempio concreto
  \node[fill=gray!20, rounded corners, align=center, text width=4cm, font=\small] at (0,-1) {
    Esempio audio:\\[0.2cm]
    $A(t) = 0.5$\\[0.1cm]
    "L'ampiezza al tempo t\\è sempre 0.5"
  };
\end{tikzpicture}
:::
::::::::::::::

## Funzioni nell'audio: esempi concreti

:::::::::::::: {.columns}
::: {.column width="55%"}
**1. Inviluppo ADSR**

- Dominio: tempo $t$ (secondi)
- Codominio: ampiezza [0, 1]
- $A(t)$ = quanto forte suona in ogni istante

**2. Risposta di un filtro**

- Dominio: frequenza $f$ (Hz)
- Codominio: guadagno [0, 1] o dB
- $G(f)$ = quanto passa ogni frequenza

**3. Oscillatore**

- Dominio: tempo $t$
- Codominio: posizione [-1, +1]
- $y(t) = \sin(2\pi f_0 t)$
:::
::: {.column width="45%"}
\begin{tikzpicture}
\begin{axis}[
    width=5cm,
    height=3.5cm,
    axis lines=middle,
    xlabel={Tempo},
    ylabel={Ampiezza},
    xmin=0, xmax=5,
    ymin=0, ymax=1.2,
    xtick={0.5,1.5,3,4.5},
    xticklabels={A,D,S,R},
    ytick={0,0.7,1},
    yticklabels={0,Sus,Max},
    samples=200,
    smooth,
    title={\small Inviluppo ADSR}
]
% Attack
\addplot[blue, thick, domain=0:0.5] {2*x};
% Decay
\addplot[blue, thick, domain=0.5:1.5] {1 - 0.3*(x-0.5)};
% Sustain
\addplot[blue, thick, domain=1.5:3] {0.7};
% Release
\addplot[blue, thick, domain=3:4.5] {0.7 - 0.7*(x-3)/1.5};

% Annotazioni
\draw[dashed, gray] (axis cs:0.5,0) -- (axis cs:0.5,1);
\draw[dashed, gray] (axis cs:1.5,0) -- (axis cs:1.5,0.7);
\draw[dashed, gray] (axis cs:3,0) -- (axis cs:3,0.7);
\end{axis}
\end{tikzpicture}

\vspace{0.2cm}
{\footnotesize $A(t)$ cambia nel tempo\\secondo una regola precisa}
:::
::::::::::::::

# **IL PIANO CARTESIANO**

## Introduzione al piano cartesiano

:::::::::::::: {.columns}
::: {.column width="55%"}
**Cos'è il piano cartesiano?**

- Due linee perpendicolari: orizzontale e verticale
- Asse orizzontale = **asse X** (ascisse)
- Asse verticale = **asse Y** (ordinate)
- Il punto di incrocio = **origine** (0, 0)

**A cosa serve?**

- Visualizzare relazioni tra due grandezze
- Trasformare numeri in immagini
- Vedere "a colpo d'occhio" come cambiano le cose

**Inventore:** René Descartes (1637)

- "Cartesiano" viene dal suo nome latino: *Cartesius*
:::
::: {.column width="45%"}
\begin{tikzpicture}[scale=1.3]
\begin{axis}[
    width=5.5cm,
    height=5.5cm,
    axis lines=middle,
    xlabel={$x$},
    ylabel={$y$},
    xmin=-3, xmax=3,
    ymin=-3, ymax=3,
    xtick={-2,-1,0,1,2},
    ytick={-2,-1,0,1,2},
    grid=major,
    grid style={dashed,gray!30},
    tick label style={font=\tiny},
    xlabel style={below right},
    ylabel style={above left},
    every axis x label/.style={at={(ticklabel* cs:1.05)}, anchor=west},
    every axis y label/.style={at={(ticklabel* cs:1.05)}, anchor=south}
]

% Evidenzia l'origine
\node[circle, fill=red, inner sep=2pt, label=above right:{\small Origine (0,0)}] at (axis cs:0,0) {};

% Quadranti
\node[gray, font=\footnotesize] at (axis cs:1.5,1.5) {I};
\node[gray, font=\footnotesize] at (axis cs:-1.5,1.5) {II};
\node[gray, font=\footnotesize] at (axis cs:-1.5,-1.5) {III};
\node[gray, font=\footnotesize] at (axis cs:1.5,-1.5) {IV};

\end{axis}
\end{tikzpicture}
:::
::::::::::::::

## Come si legge un grafico

:::::::::::::: {.columns}
::: {.column width="55%"}
**Ogni punto ha coordinate (x, y)**

- Prima coordinata = posizione orizzontale
- Seconda coordinata = posizione verticale

**Come trovare un punto:**

1. Parti dall'origine (0, 0)
2. Spostati lungo X (destra se +, sinistra se -)
3. Spostati lungo Y (su se +, giù se -)

**Esempi:**

- (2, 3) = 2 a destra, 3 in su
- (-1, 2) = 1 a sinistra, 2 in su
- (1, -2) = 1 a destra, 2 in giù
- (0, 0) = origine

**Importante:** l'ordine conta!
- (2, 3) ≠ (3, 2)
:::
::: {.column width="45%"}
\begin{tikzpicture}[scale=1.3]
\begin{axis}[
    width=5.5cm,
    height=5.5cm,
    axis lines=middle,
    xlabel={$x$},
    ylabel={$y$},
    xmin=-3, xmax=3.3,
    ymin=-3, ymax=3.3,
    xtick={-2,-1,0,1,2},
    ytick={-2,-1,0,1,2},
    grid=major,
    grid style={dashed,gray!30},
    tick label style={font=\tiny} 
]

% Punto A (2, 3)
\node[circle, fill=blue, inner sep=2pt, label=above right:{\footnotesize A(2,3)}] at (axis cs:2,3) {};
\draw[blue, dashed, thick] (axis cs:0,0) -- (axis cs:2,0) node[midway, above] {\tiny +2};
\draw[blue, dashed, thick] (axis cs:2,0) -- (axis cs:2,3) node[midway, right] {\tiny +3};

% Punto B (-1, 2)
\node[circle, fill=red, inner sep=2pt, label=above left:{\footnotesize B(-1,2)}] at (axis cs:-1,2) {};

% Punto C (1, -2)
\node[circle, fill=green!60!black, inner sep=2pt, label=below right:{\footnotesize C(1,-2)}] at (axis cs:1,-2) {};

% Origine
\node[circle, fill=black, inner sep=1.5pt] at (axis cs:0,0) {};

\end{axis}
\end{tikzpicture}
:::
::::::::::::::

## Dal grafico alla funzione

:::::::::::::: {.columns}
::: {.column width="55%"}
**La curva rappresenta la funzione**

- Ogni punto sulla curva è (x, f(x))
- X = input della funzione
- Y = output della funzione

**Regola fondamentale:**

- Per ogni valore di X c'è **UN SOLO** valore di Y
- Questo è ciò che rende qualcosa una funzione

**Test visivo (vertical line test):**

- Traccia una linea verticale
- Se tocca la curva in più di un punto → NON è funzione
- Se tocca sempre un solo punto → È funzione
:::
::: {.column width="45%"}
\begin{tikzpicture}[scale=1]
\begin{axis}[
    width=6.5cm,
    height=6cm,
    axis lines=middle,
    xlabel={$x$},
    ylabel={$y = f(x)$},
    xmin=-0.5, xmax=4,
    ymin=-0.5, ymax=3,
    xtick={0,1,2,3},
    ytick={0,1,2},
    grid=major,
    grid style={dashed,gray!30},
    tick label style={font=\tiny},
    samples=100
]

% Funzione quadratica
\addplot[blue, thick, domain=0:3.5] {0.3*x^2};

% Punti esempio
\node[circle, fill=red, inner sep=2pt] at (axis cs:1,0.3) {};
\node[circle, fill=red, inner sep=2pt] at (axis cs:2,1.2) {};
\node[circle, fill=red, inner sep=2pt] at (axis cs:3,2.7) {};

% Linea verticale per il test
\draw[orange, very thick, dashed] (axis cs:2,-0.3) -- (axis cs:2,3);
\node[orange, font=\tiny] at (axis cs:2.5,2.5) {tocca 1 volta};

% Annotazione
\node[blue, font=\small] at (axis cs:2.5,0.5) {$y = f(x)$};

\end{axis}
\end{tikzpicture}

\vspace{0.2cm}
La curva passa il "vertical line test"

:::
::::::::::::::

## Esempio audio: forma d'onda

:::::::::::::: {.columns}
::: {.column width="55%"}
**Grafico di una forma d'onda:**

- **Asse X** = tempo (secondi, millisecondi)
- **Asse Y** = ampiezza (pressione sonora)
- **Curva** = come varia il suono nel tempo

**Cosa vedi in un DAW:**

- Questo è esattamente un piano cartesiano!
- Timeline orizzontale = asse X
- Livello del segnale = asse Y
- Waveform = grafico della funzione A(t)

**Leggere la forma d'onda:**

- Dove la curva è a 0 = silenzio
- Picchi alti = suono forte
- Oscillazioni rapide = frequenza alta
:::
::: {.column width="45%"}
\begin{tikzpicture}[scale=1]
\begin{axis}[
    width=5.5cm,
    height=4cm,
    axis lines=middle,
    xlabel={Tempo (s)},
    ylabel={Ampiezza},
    xmin=0, xmax=0.02,
    ymin=-1.5, ymax=1.5,
    xtick={0,0.005,0.01,0.015,0.02},
    xticklabels={0,5,10,15,20},
    ytick={-1,0,1},
    samples=300,
    smooth,
    grid=major,
    grid style={dashed,gray!30},
    xlabel style={font=\small, right},
    ylabel style={font=\small, above},
    tick label style={font=\footnotesize}
]

% Onda sinusoidale 440 Hz
\addplot[blue, thick, domain=0:0.02] {sin(deg(2*pi*440*x))};

% Evidenzia alcuni punti chiave
\node[circle, fill=red, inner sep=1pt] at (axis cs:0,0) {};
\node[circle, fill=red, inner sep=1pt] at (axis cs:0.00227,0) {};

% Annotazione
\draw[dashed, red, thin] (axis cs:0.00227,1.2) -- (axis cs:0.00227,0);

\draw[<->, red, thin] (axis cs:0,1.2) -- (axis cs:0.00227,1.2);
\node[right, font=\tiny, text=black] at (axis cs:0.00227,1.2) {periodo = 1/440 s};
\end{axis}
\end{tikzpicture}

\vspace{0.2cm}
Onda 440 Hz vista in un DAW\\(millisecondi sull'asse X)
:::
::::::::::::::

# **FUNZIONI FONDAMENTALI**

## Funzione costante: y = k

:::::::::::::: {.columns}
::: {.column width="55%"}
**La funzione più semplice:**

$$y = k$$

dove $k$ è un numero fisso (costante)

**Caratteristiche:**
- Output sempre uguale, qualunque sia l'input
- Grafico = linea orizzontale
- Pendenza = 0 (non sale né scende)

**Esempi matematici:**
- $y = 5$ → sempre 5
- $y = 0$ → sempre zero
- $y = -2$ → sempre -2

**Non dipende da x!**
:::
::: {.column width="45%"}
\begin{tikzpicture}
\begin{axis}[
    width=6.5cm,
    height=5.5cm,
    axis lines=middle,
    xlabel={$x$},
    ylabel={$y$},
    xmin=-3, xmax=4,
    ymin=-1, ymax=3,
    xtick={-2,0,2},
    ytick={0,1,2},
    grid=major,
    grid style={dashed,gray!30},
    tick label style={font=\tiny},
    yticklabel style={yshift=1ex},
    samples=2
]

% Tre funzioni costanti
\addplot[blue, very thick, domain=-3:3] {2};
\addplot[red, very thick, domain=-3:3] {1};
\addplot[green!60!black, very thick, domain=-3:3] {0.5};

% Labels
\node[blue] at (axis cs:2.5,2.2) {$y=2$};
\node[red] at (axis cs:2.5,1.2) {$y=1$};
\node[green!60!black] at (axis cs:2.5,0.7) {$y=0.5$};

\end{axis}
\end{tikzpicture}

\vspace{0.3cm}
{\footnotesize \textbf{Audio:} DC offset, sustain organo}
:::
::::::::::::::

## Funzione lineare: y = mx + q

:::::::::::::: {.columns}
::: {.column width="55%"}
**Forma generale:** $y = mx + q$

**Parametri:**

- $m$ = pendenza (slope)
  - $m > 0$ → sale
  - $m < 0$ → scende
  - $m = 0$ → costante
- $q$ = intercetta (dove tocca l'asse Y)

**Proprietà:**

- Crescita/decrescita costante
- Grafico = retta
- $\Delta y / \Delta x$ sempre uguale

**Esempio:** $y = 2x + 1$

- Pendenza = 2 (ogni +1 in x → +2 in y)
- Parte da y = 1 quando x = 0
:::
::: {.column width="45%"}
\begin{tikzpicture}
\begin{axis}[
    width=5.5cm,
    height=6.5cm,
    axis lines=middle,
    xlabel={$x$},
    ylabel={$y$},
    xmin=-3, xmax=4,
    ymin=-3, ymax=6,
    xtick={-1,0,1,2},
    ytick={-2,0,2},
    grid=major,
    grid style={dashed,gray!30},
    tick label style={font=\tiny},
    samples=2
]

% Diverse pendenze
\addplot[blue, very thick, domain=-2:3] {2*x + 1};
\addplot[red, very thick, domain=-2:3] {-x + 2};
\addplot[green!60!black, very thick, domain=-2:3] {0.5*x};

% Labels
\node[blue, font=\small] at (axis cs:1.5,4) {$m=2$};
\node[red, font=\small] at (axis cs:-1.5,3) {$m=-1$};
\node[green!60!black, font=\small] at (axis cs:2,1.5) {$m=0.5$};

% Evidenzia intercetta
\node[circle, fill=blue, inner sep=2pt] at (axis cs:0,1) {};
\draw[blue, dashed] (axis cs:-0.5,1) -- (axis cs:0.5,1) node[right, font=\tiny] {$q=1$};

\end{axis}
\end{tikzpicture}
:::
::::::::::::::

## Applicazioni audio lineari

:::::::::::::: {.columns}
::: {.column width="55%"}
**1. Fade in/out**

- Fade in: $A(t) = t / T$ 
- Volume cresce linearmente da 0 a 1
- $T$ = durata del fade

**2. Glissando lineare**

- $f(t) = f_0 + kt$
- Frequenza cambia a velocità costante
- $k$ = velocità di cambio (Hz/sec)

**3. Pan lineare**

- Da L a R in modo uniforme
- L(t) decresce, R(t) cresce

**4. Velocity mapping**

- MIDI velocity → volume
- Relazione lineare (spesso)
:::
::: {.column width="45%"}
\begin{tikzpicture}
\begin{axis}[
    width=5.5cm,
    height=4cm,
    axis lines=middle,
    xlabel={Tempo (s)},
    ylabel={Ampiezza},
    xmin=0, xmax=5,
    ymin=0, ymax=1.2,
    xtick={0,2.5,5},
    ytick={0,0.5,1},
    grid=major,
    grid style={dashed,gray!30},
    title={\small Fade In Lineare},
    tick label style={font=\tiny},
    samples=2
]

\addplot[blue, very thick, domain=0:5] {x/5};

% Annotazioni
\draw[red, <->] (axis cs:0,0) -- (axis cs:5,1) node[midway, above, sloped, font=\tiny] {crescita costante};

\end{axis}
\end{tikzpicture}

\vspace{0.3cm}

Da 0 a 1 in 5 secondi:\\$A(t) = t/5$ per $0 \leq t \leq 5$
:::
::::::::::::::

## Funzione quadratica: y = ax² + bx + c

:::::::::::::: {.columns}
::: {.column width="55%"}
**Forma generale:**

$$y = ax^2 + bx + c$$

**Forma semplificata:** $y = ax^2$

**Parametri:**

- $a$ = curvatura
  - $a > 0$ → parabola verso l'alto
  - $a < 0$ → parabola verso il basso
  - $|a|$ grande → più "stretta"

**Caratteristiche:**

- Accelerazione/decelerazione
- Crescita NON costante
- Simmetrica rispetto al vertice

**Applicazioni:** movimenti naturali
:::
::: {.column width="45%"}
\begin{tikzpicture}
\begin{axis}[
    width=5.5cm,
    height=4.5cm,
    axis lines=middle,
    xlabel={$x$},
    ylabel={$y$},
    xmin=-3, xmax=3,
    ymin=-1, ymax=5,
    xtick={-2,0,2},
    ytick={0,2,4},
    grid=major,
    grid style={dashed,gray!30},
    tick label style={font=\tiny},
    samples=50
]

% Parabole con diversi a
\addplot[blue, very thick, domain=-2.5:2.5] {0.5*x^2};
\addplot[red, very thick, domain=-2:2] {x^2};
\addplot[green!60!black, very thick, domain=-1.5:1.5] {2*x^2};

% Labels
\node[blue, font=\small] at (axis cs:2,2.5) {$a=0.5$};
\node[red, font=\small] at (axis cs:-2,4.5) {$a=1$};
\node[green!60!black, font=\small] at (axis cs:1.2,3) {$a=2$};

\end{axis}
\end{tikzpicture}

\vspace{0.2cm}
Più $a$ è grande, più la curva è "ripida"
:::
::::::::::::::

## Applicazioni audio quadratiche

:::::::::::::: {.columns}
::: {.column width="55%"}
**1. Inviluppi naturali**

- Attack di percussioni
- $A(t) = k \cdot t^2$ (crescita accelerata)
- Più realistico del lineare

**2. Velocity curves**

- MIDI velocity → loudness
- Risposta quadratica = più espressiva
- Tocchi leggeri più sensibili

**3. Distorsione soft-clip**

- $y = x - \frac{x^3}{3}$ (approssimazione)
- Comprime dolcemente i picchi

**4. Fade-in/out "smooth"**

- Più naturale delle rampe lineari
- Inizio/fine graduali
:::
::: {.column width="45%"}
\begin{tikzpicture}
\begin{axis}[
    width=5.5cm,
    height=4cm,
    axis lines=middle,
    xlabel={Tempo},
    ylabel={Ampiezza},
    xmin=0, xmax=1,
    ymin=0, ymax=1.2,
    xtick={0,0.5,1},
    ytick={0,0.5,1},
    grid=major,
    grid style={dashed,gray!30},
    title={\small Attack Quadratico vs Lineare},
    tick label style={font=\tiny},
    samples=50
]

% Quadratico
\addplot[blue, very thick, domain=0:1] {x^2};
% Lineare
\addplot[red, dashed, thick, domain=0:1] {x};

\node[blue, font=\small] at (axis cs:0.4,0.3) {quad};
\node[red, font=\small] at (axis cs:0.6,0.75) {lin};

\end{axis}
\end{tikzpicture}

\vspace{0.2cm}
Attack quadratico parte più lento,\\accelera verso il picco
:::
::::::::::::::

## Funzione esponenziale: y = a·e^(bx)

:::::::::::::: {.columns}
::: {.column width="55%"}
**Forma generale:**

$$y = a \cdot e^{bx}$$

dove $e \approx 2.718$ (numero di Eulero)

**Caratteristiche:**

- Crescita/decrescita proporzionale al valore attuale
- **NON lineare** - cambia sempre più velocemente
- $b > 0$ → crescita esponenziale
- $b < 0$ → decadimento esponenziale

**Proprietà chiave:**

- Il tasso di cambiamento dipende da y stesso
- $\frac{dy}{dx} = b \cdot y$

**In natura:** tutto ciò che decade o cresce proporzionalmente
:::
::: {.column width="45%"}
\begin{tikzpicture}
\begin{axis}[
    width=5.5cm,
    height=4.5cm,
    axis lines=middle,
    xlabel={$x$},
    ylabel={$y$},
    xmin=-2, xmax=2,
    ymin=0, ymax=5,
    xtick={-1,0,1},
    ytick={0,1,2,3,4},
    grid=major,
    grid style={dashed,gray!30},
    tick label style={font=\tiny},
    samples=100
]

% Esponenziale crescente
\addplot[blue, very thick, domain=-2:1.5] {exp(x)};
% Esponenziale decrescente
\addplot[red, very thick, domain=-1.5:2] {exp(-x)};

% Labels
\node[blue, font=\small] at (axis cs:0.8,3.5) {$e^x$};
\node[red, font=\small] at (axis cs:1.2,1) {$e^{-x}$};

% Evidenzia y=1 quando x=0
\node[circle, fill=black, inner sep=2pt] at (axis cs:0,1) {};

\end{axis}
\end{tikzpicture}

\vspace{0.2cm}
{\footnotesize Nota: entrambe passano per (0,1)}
:::
::::::::::::::

## Applicazioni audio esponenziali

:::::::::::::: {.columns}
::: {.column width="55%"}
**1. Decay naturale**

- Corde, piatti, tamburi
- $A(t) = A_0 \cdot e^{-t/\tau}$
- $\tau$ = tempo di decadimento

**2. Percezione logaritmica**

- Volume percepito ≠ ampiezza lineare
- dB = scala logaritmica
- $dB = 20 \log_{10}(A)$

**3. Release di envelope**

- Esponenziale più realistico
- Simula dissipazione energia fisica

**4. Filter resonance decay**

- Risonanza decade esponenzialmente
- Tipico nei filtri analogici
:::
::: {.column width="45%"}
\begin{tikzpicture}
\begin{axis}[
    width=5.5cm,
    height=4cm,
    axis lines=middle,
    xlabel={Tempo (s)},
    ylabel={Ampiezza},
    xmin=0, xmax=5,
    ymin=0, ymax=1.2,
    xtick={0,2.5,5},
    ytick={0,0.5,1},
    grid=major,
    grid style={dashed,gray!30},
    title={\small Decay Esponenziale},
    tick label style={font=\tiny},
    samples=100
]

% Decay esponenziale
\addplot[blue, very thick, domain=0:5] {exp(-x)};

% Annotazione tau
\draw[red, dashed] (axis cs:1,0) -- (axis cs:1,0.368);
\node[red, font=\tiny] at (axis cs:1.3,0.15) {$\tau=1$};
\draw[red, <->] (axis cs:0,0.368) -- (axis cs:1,0.368);

\end{axis}
\end{tikzpicture}

\vspace{0.2cm}
{\footnotesize Corda/piatto perde energia esponenzialmente}
:::
::::::::::::::

## Funzione seno: y = A·sin(ωx + φ)

:::::::::::::: {.columns}
::: {.column width="55%"}
**Forma generale:**

$$y = A \cdot \sin(\omega x + \varphi)$$

**Parametri fondamentali:**

- $A$ = **ampiezza** (altezza dell'onda)
- $\omega$ = **frequenza angolare** (velocità)
  - $\omega = 2\pi f$ dove $f$ = frequenza in Hz
- $\varphi$ = **fase** (spostamento orizzontale)

**Proprietà:**

- Periodica: si ripete all'infinito
- Periodo $T = \frac{2\pi}{\omega} = \frac{1}{f}$
- Oscillazione tra $-A$ e $+A$
- Sempre "liscia" (continua e derivabile)
:::
::: {.column width="45%"}
\begin{tikzpicture}
\begin{axis}[
    width=5.5cm,
    height=4cm,
    axis lines=middle,
    xlabel={$x$},
    ylabel={$y$},
    xmin=0, xmax=6.5,
    ymin=-2.5, ymax=1.5,
    xtick={1.57,3.14,4.71,6.28},
    xticklabels={$\frac{\pi}{2}$,$\pi$,$\frac{3\pi}{2}$,$2\pi$},
    ytick={-1,0,1},
    grid=major,
    grid style={dashed,gray!30},
    tick label style={font=\tiny},
    samples=200
]

% Seno base
\addplot[blue, very thick, domain=0:6.5] {sin(deg(x))};

% Evidenzia picchi
\node[circle, fill=red, inner sep=2pt] at (axis cs:1.57,1) {};
\node[circle, fill=red, inner sep=2pt] at (axis cs:4.71,-1) {};

% Periodo
\draw[<->, red, thick] (axis cs:0,-1.3) -- (axis cs:6.28,-1.3) node[midway, below, font=\small] {Periodo $T = 2\pi$};

\end{axis}
\end{tikzpicture}

\vspace{0.2cm}
{\footnotesize $y = \sin(x)$ con $A=1, \omega=1, \varphi=0$}
:::
::::::::::::::

## Il seno nell'audio

:::::::::::::: {.columns}
::: {.column width="55%"}
**1. Tono puro (oscillatore)**

- $y(t) = A \cdot \sin(2\pi f_0 t)$
- $f_0$ = 440 Hz → La centrale
- Onda sinusoidale = frequenza singola

**2. Building block della sintesi**

- Sintesi additiva = somma di seni
- Teorema di Fourier: ogni suono periodico = somma di seni

**3. LFO (Low Frequency Oscillator)**

- $f$ bassa (0.1-20 Hz)
- Modula altri parametri
- Vibrato, tremolo, auto-pan

**4. Analisi spettrale**

- FFT scompone suono in seni/coseni
:::
::: {.column width="45%"}
\begin{tikzpicture}
\begin{axis}[
    width=5.5cm,
    height=4cm,
    axis lines=middle,
    xlabel={Tempo (ms)},
    xlabel style={right},
    ylabel={Ampiezza},
    ylabel style= {above},
    xmin=0, xmax=10,
    ymin=-1.2, ymax=1.2,
    xtick={0,2.27,4.54},
    xticklabels={0,T,2T},
    ytick={-1,0,1},
    grid=major,
    grid style={dashed,gray!30},
    title={\small 440 Hz (La)},
    tick label style={font=\tiny},
    samples=200
]

% 440 Hz
\addplot[blue, very thick, domain=0:10] {sin(deg(2*pi*440*x/1000))};

% Periodo evidenziato
\draw[red, <->] (axis cs:0,1.1) -- (axis cs:2.27,1.1) node[midway, above, font=\tiny] {$T = 1/440 \approx 2.27$ ms};

\end{axis}
\end{tikzpicture}

\vspace{0.2cm}
{\footnotesize Oscillazione perfetta, spettro singolo}
:::
::::::::::::::

## Funzione coseno: y = A·cos(ωx + φ)

:::::::::::::: {.columns}
::: {.column width="55%"}
**Forma generale:** $y = A \cdot \cos(\omega x + \varphi)$

**Relazione con il seno:** $\cos(x) = \sin(x + \frac{\pi}{2})$

**Identico al seno ma:**

- Parte dal massimo (1) invece che da zero
- "Spostato" di 90° (π/2 radianti)

**In audio:**

- Stessa importanza del seno
- Usati insieme per fase/quadratura
- FFT usa sia seni che coseni

**Proprietà identiche al seno:**

- Periodica, liscia, oscillatoria
:::
::: {.column width="45%"}
\begin{tikzpicture}
\begin{axis}[
    width=5.5cm,
    height=4.5cm,
    axis lines=middle,
    xlabel={$x$},
    ylabel={$y$},
    xmin=0, xmax=6.5,
    ymin=-1.5, ymax=1.5,
    xtick={1.57,3.14,4.71,6.28},
    xticklabels={$\frac{\pi}{2}$,$\pi$,$\frac{3\pi}{2}$,$2\pi$},
    ytick={-1,0,1},
    grid=major,
    grid style={dashed,gray!30},
    samples=200,
    tick label style={font=\tiny},
    legend pos=north east,
    legend style={font=\tiny}
]

% Seno
\addplot[blue, thick, domain=0:6.5] {sin(deg(x))};
\addlegendentry{$\sin(x)$}

% Coseno
\addplot[red, very thick, dashed, domain=0:6.5] {cos(deg(x))};
\addlegendentry{$\cos(x)$}

% Shift evidenziato
\draw[green!60!black, <->] (axis cs:0,0.5) -- (axis cs:1.57,0.5) node[midway, above, font=\tiny] {$\pi/2$};

\end{axis}
\end{tikzpicture}

\vspace{0.2cm}
{\footnotesize Coseno = seno spostato di 90°}
:::
::::::::::::::

# **DA CONTINUO A DISCRETO**

## Continuo vs Discreto: il grande salto

:::::::::::::: {.columns}
::: {.column width="55%"}
**Mondo analogico (continuo):**

- Infiniti valori possibili
- Ogni istante di tempo esiste
- Curva "liscia" senza interruzioni
- Il mondo reale è continuo

**Mondo digitale (discreto):**

- Valori separati, numerabili
- Solo istanti specifici campionati
- Sequenza di punti, non curva continua
- Il computer può solo "contare"

**Il problema fondamentale:**

Come traduciamo infinito in finito?
:::
::: {.column width="45%"}
\begin{tikzpicture}
\begin{axis}[
    width=5.5cm,
    height=4.5cm,
    axis lines=middle,
    xlabel={Tempo},
    xlabel style={above},
    ylabel={Ampiezza},
    ylabel style={right},
    xmin=0, xmax=1,
    ymin=-1.2, ymax=1.2,
    xtick={0,0.5,1},
    ytick={-1,0,1},
    grid=major,
    grid style={dashed,gray!30},
    samples=200,
    tick label style={font=\tiny},
    title={\small Continuo vs Discreto}
]

% Segnale continuo
\addplot[blue, thick, domain=0:1] {sin(deg(2*pi*3*x))};

% Punti discreti campionati
\addplot[red, only marks, mark=*, mark size=1.5pt, samples=12, domain=0:1] {sin(deg(2*pi*3*x))};

% Legenda
\node[blue] at (axis cs:0.25,0.7) {\tiny continuo};
\node[red] at (axis cs:0.75,-0.7) {\tiny discreto};

\end{axis}
\end{tikzpicture}

\vspace{0.2cm}
{\footnotesize Blu = onda continua\\Rosso = punti campionati}
:::
::::::::::::::

## Il campionamento (sampling)

:::::::::::::: {.columns}
::: {.column width="55%"}
**Cos'è il campionamento:**

- Prendere "istantanee" del segnale a intervalli regolari
- Come fotografare un movimento continuo

**Sample Rate (frequenza di campionamento):**

- Quante misure al secondo (Hz)
- CD audio: 44100 Hz = 44100 samples/sec
- Audio pro: 48000, 96000, 192000 Hz

**Periodo di campionamento:**

- $T_s = 1/f_s$ 
- A 44.1 kHz: $T_s \approx 22.7$ microsecondi
- Ogni 22.7 μs prendiamo una misura

**Più alto il sample rate:**

- Più fedele la rappresentazione
- Ma più dati da memorizzare/processare
:::
::: {.column width="45%"}
\begin{tikzpicture}
\begin{axis}[
    width=5.5cm,
    height=4.5cm,
    axis lines=middle,
    xlabel={Tempo (ms)},
    ylabel={Ampiezza},
    xmin=0, xmax=10,
    ymin=-1.3, ymax=1.3,
    xtick={0,2.5,5,7.5,10},
    ytick={-1,0,1},
    grid=major,
    tick label style={font=\tiny},
    grid style={dashed,gray!30},
    samples=200
]

% Onda continua 440 Hz
\addplot[blue!30, thick, domain=0:10] {sin(deg(2*pi*440*x/1000))};

% Punti campionati (44.1 kHz)
\addplot[red, only marks, mark=*, mark size=0.5pt, samples at={0,0.0227,0.0454,0.0681,0.0908,0.1134,0.1361,0.1588,0.1814,0.2041,0.2268,0.2494,0.2721,0.2948,0.3175,0.3401,0.3628,0.3855,0.4082,0.4308,0.4535,0.4762,0.4989,0.5215,0.5442,0.5669,0.5896,0.6122,0.6349,0.6576,0.6803,0.7029,0.7256,0.7483,0.7710,0.7936,0.8163,0.8390,0.8617,0.8843,0.9070,0.9297,0.9524,0.9750,0.9977}] {sin(deg(2*pi*440*x/1000))};

% Annotazione
\draw[<->, green!60!black, thick] (axis cs:0,-1.2) -- (axis cs:0.0227,-1.2) node[midway, below, font=\tiny] {$T_s$};

\end{axis}
\end{tikzpicture}

\vspace{0.2cm}
{\footnotesize Campionamento a 44.1 kHz}
:::
::::::::::::::

## Teorema di Nyquist (semplificato)

:::::::::::::: {.columns}
::: {.column width="55%"}
**La regola d'oro del campionamento:**

Per catturare una frequenza $f$, devi campionarla **almeno 2 volte per ciclo** $f_s \geq 2 \cdot f_{max}$

**Frequenza di Nyquist:**

- $f_{Nyquist} = f_s / 2$
- Massima frequenza rappresentabile

**Esempi pratici:**

- 44.1 kHz → max 22.05 kHz (copre udibile)
- 48 kHz → max 24 kHz
- 96 kHz → max 48 kHz (overkill per orecchio)

**Sotto il limite Nyquist:**

- Ricostruzione perfetta possibile
- Nessuna perdita di informazione
:::
::: {.column width="45%"}
\begin{tikzpicture}
\begin{axis}[
    width=5.5cm,
    height=4cm,
    axis lines=middle,
    xlabel={Tempo},
    ylabel={},
    xmin=0, xmax=1,
    ymin=-1.3, ymax=1.3,
    xtick={},
    ytick={},
    tick label style={font=\tiny},
    samples=200,
    title={\small Campionamento corretto}
]

% Onda a frequenza corretta
\addplot[blue, thick, domain=0:1] {sin(deg(2*pi*2*x))};

% Punti campionati (almeno 2 per ciclo)
\addplot[red, only marks, mark=*, mark size=1.5pt, samples=17, domain=0:1] {sin(deg(2*pi*2*x))};

% Evidenzia un ciclo
\draw[green!60!black, thick, <->] (axis cs:0,1.2) -- (axis cs:0.5,1.2) node[midway, above, font=\tiny] {1 ciclo};

% Conta i samples
\node[font=\tiny, align=center] at (axis cs:0.25,-1.1) {8+ samples\\per ciclo\\ OK};

\end{axis}
\end{tikzpicture}

\vspace{0.2cm}
 Almeno 2 samples per ciclo\\= ricostruzione possibile
:::
::::::::::::::

## Aliasing: quando campioniamo troppo lentamente

:::::::::::::: {.columns}
::: {.column width="55%"}
**Cosa succede sotto Nyquist:**

- Frequenze alte "si travestono" da basse
- Il segnale ricostruito è SBAGLIATO
- Informazione irrecuperabilmente persa

**Esempio classico:**

- Ruota di carro in film western
- Sembra girare all'indietro!
- Frequenza di rotazione > frequenza film/2

**Conseguenze in audio:**

- Suoni artefatti, "metallic"
- Frequenze che non c'erano nell'originale
- Distorsione non musicale

**Soluzione:**

- Anti-aliasing filter prima dell'ADC
- Taglia tutte le frequenze > fs/2
:::
::: {.column width="45%"}
\begin{tikzpicture}
\begin{axis}[
    width=5.5cm,
    height=4.5cm,
    axis lines=middle,
    xlabel={Tempo},
    ylabel={Ampiezza},
    ylabel style={above},
    xlabel style={right},
    xmin=0, xmax=1,
    ymin=-1.3, ymax=1.3,
    xtick={},
    ytick={},
    tick label style={font=\tiny},
    samples=200,
    title={\small ALIASING (sotto-campionamento)}
]

% Onda vera (alta frequenza)
\addplot[blue!30, thick, domain=0:1] {sin(deg(2*pi*5*x))};

% Punti campionati (troppo pochi)
\addplot[red, only marks, mark=*, mark size=1.5pt, samples=7, domain=0:1] {sin(deg(2*pi*5*x))};

% Onda ricostruita SBAGLIATA (alias)
\addplot[red, thick, dashed, domain=0:1] {-sin(deg(2*pi*1*x))};

% Annotazione
\node[blue!30, font=\tiny, above] at (axis cs:0.3,0.9) {vera (5 Hz)};
\node[red, font=\tiny, below] at (axis cs:0.7,0.9) {alias (1 Hz)};
\node[font=\small, red] at (axis cs:0.5,-1.2) {ERRORE};

\end{axis}
\end{tikzpicture}

\vspace{0.2cm}
Troppo pochi samples → frequenza sbagliata
:::
::::::::::::::

## Quantizzazione: da infinito a finito

:::::::::::::: {.columns}
::: {.column width="55%"}
**Due discretizzazioni:**

1. **Campionamento** = discretizzazione nel TEMPO
2. **Quantizzazione** = discretizzazione nell'AMPIEZZA

**Bit depth (profondità di bit):** Quanti livelli di ampiezza possibili
- 8 bit = 256 livelli (2⁸)
- 16 bit = 65536 livelli (2¹⁶) → CD
- 24 bit = 16.777.216 livelli → pro
- 32 bit float = ~4 miliardi di livelli

**Quantization error:**

- Errore di arrotondamento
- Introduce rumore ("quantization noise")
- Più bit = meno rumore

**Dynamic range:**

- 16 bit ≈ 96 dB
- 24 bit ≈ 144 dB
:::
::: {.column width="45%"}
\begin{tikzpicture}
\begin{axis}[
    width=5.5cm,
    height=4.5cm,
    axis lines=middle,
    xlabel={Tempo},
    ylabel={Livelli},
    ylabel style={above},
    xlabel style={right},
    xmin=0, xmax=1,
    ymin=-1.2, ymax=1.2,
    ytick={-1,-0.75,-0.5,-0.25,0,0.25,0.5,0.75,1},
    yticklabels={},
    xtick={},
    tick label style={font=\tiny},
    samples=200,
    title={\small Quantizzazione (es. 4 bit = 16 livelli)}
]

% Segnale continuo
\addplot[blue!30, thick, domain=0:1] {sin(deg(2*pi*2*x))};

% Livelli di quantizzazione
\foreach \y in {-1,-0.875,-0.75,-0.625,-0.5,-0.375,-0.25,-0.125,0,0.125,0.25,0.375,0.5,0.625,0.75,0.875,1} {
    \edef\temp{\noexpand\draw[red!30, very thin] (axis cs:0,\y) -- (axis cs:1,\y);}
    \temp
}
% Segnale quantizzato (scala di grigi)
\addplot[red, very thick, const plot, samples=40, domain=0:1] {round(sin(deg(2*pi*2*x))*8)/8};

\node[blue!30, font=\tiny] at (axis cs:0.2,0.7) {continuo};
\node[red, font=\tiny] at (axis cs:0.7,-0.7) {quantizzato};

\end{axis}
\end{tikzpicture}

\vspace{0.2cm}
Ampiezza arrotondata ai livelli più vicini
:::
::::::::::::::

## Il cerchio si chiude: funzione digitale

:::::::::::::: {.columns}
::: {.column width="55%"}
**Audio digitale = sequenza di numeri**
Dopo campionamento + quantizzazione:

- Tempo discreto: $t_n = n \cdot T_s$
- Ampiezza discreta: livelli quantizzati
- Risultato: array di numeri interi

**Esempio (16 bit, 44.1 kHz):**
[0, 12453, 23421, 28934, 23421, 
 12453, 0, -12453, -23421, ...]

**Ogni numero:**

- Rappresenta l'ampiezza in un istante
- È un valore di funzione: $A[n] = A(n \cdot T_s)$

**Processare audio digitale:**

- Applicare funzioni matematiche ai numeri
- Filtro = moltiplicare, sommare, ritardare
- Tutto è matematica su array
:::
::: {.column width="45%"}
\begin{tikzpicture}
\begin{axis}[
    width=5.5cm,
    height=4.5cm,
    axis lines=middle,
    xlabel={Sample index $n$},
    ylabel={Valore},
    ylabel style={above},
    xlabel style={right},
    xmin=0, xmax=17,
    ymin=-1.7, ymax=1.2,
    xtick={0,4,8,12,16},
    ytick={-1,0,1},
    tick label style={font=\tiny},
    grid=major,
    grid style={dashed,gray!30},
    title={\small Segnale Digitale}
]

% Stem plot (punti discreti)
\addplot[red, only marks, mark=*, mark size=1.5pt, samples at={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}] {sin(deg(2*pi*2*x/16))};

% Linee verticali dai punti
\foreach \n in {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16} {
    \edef\temp{\noexpand\draw[red, thin] (axis cs:\n,0) -- (axis cs:\n,{sin(deg(2*pi*2*\n/16))});}
    \temp
}

% Annotazione
\node[font=\footnotesize, align=center, below] at (axis cs:8,-1.1) {Solo punti discreti\\niente tra i punti};

\end{axis}
\end{tikzpicture}

\vspace{0.2cm}
Array di numeri, non curva continua
:::
::::::::::::::


# **CONCLUSIONI**

## Ricapitolo: dalla fisica alla matematica

:::::::::::::: {.columns}
::: {.column width="55%"}
**Il viaggio che abbiamo fatto:**

1. **Funzioni** = relazioni input→output
   - Macchine trasformatrici con regole precise
   - Dominio e codominio

2. **Piano cartesiano** = visualizzare relazioni
   - Ogni punto (x, y) racconta una storia
   - Grafici = funzioni visibili

3. **Tipi di funzioni fondamentali:**
   - **Costante**: nessun cambiamento
   - **Lineare**: cambiamento costante
   - **Quadratica**: accelerazione/curvatura
   - **Esponenziale**: crescita/decadimento naturale
   - **Seno/Coseno**: oscillazioni perfette
:::
::: {.column width="45%"}
\begin{tikzpicture}[scale=0.8]
% Box collegati verticalmente
\node[draw, rectangle, rounded corners, fill=blue!20, minimum width=3cm, minimum height=0.8cm, font=\small] (func) at (0,4) {Funzioni};

\node[draw, rectangle, rounded corners, fill=green!20, minimum width=3cm, minimum height=0.8cm, font=\small] (piano) at (0,3) {Piano Cartesiano};

\node[draw, rectangle, rounded corners, fill=yellow!20, minimum width=3cm, minimum height=0.8cm, font=\small] (tipi) at (0,2) {Tipi (lin, quad, exp, sin)};

\node[draw, rectangle, rounded corners, fill=orange!20, minimum width=3cm, minimum height=0.8cm, font=\small] (audio) at (0,1) {Applicazioni Audio};

\node[draw, rectangle, rounded corners, fill=red!20, minimum width=3cm, minimum height=0.8cm, font=\small] (dsp) at (0,0) {DSP Digitale};

% Frecce
\draw[->, very thick] (func) -- (piano);
\draw[->, very thick] (piano) -- (tipi);
\draw[->, very thick] (tipi) -- (audio);
\draw[->, very thick] (audio) -- (dsp);

\end{tikzpicture}

\vspace{0.3cm}
 Ogni concetto costruisce sul precedente
:::
::::::::::::::

## Dal mondo analogico al digitale

:::::::::::::: {.columns}
::: {.column width="55%"}
**Campionamento + Quantizzazione = Digitalizzazione**

**Mondo Analogico:**

- Continuo nel tempo e nell'ampiezza
- Infiniti valori possibili
- Fenomeni fisici reali

**Ponte Matematico:**

- Funzioni descrivono onde
- Teorema di Nyquist: $f_s \geq 2f_{max}$
- Quantizzazione: ampiezza → numeri discreti

**Mondo Digitale:**
- Sequenza di numeri
- Processabile dal computer
- DSP = matematica su array

**La matematica è il linguaggio:**
- Computer "pensa" in numeri
- Ogni algoritmo = funzione matematica
- Comprensione = controllo creativo
:::
::: {.column width="45%"}
\begin{tikzpicture}
\begin{axis}[
    width=5.5cm,
    height=3.5cm,
    axis lines=middle,
    xlabel={},
    ylabel={},
    xmin=0, xmax=1,
    ymin=-1.2, ymax=1.2,
    xtick={},
    ytick={},
    tick label style={font=\tiny},
    samples=200,
    title={\small Analogico → Digitale}
]

% Analogico (continuo)
\addplot[blue!40, very thick, domain=0:1] {sin(deg(2*pi*3*x))};

% Digitale (discreto)
\addplot[red, only marks, mark=*, mark size=1.5pt, samples=25, domain=0:1] {sin(deg(2*pi*3*x))};

% Labels
\node[blue!40, font=\footnotesize, above] at (axis cs:0.25,0.8) {continuo};
\node[red, font=\footnotesize, below] at (axis cs:0.75,-0.8) {discreto};

\end{axis}
\end{tikzpicture}

\vspace{0.5cm}

\begin{tikzpicture}[scale=0.7]
% Flow
\node[font=\small] (a) at (0,2) {Suono fisico};
\node[font=\small] (b) at (0,1) {Funzione matematica};
\node[font=\small] (c) at (0,0) {Array di numeri};
\node[font=\small] (d) at (0,-1) {Algoritmi DSP};

\draw[->, thick] (a) -- (b) node[midway, right, font=\tiny] {descrive};
\draw[->, thick] (b) -- (c) node[midway, right, font=\tiny] {campiona};
\draw[->, thick] (c) -- (d) node[midway, right, font=\tiny] {processa};

\end{tikzpicture}
:::
::::::::::::::
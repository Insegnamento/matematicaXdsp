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
  \draw[blue, thick, ->] (-0.8,2.5) -- (-0.8,3.2);
  \node[blue, font=\small, align=center] at (-1.5,2) {OUTPUT\\(risultato)};
  
  \draw[orange, thick, ->] (0,2.3) -- (0,2.8);
  \node[orange, font=\small, align=center] at (0,1.5) {FUNZIONE\\(regola)};
  
  \draw[red, thick, ->] (0.8,2.5) -- (0.8,3.2);
  \node[red, font=\small, align=center] at (1.5,2) {INPUT\\(dato)};
  
  % Esempio concreto
  \node[fill=gray!20, rounded corners, align=center, text width=4cm, font=\small] at (0,0) {
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
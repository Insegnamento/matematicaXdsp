\version "2.24.4" % Specifica la versione di LilyPond


% --- LA TUA MUSICA ---
\score {
  \new Staff {
    % Nota: Senza il Bar_engraver, le barre di battuta non verranno stampate.
    % La musica è semplicemente una sequenza di note.
    c4 d e f
  }
}
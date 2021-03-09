\version "2.20.0"
#(ly:set-option 'relative-includes #t)
\include "../../lib/hymn_common.ly"

%% TUNE INFO
\include "../../shared_tunes/resignation_arrbykenan.ly"

%% SONG INFO
title = \titleText "My Shepherd will supply my need;"
poet = \smallText "Text: Isaac Watts, 1719, alt."
copyright = \public_domain_notice "Kenan Schaefkofer"
tags = "christian 4part acapella 3verse arrbykenan textbyother"
dateAdded = "2021-03-04"
\include "../../lib/header.ly"

%% LYRICS
verseA = \lyricmode {
  My Shep -- herd will sup -- ply my need; most ho -- ly is your name.
  In pas -- tures fresh you make me feed, be -- side the liv -- ing stream.
  You bring my wan -- d'ring spir -- it back, when I far -- sake your ways,
  and lead me for your mer -- cy's sake, in paths of truth and grace.
}
verseB = \lyricmode {
  When I walk through the shades of death, your pres -- ence is my stay.
  One word of your sup -- port -- ing breath drives all my fears a -- way.
  Your hand, in sight of all my foes, does still my ta -- ble spread.
  My cup with bless -- ings o -- ver -- flows, your oil a -- noints my head.
}
verseC = \lyricmode {
  The sure pro -- vi -- sions of my God at -- tend me all my days.
  Oh, may your house be my a -- bode, and all my work be praise.
  There would I find a set -- tled rest, while oth -- ers go and come,
  no more a stran -- ger, nor a guest, but like a child at home.
}

all_verses = <<
  \new NullVoice = "soprano" \soprano
  % Add what you need. If more than 4, fill in the second argument as shown in 5 and 6
  \new Lyrics  \lyricsto soprano  { \globalLyrics "1" "" \verseA }
  \new Lyrics  \lyricsto soprano  { \globalLyrics "2" "" \verseB }
  \new Lyrics  \lyricsto soprano  { \globalLyrics "3" "" \verseC }
>>


%% Traditional notation
\book { \bookOutputSuffix "trad" \score { \fillTradScore \soprano \alto \tenor \bass \songChords } }

%% Traditional with shaped noteheads (broken on non-combined chords)
\book { \bookOutputSuffix "shapenote" \score { \fillTradScore {\aikenHeads \soprano} {\aikenHeads \alto} {\aikenHeads \tenor} {\aikenHeads \bass} \songChords } }

%% Clairnotes Notation
\book { \bookOutputSuffix "clairnote" \score { \fillClairScore \soprano \alto \tenor \bass } }

%% MIDI output
\score {
  <<
    \new Staff \with { midiMaximumVolume = #0.9 } \soprano
    \new Staff \with { midiMaximumVolume = #0.7  } \alto
    \new Staff \with { midiMaximumVolume = #0.8  } \tenor
    \new Staff \with { midiMaximumVolume = #0.9 } \bass
  >>
  \midi {
    \context { \Staff \remove "Staff_performer" }
    \context { \Voice \consists "Staff_performer" }
    \tempo  4 = 100
  }
}

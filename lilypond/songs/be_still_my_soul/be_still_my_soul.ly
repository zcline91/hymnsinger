\version "2.20.0"
#(ly:set-option 'relative-includes #t)
\include "../../lib/hymn_common.ly"

%% TUNE INFO
composer = \smallText "Music: Jean Sibelius, 1899"
meter = \smallText "FINLANDIA 10.10.10"
hymnKey = \key f \major
hymnTime = \time 4/4
\include "../../lib/global_parts.ly"

%% SONG INFO
title = \titleText "Be still my soul"
poet = \smallText "Text: Kathrina von Schlegel, tr. Jane Borthwick (1855)"
copyright = \public_domain_notice "Kenan Schaefkofer"
tags = "theist 4part acapella 3verse musicbyother textbyother"
dateAdded = "2021-01-14"
\include "../../lib/header.ly"

%% NOTES
soprano = {
  \globalParts
  \relative g' { \partial 2. a4 g a | bf2. a4 | g a f4. g8 | g4( a2.)~ | a4 a g a | bf2. a4 | g a f4. g8 | a1~ | }
  \relative g' { a4 c c c | d2. a4 | a c c4. g8 | g4( bf2.)~ | bf4 bf a g | a2. f4 | f g g4. a8 | a1~ | }
  \relative g' { a4 c c c | d2. a4 | a c c4. g8 | g4( bf2.)~ | bf4 bf a g | a2. f4 | f g g4. f8 | f1~ | f4 }
  \bar "|."
}
alto = {
  \globalParts
  \relative e' {}
  \relative e' {}
  \relative e' {}
  \relative e' {}

  \relative e' { f4 e f | e2. f4 | e f d4. e8 | e4( f2.)~ | f4 f e f | e2. f4 | e f d4. e8 | f1~ | }
  \relative e' { f4 f f f | f2. f4 | f f f4. e8 | e4( g2.)~ | g4 g fs g | f?2. f4 | f f e4. e8 | e1~ | }
  \relative e' { e4 a f f | f2. f4 | f f f4. e8 | e4( g2.)~ | g4 g fs g | f?2. c4 | f f e4. f8 | f1~ | f4 }
}
tenor = {
  \globalParts
  \relative a { c4 c c | c2. c4 | c c bf4. bf8 | c1~ | c4 c c c | c2. c4 | c c bf4. bf8 | c1~ | }
  \relative a { c4 a a a | a2. d4 | d c c4. c8 | c4( d2.)~ | d4 d c d | c2. c4 | d d d4. cs8 | cs1~ | }
  \relative a { cs!4 c a a | a2. d4 | d c c4. c8 | c4( d2.)~ | d4 d c d | c2. a4 | a4 bf bf4. a8 | a1~ | a4 }
}
bass = {
  \globalParts
  \relative d { f4 bf a | g2. f4 | bf a bf4. g8 | g4( f2.)~ | f4 f bf a | g2. f4 | bf a bf4. g8 | f1~ | }
  \relative d { f4 f f e | d2. d4 | d a a4. c8 | c4( g2.)~ | g4 g a bf | a2. c'4 | bf bf bf4. a8 | a1~ | }
  \relative d { a'4 f f e | d2. d4 | d a' a4. c8 | c4( g2.)~ | g4 g, a bf | c2. c4 | c c c4. f8 | f1~ | f4  }
}

%% LYRICS
verseA = \lyricmode {
  Be still, my soul; the Lord is on thy side;
  bear pa -- tient -- ly the cross of grief or pain;
  leave to thy God to or -- der and pro -- vide;
  in eve -- ry change he faith -- ful will re -- main.
  Be still, my soul; thy best, thy heav’n -- ly friend
  through thorn -- y ways leads to a joy -- ful end.
}
verseB = \lyricmode {
  Be still, my soul; thy God doth un -- der -- take
  to guide the fu -- ture as he has the past.
  Thy hope, thy con -- fid -- ence, let no -- thing shake;
  all now mys -- te -- rious shall be bright at last.
  Be still, my soul; the waves and winds still know
  his voice who ruled them while he dwelt be -- low.
}
verseC = \lyricmode {
  Be still, my soul; the hour is hast -- ’ning on
  when we shall be for -- ev -- er with the Lord,
  when dis -- ap -- point -- ment, grief, and fear are gone,
  sor -- row for -- got, love’s pur -- est joys re -- stored.
  Be still, my soul; when change and tears are past,
  all safe and bless -- ed we shall meet at last.
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

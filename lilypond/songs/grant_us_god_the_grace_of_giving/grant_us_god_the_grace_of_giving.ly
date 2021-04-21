\version "2.20.0"
#(ly:set-option 'relative-includes #t)
\include "../../lib/hymn_common.ily"

%% TUNE INFO
\include "../../shared_tunes/stuttgart.ily"

%% SONG INFO
title = \titleText "Grant us, God, the grace of giving"
%subtitle = \smallText "Optional"
poet = \smallText "Text: Robert Murray, 1880, alt."
typesetter = "Kenan Schaefkofer"
verseCount = 1
tags = "english theist 4part"
dateAdded = "2021-03-14"
\include "../../lib/header.ily"

%% LYRICS
verseA = \tag #'verseA \lyricmode {
  Grant us, God, the grace of giv -- ing with a spir -- it large and free
  that our -- selves and all our liv -- ing we may of -- fer un -- to thee.
}

% Set up music-aligned verses. Change to the correct number
\include "../../lib/1verse.ily"

%% All sheet music outputs
\include "../../lib/all_notation_outputs.ily"
% Slides output
\include "../../lib/slides_book_1verse.ily"
%% MIDI output
\include "../../lib/midi_output.ily"

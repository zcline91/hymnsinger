all_verses = <<
  \new NullVoice = "soprano" {\removeWithTag #'midionly \soprano}
  \tag #'verseA { \new Lyrics  \lyricsto soprano  { \globalLyrics "1" "1" \verseA } }
  \tag #'verseB { \new Lyrics  \lyricsto soprano  { \globalLyrics "2" "2" \verseB } }
  \tag #'verseC { \new Lyrics  \lyricsto soprano  { \globalLyrics "3" "3" \verseC } }
  \tag #'verseD { \new Lyrics  \lyricsto soprano  { \globalLyrics "4" "4" \verseD } }
  \tag #'verseE { \new Lyrics  \lyricsto soprano  { \globalLyrics "5" "5" \verseE } }
>>
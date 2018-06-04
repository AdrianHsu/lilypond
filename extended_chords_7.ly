\version "2.18.2"
\pointAndClickOff
\header {
    title = "Extended Chords (Dominant)"
    subtitle = "2018.6.5"
    composer = "Adrian Hsu"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
#(define-public (stack-stencil-overlay stencils)
   "Recursive function to add stencils together"
   (if (and (pair? stencils)
            (ly:stencil? (car stencils)))
       (if (and (pair? (cdr stencils))
                (ly:stencil? (cadr stencils)))
           (let ((tail (stack-stencil-overlay (cdr stencils)))
                 (head (car stencils)))
             (ly:stencil-add head tail))
           (car stencils))
       point-stencil))
%%%%%
#(define-markup-command (overlay layout props args)
   (markup-list?)
   "Overlay arguments one on top of the next"
   (let ((stencils (interpret-markup-list layout props args)))
     (stack-stencil-overlay
      (remove ly:stencil-empty? stencils))))
%%%%%
#(define-markup-command (with-flat layout props text)
   (markup?)
   (interpret-markup layout props
     #{
       \markup \concat { \raise #0.1 \fontsize #-3 \flat $text }
     #}))
%%%%%
#(define-markup-command (with-sharp layout props text)
   (markup?)
   (interpret-markup layout props
     #{
       \markup \concat { \raise #0.3 \fontsize #-5 \sharp $text }
     #}))
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"c:7" = \markup {
  \fret-diagram-verbose #`(
    (mute 6)
    (place-fret 5 3 ,#{ \markup \fontsize #-4 1 #} )
    (place-fret 4 5 ,#{ \markup \fontsize #-4 5 #} )
    (place-fret 3 3 ,#{ \markup \fontsize #-4 \with-flat 7 #})
    (place-fret 2 5 ,#{ \markup \fontsize #-4 3 #})
    (mute 1) ) }
%%%
"c:9" = \markup {
  \fret-diagram-verbose #`(
    (mute 6)
    (place-fret 5 3 ,#{ \markup \fontsize #-4 1 #})
    (place-fret 4 2 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 3 3 ,#{ \markup \fontsize #-4 \with-flat 7 #})
    (place-fret 2 3 ,#{ \markup \fontsize #-4 9 #})
    (mute 1) ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"c:11+" = \markup {
  \fret-diagram-verbose #`(
    (mute 6)
    (place-fret 5 3 ,#{ \markup \fontsize #-4 1 #})
    (place-fret 4 2 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 3 3 ,#{ \markup \fontsize #-4 \with-flat 7 #})
    (place-fret 2 3 ,#{ \markup \fontsize #-4 9 #})
    (place-fret 1 2 ,#{ \markup \fontsize #-4 \with-sharp 11 #}) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"c:13.11+" = \markup {
  \fret-diagram-verbose #`(
    (mute 6)
    (place-fret 5 3 ,#{ \markup \fontsize #-4 1 #})
    (place-fret 4 4 ,#{ \markup \fontsize #-4 \with-sharp 11 #})
    (place-fret 3 3 ,#{ \markup \fontsize #-4 \with-flat 7 #})
    (place-fret 2 5 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 1 5 ,#{ \markup \fontsize #-4 13 #}) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"bes:7" = \markup {
  \fret-diagram-verbose #`(
    (place-fret 6 6 ,#{ \markup \fontsize #-4 1 #})
    (mute 5)
    (place-fret 4 6 ,#{ \markup \fontsize #-4 \with-flat 7 #})
    (place-fret 3 7 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 2 6 ,#{ \markup \fontsize #-4 5 #})
    (mute 1) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"bes:9" = \markup {
  \fret-diagram-verbose #`(
    (place-fret 6 6 ,#{ \markup \fontsize #-4 1 #})
    (mute 5)
    (place-fret 4 6 ,#{ \markup \fontsize #-4 \with-flat 7 #})
    (place-fret 3 5 ,#{ \markup \fontsize #-4 9 #})
    (place-fret 2 3 ,#{ \markup \fontsize #-4 3 #})
    (mute 1) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"bes:9/bes" = \markup {
  \fret-diagram-verbose #`(
    (place-fret 6 6 ,#{ \markup \fontsize #-4 1 #})
    (mute 5)
    (place-fret 4 6 ,#{ \markup \fontsize #-4 \with-flat 7 #})
    (place-fret 3 7 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 2 6 ,#{ \markup \fontsize #-4 5 #})
    (place-fret 1 8 ,#{ \markup \fontsize #-4 9 #}) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"bes:11+" = \markup {
  \fret-diagram-verbose #`(
    (place-fret 6 6 ,#{ \markup \fontsize #-4 1 #})
    (mute 5)
    (place-fret 4 6 ,#{ \markup \fontsize #-4 \with-flat 7 #})
    (place-fret 3 7 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 2 5 ,#{ \markup \fontsize #-4 \with-sharp 11 #})
    (mute 1) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"bes:11+/a" = \markup {
  \fret-diagram-verbose #`(
    (mute 6)
    (mute 5)
    (place-fret 4 6 ,#{ \markup \fontsize #-4 \with-flat 7 #})
    (place-fret 3 7 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 2 5 ,#{ \markup \fontsize #-4 \with-sharp 11 #})
    (place-fret 1 8 ,#{ \markup \fontsize #-4 9 #}) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"bes:13.11" = \markup {
  \fret-diagram-verbose #`(
    (place-fret 6 6 ,#{ \markup \fontsize #-4 1 #})
    (mute 5)
    (place-fret 4 6 ,#{ \markup \fontsize #-4 \with-flat 7 #})
    (place-fret 3 7 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 2 8 ,#{ \markup \fontsize #-4 13 #})
    (place-fret 1 8 ,#{ \markup \fontsize #-4 9 #}) 
    ) }

\score { <<
\chords {
c1:7
c:9
c:11+
c:13.11+
bes:7
bes:9
bes:9/bes
bes:11+
bes:11+/a
bes:13.11
}
%%%
\new Staff { \clef "treble"
<c' g' bes' e''>1^\"c:7"
<c' e' bes' d''>^\"c:9"
<c' e' bes' d'' fis''>^\"c:11+"
<c' fis' bes' e'' a''>^\"c:13.11+"\break
<bes aes' d'' f''>^\"bes:7"
<bes aes' c'' d''>^\"bes:9"
<bes aes' d'' f'' c'''>^\"bes:9/bes" \break
<bes aes' d'' e''>^\"bes:11+"
<aes' d'' e'' c'''>^\"bes:11+/a"
<bes aes' d'' g'' c'''>^\"bes:13.11"
}
>>
%%%
\layout {
  \context { \ChordNames
    \override ChordName #'font-size = #-2
    \override ChordName #'self-alignment-X = #CENTER
    \override ChordName #'X-offset = #ly:self-alignment-interface::aligned-on-x-parent
  }
  \context { \Staff
    \override BarLine #'stencil = ##f
    \override TimeSignature #'stencil = ##f
    \override TextScript.fret-diagram-details.finger-code = #'below-string
    \override TextScript.padding = #4
  } 
} }
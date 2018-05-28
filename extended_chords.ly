\version "2.18.2"
\pointAndClickOff
\header {
    title = "Extended Chords (Major)"
    subtitle = "2018.5.28"
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
"c:maj7" = \markup {
  \fret-diagram-verbose #`(
    (mute 6)
    (place-fret 5 3 ,#{ \markup \fontsize #-4 1 #} )
    (place-fret 4 5 ,#{ \markup \fontsize #-4 5 #} )
    (place-fret 3 4 ,#{ \markup \fontsize #-4 7 #})
    (place-fret 2 5 ,#{ \markup \fontsize #-4 3 #})
    (mute 1) ) }
%%%
"c:maj9" = \markup {
  \fret-diagram-verbose #`(
    (mute 6)
    (place-fret 5 3 ,#{ \markup \fontsize #-4 1 #})
    (place-fret 4 2 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 3 4 ,#{ \markup \fontsize #-4 7 #})
    (place-fret 2 3 ,#{ \markup \fontsize #-4 9 #})
    (mute 1) ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"c:maj11+" = \markup {
  \fret-diagram-verbose #`(
    (mute 6)
    (place-fret 5 3 ,#{ \markup \fontsize #-4 1 #})
    (place-fret 4 2 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 3 4 ,#{ \markup \fontsize #-4 7 #})
    (place-fret 2 3 ,#{ \markup \fontsize #-4 9 #})
    (place-fret 1 2 ,#{ \markup \fontsize #-4 \with-sharp 11 #}) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"c:maj13.11+" = \markup {
  \fret-diagram-verbose #`(
    (mute 6)
    (place-fret 5 3 ,#{ \markup \fontsize #-4 1 #})
    (place-fret 4 4 ,#{ \markup \fontsize #-4 \with-sharp 11 #})
    (place-fret 3 4 ,#{ \markup \fontsize #-4 7 #})
    (place-fret 2 5 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 1 5 ,#{ \markup \fontsize #-4 13 #}) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"c:6.9" = \markup {
  \fret-diagram-verbose #`(
    (mute 6)
    (place-fret 5 3 ,#{ \markup \fontsize #-4 1 #})
    (place-fret 4 2 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 3 2 ,#{ \markup \fontsize #-4 6 #})
    (place-fret 2 3 ,#{ \markup \fontsize #-4 9 #})
    (place-fret 1 3 ,#{ \markup \fontsize #-4 5 #}) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"c:6.9.11+" = \markup {
  \fret-diagram-verbose #`(
    (mute 6)
    (place-fret 5 3 ,#{ \markup \fontsize #-4 1 #})
    (place-fret 4 2 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 3 2 ,#{ \markup \fontsize #-4 6 #})
    (place-fret 2 3 ,#{ \markup \fontsize #-4 9 #})
    (place-fret 1 2 ,#{ \markup \fontsize #-4 \with-sharp 11 #}) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"bes:maj7" = \markup {
  \fret-diagram-verbose #`(
    (place-fret 6 6 ,#{ \markup \fontsize #-4 1 #})
    (mute 5)
    (place-fret 4 7 ,#{ \markup \fontsize #-4 7 #})
    (place-fret 3 7 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 2 6 ,#{ \markup \fontsize #-4 5 #})
    (mute 1) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"bes:maj9" = \markup {
  \fret-diagram-verbose #`(
    (place-fret 6 6 ,#{ \markup \fontsize #-4 1 #})
    (mute 5)
    (place-fret 4 7 ,#{ \markup \fontsize #-4 7 #})
    (place-fret 3 5 ,#{ \markup \fontsize #-4 9 #})
    (place-fret 2 3 ,#{ \markup \fontsize #-4 3 #})
    (mute 1) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"bes:maj9/bes" = \markup {
  \fret-diagram-verbose #`(
    (place-fret 6 6 ,#{ \markup \fontsize #-4 1 #})
    (mute 5)
    (place-fret 4 7 ,#{ \markup \fontsize #-4 7 #})
    (place-fret 3 7 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 2 6 ,#{ \markup \fontsize #-4 5 #})
    (place-fret 1 8 ,#{ \markup \fontsize #-4 9 #}) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"bes:maj11+" = \markup {
  \fret-diagram-verbose #`(
    (place-fret 6 6 ,#{ \markup \fontsize #-4 1 #})
    (mute 5)
    (place-fret 4 7 ,#{ \markup \fontsize #-4 7 #})
    (place-fret 3 7 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 2 5 ,#{ \markup \fontsize #-4 \with-sharp 11 #})
    (mute 1) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"bes:maj11+/a" = \markup {
  \fret-diagram-verbose #`(
    (mute 6)
    (mute 5)
    (place-fret 4 7 ,#{ \markup \fontsize #-4 7 #})
    (place-fret 3 7 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 2 5 ,#{ \markup \fontsize #-4 \with-sharp 11 #})
    (place-fret 1 8 ,#{ \markup \fontsize #-4 9 #}) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"bes:maj13.11" = \markup {
  \fret-diagram-verbose #`(
    (place-fret 6 6 ,#{ \markup \fontsize #-4 1 #})
    (mute 5)
    (place-fret 4 7 ,#{ \markup \fontsize #-4 7 #})
    (place-fret 3 7 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 2 8 ,#{ \markup \fontsize #-4 13 #})
    (place-fret 1 8 ,#{ \markup \fontsize #-4 9 #}) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"bes:6" = \markup {
  \fret-diagram-verbose #`(
    (place-fret 6 6 ,#{ \markup \fontsize #-4 1 #})
    (mute 5)
    (place-fret 4 5 ,#{ \markup \fontsize #-4 6 #})
    (place-fret 3 7 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 2 6 ,#{ \markup \fontsize #-4 5 #})
    (mute 1) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"bes:6.9" = \markup {
  \fret-diagram-verbose #`(
    (place-fret 6 6 ,#{ \markup \fontsize #-4 1 #})
    (place-fret 5 5 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 4 5 ,#{ \markup \fontsize #-4 6 #})
    (place-fret 3 5 ,#{ \markup \fontsize #-4 9 #})
    (place-fret 2 6 ,#{ \markup \fontsize #-4 5 #})
    (mute 1) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"bes:6.9.11+.13/d" = \markup {
  \fret-diagram-verbose #`(
    (mute 6)
    (place-fret 5 5 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 4 5 ,#{ \markup \fontsize #-4 6 #})
    (place-fret 3 5 ,#{ \markup \fontsize #-4 9 #})
    (place-fret 2 5 ,#{ \markup \fontsize #-4 \with-sharp 11 #})
    (place-fret 1 5 ,#{ \markup \fontsize #-4 13 #}) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%
"bes:6.9.13/g" = \markup {
  \fret-diagram-verbose #`(
    (mute 6)
    (mute 5)
    (place-fret 4 5 ,#{ \markup \fontsize #-4 6 #})
    (place-fret 3 5 ,#{ \markup \fontsize #-4 9 #})
    (place-fret 2 3 ,#{ \markup \fontsize #-4 3 #})
    (place-fret 1 5 ,#{ \markup \fontsize #-4 13 #}) 
    ) }
%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score { <<
\chords {
c1:maj7
c:maj9
c:maj11+
c:maj13.11+
c:6.9
c:6.9.11+
bes:maj7
bes:maj9
bes:maj9/bes
bes:maj11+
bes:maj11+/a
bes:maj13.11
bes:6
bes:6.9
bes:6.9.11+.13/d
bes:6.9.13/g
}
%%%
\new Staff { \clef "treble"
<c' g' b' e''>1^\"c:maj7"
<c' e' b' d''>^\"c:maj9"
<c' e' b' d'' fis''>^\"c:maj11+"
<c' fis' b' e'' a''>^\"c:maj13.11+"\break
<c' e' a' d'' g''>^\"c:6.9"
<c' e' a' d'' fis''>^\"c:6.9.11+"
<bes a' d'' f''>^\"bes:maj7"
<bes a' c'' d''>^\"bes:maj9"
<bes a' d'' f'' c'''>^\"bes:maj9/bes" \break
<bes a' d'' e''>^\"bes:maj11+"
<a' d'' e'' c'''>^\"bes:maj11+/a"
<bes a' d'' g'' c'''>^\"bes:maj13.11"
<bes g' d'' f''>^\"bes:6" \break
<bes d' g' c'' f''>^\"bes:6.9"
<d' g' c'' e'' a''>^\"bes:6.9.11+.13/d"
<g' c'' d'' a''>^\"bes:6.9.13/g"
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
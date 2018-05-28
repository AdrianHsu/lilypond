\version "2.18.2"
\pointAndClickOff

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
\score { <<
\chords {
c1:maj7
c:maj9
c:maj9

}
%%%
\new Staff { \clef "treble"
<c' g' b' e''>1^\"c:maj7"
<c' e' b' d''>^\"c:maj9"
<c' e' b' d''>^\"c:maj9"

} >>
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
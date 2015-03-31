# Sergovia

Sergovia produces a list of all possible ways to play a chord on the guitar. It ranks them by their playability. It is primarily intented to be useful to two groups of musicians. The first is composers who do not play the guitar but want to write guitar music. The second is guitarists learning or arranging a new piece. I expect it to mostly be useful to classical musicians, but I hope it will sometimes be effective for other genres.

# Usage

```
  require 'sergovia'
  Sergovia::Chord.new('e2,b2,e3,g#3,b3,e4').fingerings
   => [#<Sergovia::Fingering:0x000001031b5fb8 @notes=[#<Sergovia::Note:0x0000010114a0d0 @fret=0, @string=6, @pitch=:e2>, #<Sergovia::Note:0x00000101148d70 @fret=2, @string=5, @pitch=:b2>, #<Sergovia::Note:0x000001011436e0 @fret=2, @string=4, @pitch=:e3>, #<Sergovia::Note:0x00000101142498 @fret=1, @string=3, @pitch=:"g#3">, #<Sergovia::Note:0x00000101140e90 @fret=0, @string=2, @pitch=:b3>, #<Sergovia::Note:0x0000010113ba08 @fret=0, @string=1, @pitch=:e4>], @playability=1.0>]
```

### Terms as they are used in this project (Lexicon)

* Chord
  * A collection of pitches played simultaneously 
* Voicing
  * The order in which notes are stacked for a given chord. For example, (c3,e3,g#3) is a block voicing of a C Major chord, and (e2,c3,g#3) is a different voicing of the same chord. Playing the exact same pitch at a location place on the guitar does not change the voicing. That would only change the fingering. Pitches need be moved to different octaves to change the voicing.
* Fingering
  * A specific way to play a voicing on a given instrument. For the guitar, this means the a grouping of pitch/string/fret/finger for each note in the chord. Sergovia does not currently attempt to say which finger should be used, so in this gem it is currently pitch/string/fret.
* Note
  * In this gem (but not in music theory in general) a Note is a combination of a pitch and the location it is played on the guitar. It is like a fingering, but for only one pitch, rathar than a whole chord.
* Pitch
  * The western music theory represention of a frequency. For example, e2
* Transcriber
  * Someone (or a ruby class) that prepares a piece of music for a specific instrument that differs from the one(s) it was originally composed for.

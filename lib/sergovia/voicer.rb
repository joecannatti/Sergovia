class Voicer

  attr_reader :tuning, :frets, :fretboard

  def initialize(tuning:[:e2, :a2, :d3, :g3, :b3, :e4], frets: 24)
    @tuning = tuning
    @frets = frets
    build_fretboard
  end

  def locations_for(pitch)
    locations = []
    fretboard.each_with_index do |string, string_num|
      string.each_with_index do |note, fret_num|
        if note == pitch
          locations << {string: string_num + 1, fret: fret_num}
        end
      end
    end
    locations
  end

  def increment(pitch)
    pitch_string = pitch.to_s.downcase
    match = /([a-z][#]?[b]?)([0-9])/.match(pitch_string)
    note = match[1].to_sym
    octave = match[2].to_i
    note = to_sharp_key_notation(note) 
    if note == :b
      octave += 1
    end
    res_note = pitch_inc_map[note]
    return :"#{res_note}#{octave}"
  end

  protected

  def to_sharp_key_notation(pitch)
    @to_sharp_key_notation_map ||= { 
      :bb => :'a#', 
      :db => :'c#', 
      :eb => :'d#', 
      :gb => :'f#', 
      :ab => :'g#'
    }
    @to_sharp_key_notation_map[pitch] || pitch
  end

  def pitch_inc_map
    @pitch_inc_map ||= { 
      :a => :'a#', 
      :'a#' => :b, 
      :b => :c, 
      :c => :'c#', 
      :'c#' => :d, 
      :d => :'d#', 
      :'d#' => :e, 
      :e => :f, 
      :f => :'f#', 
      :'f#' => :g, 
      :g => :'g#', 
      :'g#' => :a
    }
  end

  def build_fretboard
    @fretboard ||= @tuning.reverse.map  do |starting_pitch|
      (0..@frets - 1).inject([starting_pitch]) do |res, count|
        res << increment(res.last)
      end
    end
  end


end

class Voicer

  attr_reader :tuning, :frets, :fretboard

  def initialize(tuning:[:e2, :a2, :d3, :g3, :b3, :e4], frets: 24)
    @tuning = tuning
    @frets = frets
    build_fretboard
  end

  def voicings(pitch_sting)
    in_theory = theoretical_voicings(pitch_sting)
    in_theory.reject { |v| v.group_by { |h| h.string }.any? { |k,v| v.size > 1 } }
  end

  def theoretical_voicings(pitch_string)
    groups = pitch_string.split(",").map do |pitch|
      locations_for(pitch)
    end
    groups.first.product(*groups[1..-1])
  end

  def locations_for(pitch)
    original_pitch_name = pitch.to_sym
    pitch = to_sharp_key_notation(original_pitch_name)

    locations = []
    fretboard.each_with_index do |string, string_num|
      string.each_with_index do |note, fret_num|
        if note == pitch
          locations << Note.new(string: string_num + 1, fret: fret_num, pitch: original_pitch_name)
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
    pitch_str = pitch.to_s
    pitch_str.gsub!('bb','a#')
    pitch_str.gsub!('db', 'c#')
    pitch_str.gsub!('eb' , 'd#')
    pitch_str.gsub!('gb' , 'f#')
    pitch_str.gsub!('ab' , 'g#')
    pitch_str.to_sym
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

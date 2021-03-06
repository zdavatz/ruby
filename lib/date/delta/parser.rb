#
# DO NOT MODIFY!!!!
# This file is automatically generated by racc 1.4.5
# from racc grammer file "parser.ry".
#

require 'racc/parser'


class Date

  class Delta

    class Parser < Racc::Parser

module_eval <<'..end parser.ry modeval..idf2987de166', 'parser.ry', 42

  def lookup(str)
    t = str.downcase
    k = UNITS4KEY[t]
    return [:UNIT, k] if k
    return [:AND, nil] if t == 'and'
    return [:UNKNOWNWORD, nil]
  end

  def parse(str)
    @q = []
    until str.empty?
      case str
      when /\A\s+/
      when /\Ap\d+[ymdhsw]/i
	/\Ap(\d+y)?(\d+m)?(\d+d)?t?(\d+h)?(\d+m)?(\d+s)?(\d+w)?/i =~ str
	y, m, d, h, min, s, w =
	  [$1, $2, $3, $4, $5, $6, $7].collect{|x| x.to_i}
	y *= UNITS4KEY['years']
	m *= UNITS4KEY['months']
	d *= UNITS4KEY['days']
	h *= UNITS4KEY['hours']
	min *= UNITS4KEY['minutes']
	s *= UNITS4KEY['seconds']
	w *= UNITS4KEY['weeks']
	@q.push [:DURATION, y + m + d + h + min + s + w]
      when /\A\d+/
	@q.push [:DIGITS, $&.to_i]
      when /\A[a-z]+/i
	@q.push lookup($&)
      when /\A.|\n/
	@q.push [$&, $&]
      end
      str = $'
    end
    @q.push [false, false]
    do_parse
  end

  def next_token
    @q.shift
  end

..end parser.ry modeval..idf2987de166

##### racc 1.4.5 generates ###

racc_reduce_table = [
 0, 0, :racc_error,
 1, 16, :_reduce_none,
 1, 17, :_reduce_none,
 1, 17, :_reduce_none,
 3, 17, :_reduce_4,
 3, 17, :_reduce_5,
 3, 17, :_reduce_6,
 3, 17, :_reduce_7,
 3, 17, :_reduce_8,
 3, 17, :_reduce_9,
 3, 17, :_reduce_10,
 2, 17, :_reduce_11,
 2, 17, :_reduce_12,
 3, 17, :_reduce_13,
 2, 18, :_reduce_14,
 0, 20, :_reduce_15,
 1, 20, :_reduce_none,
 1, 19, :_reduce_none ]

racc_reduce_n = 18

racc_shift_n = 32

racc_action_table = [
    13,    14,    15,    16,    17,    18,    19,     4,    27,    23,
     8,     9,     1,     4,    25,     2,     8,     9,     1,     4,
    24,     2,     8,     9,     1,     4,    21,     2,     8,     9,
     1,     4,    11,     2,     8,     9,     1,     4,    26,     2,
     8,     9,     1,     4,   nil,     2,     8,     9,     1,     4,
   nil,     2,     8,     9,     1,   nil,   nil,     2,    13,    14,
    15,    16,    17,    18,    19,    13,    14,    15,    13,    14,
    15,    13,    14,    15,    13,    14,    15 ]

racc_action_check = [
    10,    10,    10,    10,    10,    10,    10,    17,    15,    10,
    17,    17,    17,    18,    13,    17,    18,    18,    18,     4,
    11,    18,     4,     4,     4,     1,     9,     4,     1,     1,
     1,     8,     3,     1,     8,     8,     8,    19,    14,     8,
    19,    19,    19,     0,   nil,    19,     0,     0,     0,    16,
   nil,     0,    16,    16,    16,   nil,   nil,    16,     5,     5,
     5,     5,     5,     5,     5,    30,    30,    30,    28,    28,
    28,    29,    29,    29,    31,    31,    31 ]

racc_action_pointer = [
    37,    19,   nil,    32,    13,    55,   nil,   nil,    25,    13,
    -3,    20,   nil,     4,    28,    -2,    43,     1,     7,    31,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    65,    68,
    62,    71 ]

racc_action_default = [
   -18,   -18,   -17,   -18,   -18,    -1,    -2,    -3,   -18,   -15,
   -18,   -18,   -12,   -18,   -18,   -18,   -18,   -18,   -18,   -18,
   -11,   -16,   -14,   -13,    32,   -10,    -8,    -9,    -4,    -5,
    -6,    -7 ]

racc_goto_table = [
     5,    10,     3,    22,    12,   nil,   nil,   nil,    20,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,    28,    29,    30,    31 ]

racc_goto_check = [
     2,     2,     1,     5,     2,   nil,   nil,   nil,     2,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,     2,     2,     2,     2 ]

racc_goto_pointer = [
   nil,     2,     0,   nil,   nil,    -6 ]

racc_goto_default = [
   nil,   nil,   nil,     6,     7,   nil ]

racc_token_table = {
 false => 0,
 Object.new => 1,
 :UNARY => 2,
 "^" => 3,
 "*" => 4,
 "/" => 5,
 "+" => 6,
 "," => 7,
 :AND => 8,
 "-" => 9,
 :DIGITS => 10,
 "(" => 11,
 ")" => 12,
 :UNIT => 13,
 :DURATION => 14 }

racc_use_result_var = true

racc_nt_base = 15

Racc_arg = [
 racc_action_table,
 racc_action_check,
 racc_action_default,
 racc_action_pointer,
 racc_goto_table,
 racc_goto_check,
 racc_goto_default,
 racc_goto_pointer,
 racc_nt_base,
 racc_reduce_table,
 racc_token_table,
 racc_shift_n,
 racc_reduce_n,
 racc_use_result_var ]

Racc_token_to_s_table = [
'$end',
'error',
'UNARY',
'"^"',
'"*"',
'"/"',
'"+"',
'","',
'AND',
'"-"',
'DIGITS',
'"("',
'")"',
'UNIT',
'DURATION',
'$start',
'stmt',
'expr',
'time',
'iso',
'unit']

Racc_debug_parser = false

##### racc system variables end #####

 # reduce 0 omitted

 # reduce 1 omitted

 # reduce 2 omitted

 # reduce 3 omitted

module_eval <<'.,.,', 'parser.ry', 18
  def _reduce_4( val, _values, result )
result += val[2]
   result
  end
.,.,

module_eval <<'.,.,', 'parser.ry', 19
  def _reduce_5( val, _values, result )
result += val[2]
   result
  end
.,.,

module_eval <<'.,.,', 'parser.ry', 20
  def _reduce_6( val, _values, result )
result += val[2]
   result
  end
.,.,

module_eval <<'.,.,', 'parser.ry', 21
  def _reduce_7( val, _values, result )
result -= val[2]
   result
  end
.,.,

module_eval <<'.,.,', 'parser.ry', 22
  def _reduce_8( val, _values, result )
result *= val[2]
   result
  end
.,.,

module_eval <<'.,.,', 'parser.ry', 23
  def _reduce_9( val, _values, result )
result /= val[2]
   result
  end
.,.,

module_eval <<'.,.,', 'parser.ry', 24
  def _reduce_10( val, _values, result )
result **= val[2]
   result
  end
.,.,

module_eval <<'.,.,', 'parser.ry', 25
  def _reduce_11( val, _values, result )
result = -val[1]
   result
  end
.,.,

module_eval <<'.,.,', 'parser.ry', 26
  def _reduce_12( val, _values, result )
result = +val[1]
   result
  end
.,.,

module_eval <<'.,.,', 'parser.ry', 27
  def _reduce_13( val, _values, result )
result =  val[1]
   result
  end
.,.,

module_eval <<'.,.,', 'parser.ry', 30
  def _reduce_14( val, _values, result )
result = val[0] * val[1]
   result
  end
.,.,

module_eval <<'.,.,', 'parser.ry', 33
  def _reduce_15( val, _values, result )
result = 1
   result
  end
.,.,

 # reduce 16 omitted

 # reduce 17 omitted

 def _reduce_none( val, _values, result )
  result
 end

    end   # class Parser

  end   # class Delta

end   # class Date

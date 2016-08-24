require_relative 'currencyconvert'

class ParseUtil < ConvertCurrency
  def initialize
  end
  def parse_user_input
    input_string_multp_currency_hash = {}
    input_string_currency_hash = {}
    1.times do
      input_string = gets.chomp
      if /^([a-zA-Z0-9])+\s+is\s+([a-zA-Z0-9]){1}$/ =~ input_string   # for input string type glob is I
        matchdata = input_string.match(/([^>]*) is ([^>]*)/)
        input_string_currency_hash[matchdata[1]] = matchdata[2]
      end
      if /^([a-zA-Z0-9])+\s([a-zA-Z0-9])+\s([a-zA-Z0-9])+\s+is\s+([0-9])+\sCredits$/ =~ input_string   # for input string type glob glob Silver is 34 Credits
        matchdata = input_string.match(/([^>]*) ([^>]*) ([^>]*) is ([^>]*) Credits/)
        temp =  input_string_currency_hash[matchdata[1]].to_s.concat(input_string_currency_hash[matchdata[2]].to_s)
        integer_value = roman_to_integer temp
        input_string_multp_currency_hash[matchdata[3]] = matchdata[4].to_i/integer_value
      end
    end
    p input_string_multp_currency_hash
    #p $roman_values
    #puts "Doom"
  end
end

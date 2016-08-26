require_relative 'currencyconvert'

class ParseUtil < ConvertCurrency
  def initialize
  end
  def parse_user_input (input_file, output_file)
    input_string_multp_currency_hash = {}
    input_string_currency_hash = {}
    line_num=0

    #text.each_line do |line|
      #print line
    #end
    input_file.each_line do |line|
      input_string = line.gsub("\n",'')
      print line
      # for input string type glob is I
      if /^([a-zA-Z0-9])+\s+is\s+([a-zA-Z0-9]){1}$/ =~ input_string
        matchdata = input_string.match(/([^>]*) is ([^>]*)/)
        input_string_currency_hash[matchdata[1]] = matchdata[2]
        #p input_string_currency_hash
      # for input string type glob glob Silver is 34 Credits
    elsif /^([a-zA-Z0-9])+\s([a-zA-Z0-9])+\s([a-zA-Z0-9])+\s+is\s+([0-9])+\sCredits$/ =~ input_string
        matchdata = input_string.match(/([^>]*) ([^>]*) ([^>]*) is ([^>]*) Credits/)
        temp =  (input_string_currency_hash[matchdata[1]].to_s) + (input_string_currency_hash[matchdata[2]].to_s)
        integer_value = roman_to_integer temp
        input_string_multp_currency_hash[matchdata[3]] = matchdata[4].to_i/integer_value
        #p input_string_multp_currency_hash
      # for input string type how much is pish tegj glob glob ?
    elsif /^how much is\s([a-zA-Z0-9]+)\s([a-zA-Z0-9]+)\s([a-zA-Z0-9]+)\s([a-zA-Z0-9]+)\s\?$/ =~ input_string
        matchdata = input_string.match(/how much is ([^>]*) ([^>]*) ([^>]*) ([^>]*) ([^>]*) ?/)
        temp = (input_string_currency_hash[matchdata[1]].to_s) + (input_string_currency_hash[matchdata[2]].to_s) + (input_string_currency_hash[matchdata[3]].to_s) + (input_string_currency_hash[matchdata[4]].to_s)
        integer_value = roman_to_integer temp
        #pish tegj glob glob is 42
        output = (matchdata[1]) + (' ') + (matchdata[2]) + (' ') + (matchdata[3]) + (' ') + (matchdata[4]) + (' is ') + (integer_value.to_s) + ("\n")
        output_file << output
      #how many Credits is glob prok Iron ?
    elsif /^how many Credits is\s([a-zA-Z0-9]+)\s([a-zA-Z0-9]+)\s([a-zA-Z0-9]+)\s\?$/ =~ input_string
        matchdata = input_string.match(/how many Credits is ([^>]*) ([^>]*) ([^>]*) ([^>]*) ?/)
        temp = (input_string_currency_hash[matchdata[1]].to_s) + (input_string_currency_hash[matchdata[2]].to_s)
        integer_value = roman_to_integer temp
        calculated_value = integer_value * input_string_multp_currency_hash[matchdata[3]]
        #glob prok Silver is 68 Credits
        output = (matchdata[1]) + (' ') + (matchdata[2]) + (' ') + (matchdata[3]) + (' is ') + (calculated_value.to_s) + (" Credits \n")
        output_file << output
      else
        output_file<< "I have no idea what you are talking about \n "
      end
    end
  end
end

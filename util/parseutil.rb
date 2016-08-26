require_relative 'currencyconvert'

class ParseUtil < ConvertCurrency
  def initialize
  end

  def parse_user_input(input_file, output_file, _conf, log)
    input_string_multp_currency_hash = {}
    input_string_currency_hash = {}
    input_file.each_line do |line|
      input_string = line.delete("\n")
      # for input string type glob is I
      if /^([a-zA-Z0-9])+\s+is\s+([a-zA-Z0-9]){1}$/ =~ input_string
        matchdata = input_string.match(/([^>]*) is ([^>]*)/)
        input_string_currency_hash[matchdata[1]] = matchdata[2]
      # for input string type glob glob Silver is 34 Credits
      elsif /^([a-zA-Z0-9])+\s([a-zA-Z0-9])+\s([a-zA-Z0-9])+\s+is\s+([0-9])+\sCredits$/ =~ input_string
        matchdata = input_string.match(/([^>]*) ([^>]*) ([^>]*) is ([^>]*) Credits/)
        if input_string_currency_hash[matchdata[1]] && input_string_currency_hash[matchdata[2]]
          temp = input_string_currency_hash[matchdata[1]].to_s + input_string_currency_hash[matchdata[2]].to_s
          integer_value = roman_to_integer temp
          if integer_value
            input_string_multp_currency_hash[matchdata[3]] = matchdata[4].to_i / integer_value if integer_value
          else
            log.info 'roman validation failed'
          end
        else
          log.info 'currency conversion being called before assigning conversion value'
        end
      # for input string type how much is pish tegj glob glob ?
      elsif /^how much is\s([a-zA-Z0-9]+)\s([a-zA-Z0-9]+)\s([a-zA-Z0-9]+)\s([a-zA-Z0-9]+)\s\?$/ =~ input_string
        matchdata = input_string.match(/how much is ([^>]*) ([^>]*) ([^>]*) ([^>]*) ([^>]*) ?/)
        if input_string_currency_hash[matchdata[1]] && input_string_currency_hash[matchdata[2]] && input_string_currency_hash[matchdata[3]] && input_string_currency_hash[matchdata[4]]
          temp = input_string_currency_hash[matchdata[1]].to_s + input_string_currency_hash[matchdata[2]].to_s + input_string_currency_hash[matchdata[3]].to_s + input_string_currency_hash[matchdata[4]].to_s
          integer_value = roman_to_integer temp
          if integer_value
            # output type pish tegj glob glob is 42
            output = (matchdata[1]) + ' ' + (matchdata[2]) + ' ' + (matchdata[3]) + ' ' + (matchdata[4]) + ' is ' + integer_value.to_s + "\n"
            output_file << output
          else
            log.info 'roman validation failed'
          end
        else
          log.info 'currency conversion being called before assigning conversion value'
        end
      # for input string type how many Credits is glob prok Iron ?
      elsif /^how many Credits is\s([a-zA-Z0-9]+)\s([a-zA-Z0-9]+)\s([a-zA-Z0-9]+)\s\?$/ =~ input_string
        matchdata = input_string.match(/how many Credits is ([^>]*) ([^>]*) ([^>]*) ([^>]*) ?/)
        if input_string_currency_hash[matchdata[1]] && input_string_currency_hash[matchdata[2]] && input_string_multp_currency_hash[matchdata[3]]
          temp = input_string_currency_hash[matchdata[1]].to_s + input_string_currency_hash[matchdata[2]].to_s
          integer_value = roman_to_integer temp
          if integer_value
            calculated_value = integer_value * input_string_multp_currency_hash[matchdata[3]]
            # output type glob prok Silver is 68 Credits
            output = (matchdata[1]) + ' ' + (matchdata[2]) + ' ' + (matchdata[3]) + ' is ' + calculated_value.to_s + " Credits \n"
            output_file << output
          else
            log.info 'roman validation failed'
          end
        else
          log.info 'currency conversion being called before assigning conversion value'
        end
      else
        log.info 'I have no idea what you are talking about'
        output_file << "I have no idea what you are talking about \n"
      end
    end
  end
end

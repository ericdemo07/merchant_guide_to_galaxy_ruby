require_relative 'romanvalidation'

class ConvertCurrency < Validate
  def initialize
    #is a constant and can get global access
    $roman_values = {
			"I" => 1,
			"V" => 5,
			"X" => 10,
			"L" => 50,
			"C" => 100,
			"D" => 500,
			"M" => 1000
			}
  end
  def roman_to_integer inputstring
    unless validate_input inputstring
      sum = false
      sum
    else
      temp = 1001
  		sum = 0
  		count = 0
      chars = inputstring.split('')
      chars.each do |c|
        if temp < $roman_values[c]
          sum = sum - 2*temp + $roman_values[c]
        else
          sum = sum + $roman_values[c]
        end
        temp = $roman_values[c]
      end
      sum
    end
  end
end

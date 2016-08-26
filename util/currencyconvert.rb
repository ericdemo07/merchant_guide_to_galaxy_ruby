require_relative 'romanvalidation'

class ConvertCurrency < Validate
  def initialize
    # is a constant and can get global access
    $roman_values = {
      'I' => 1,
      'V' => 5,
      'X' => 10,
      'L' => 50,
      'C' => 100,
      'D' => 500,
      'M' => 1000
    }
  end

  def roman_to_integer(inputstring)
    if validate_input inputstring
      temp = 1001
      sum = 0
      count = 0
      chars = inputstring.split('')
      chars.each do |c|
        sum = if temp < $roman_values[c]
                sum - 2 * temp + $roman_values[c]
              else
                sum + $roman_values[c]
              end
        temp = $roman_values[c]
      end
      sum
    else
      sum = false
      sum
    end
  end
end

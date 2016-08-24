class ConvertCurrency
  def initialize
    @roman_values = {
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
    temp = 1001
		sum = 0
		count = 0
    chars = inputstring.split('')
    chars.each do |c|
      unless @roman_values.has_key? c
        p "Error wrong roman numeral value entered #{c} will skip"
      end
      if temp < @roman_values[c]
        sum = sum - 2*temp + @roman_values[c]
      else
        sum = sum + @roman_values[c]
      end
      temp = @roman_values[c]
    end
    puts "Value for roman numeral #{inputstring} is #{sum}"
  end
end

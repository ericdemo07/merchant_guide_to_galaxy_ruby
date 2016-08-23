class Conversion_Initiator
	def initialize
		roman_values = {
			"I" => 1,
			"V" => 5,
			"X" => 10,
			"L" => 50,
			"C" => 100,
			"D" => 500,
			"M" => 1000
			}
#TODO:should be printed before chomp
		#print "Enter A"


		temp = 1001
		sum = 0  #to hold value
		count = 0
		input = gets.chomp

		#for input validation IXCM will not appear more than 3 time and DLV will not appear more ten once
		#TODO: has to be done once
		unless /([IXCM])\1{2}/ =~ input || /([DLV])\1{1}/ =~ input
			p "Validation success for input roman numeral #{input}"
		else
			p "Validation failed for input string"
		end

		chars = input.split('')
		# have to find a better implemenation
		chars.each do |c|
			unless roman_values.has_key? c
				p "Error wrong roman numeral value entered #{c} will skip"
			end
			if temp < roman_values[c]
				sum = sum - 2*temp + roman_values[c]
			else
				sum = sum + roman_values[c]
			end
			temp = roman_values[c]
		end
		puts "Value for roman numeral #{input} is #{sum}"
	end
end
Conversion_Initiator.new

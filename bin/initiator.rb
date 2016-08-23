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
#should be printed before chomp
		#print "Enter A"
		a = gets.chomp
		chars = a.split('')
		chars.each do |c|
			unless roman_values.has_key? c
				puts "Error wrong value printed"
			end
			#p roman_values.has_key? c
			p roman_values[c]
		end
		#puts chars.length
	end
end
Conversion_Initiator.new

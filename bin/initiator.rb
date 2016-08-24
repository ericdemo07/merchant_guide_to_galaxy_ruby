Dir[File.dirname(__FILE__) + '/../util/*.rb'].each {|file| require file } #will load all files under util directory

class Conversion_Initiator
	def initialize
	end
	def process
		input_string = gets.chomp
		flag_input_validate = Validate.new
		currency_convert_object = ConvertCurrency.new
		if flag_input_validate.validate_input input_string
			currency_convert_object.roman_to_integer input_string
		else
			p "Wrong input"
		end
	end
end
object = Conversion_Initiator.new
object.process

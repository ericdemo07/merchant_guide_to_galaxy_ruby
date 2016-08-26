Dir[File.dirname(__FILE__) + '/../util/*.rb'].each {|file| require file } #will load all files under util directory

class Conversion_Initiator
	def initialize
	end
	def process
		#input_string = gets.chomp
		flag_input_validate = Validate.new
		currency_convert_object = ConvertCurrency.new
		parse_util_object = ParseUtil.new
		#if flag_input_validate.validate_input input_string
			#currency_convert_object.roman_to_integer input_string
		#else
		#	p "Wrong input"
		#end
		input_file = File.open('../input/sample_input.txt').read
		output_file = File.open( '../output/output.txt',"w" )
    input_file.gsub!(/\r\n?/, "\n")
		parse_util_object.parse_user_input(input_file, output_file)
		output_file.close
	end
end
object = Conversion_Initiator.new
object.process

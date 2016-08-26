require 'yaml'
require 'logger'
Dir[File.dirname(__FILE__) + '/../util/*.rb'].each {|file| require file } #will load all files under util directory

class Conversion_Initiator
	def initialize
	end
	def process
		time = Time.new
		conf = YAML.load_file(File.expand_path('../conf/local.yml', File.dirname(__FILE__)))
		logname = conf['logpath'] + time.strftime('%Y%m%d')
		logpath = File.expand_path(logname, File.dirname(__FILE__))
		log = Logger.new logpath
    log.info '__start Merchants Guide to the Galaxy__'
		flag_input_validate = Validate.new
		currency_convert_object = ConvertCurrency.new
		parse_util_object = ParseUtil.new
		unless File.file?(File.expand_path(conf['path']['input_file'], File.dirname(__FILE__)))
			log.info "input file does not exist"
		else
			begin
				input_file = File.open(File.expand_path(conf['path']['input_file'], File.dirname(__FILE__))).read
				output_file = File.open(File.expand_path(conf['path']['output_file'], File.dirname(__FILE__)),"w" )
    		input_file.gsub!(/\r\n?/, "\n")
				parse_util_object.parse_user_input(input_file, output_file, conf, log)
			rescue Exception => msg
				log.info "following exception occoured #{msg}"
			ensure
				log.info '__end Merchants Guide to the Galaxy__'
				log.info ' '
				log.info ' '
				output_file.close
			end
		end
	end
end
object = Conversion_Initiator.new
object.process

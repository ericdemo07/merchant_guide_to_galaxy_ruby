class Validate
  def initialize
  end
  def validate_input inputstring
    flag = false
    if /^M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/ =~ inputstring
      flag = true
    end
    flag
    # other way TODO: to be removed
    #unless /([IXCM])\1{3}/ =~ input || /([DLV])\1{1}/ =~ input
    #	p "Validation success for input roman numeral #{input}"
    #else
    #	p "Validation failed for input string"
    #end
  end
end

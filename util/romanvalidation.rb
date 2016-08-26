class Validate
  def initialize
  end

  def validate_input(inputstring)
    flag = false
    if /^M{0,3}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/ =~ inputstring
      flag = true
    end
    flag
  end
end

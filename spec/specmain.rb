require_relative '../util/currencyconvert'

RSpec.describe ConvertCurrency do
  context 'test conversion' do
    currency_convert_object = ConvertCurrency.new
    it 'roman_to_integer1' do
      expect(currency_convert_object.roman_to_integer("MCMXLIV")).to eq 1944
    end
    it 'roman_to_integer2' do
      expect(currency_convert_object.roman_to_integer("MMMM")).to eq false
    end
    it 'roman_to_integer3' do
      expect(currency_convert_object.roman_to_integer("DDI")).to eq false
    end
  end
end

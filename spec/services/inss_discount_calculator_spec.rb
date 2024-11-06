require 'rails_helper'

RSpec.describe InssDiscountCalculator do
  it "calcula corretamente o desconto para salários até R$ 1.045,00" do
    calculator = InssDiscountCalculator.new(1045.00)
    expect(calculator.call).to eq(78.38)
  end

  it "calcula corretamente o desconto para salários entre R$ 1.045,01 e R$ 2.089,60" do
    calculator = InssDiscountCalculator.new(2000.00)
    expect(calculator.call).to eq(164.33)
  end

  it "calcula corretamente o desconto para salários entre R$ 2.089,60 e R$ 3.134,40" do
    calculator = InssDiscountCalculator.new(3000.00)
    expect(calculator.call).to eq(254.33)
  end

  it "calcula corretamente o desconto para salários entre R$ 3.134,40 e R$ 6.101,06" do
    calculator = InssDiscountCalculator.new(5500.00)
    expect(calculator.call).to eq(550.29)
  end

  it "calcula corretamente o desconto para salários acima de R$ 6.101,06" do
    calculator = InssDiscountCalculator.new(8000.00)
    expect(calculator.call).to eq(884.91)
  end
end
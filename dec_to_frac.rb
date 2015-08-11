class Decimal
  def initialize (dec)
    @dec_str = dec
    
    if @dec_str.split(".")[1].nil?
      @precision = 0
    else
      @precision = @dec_str.split(".")[-1].size
    end
    @dec_num = @dec_str.split(".").join.to_i
    @dec_den = 10**@precision
  end
  
  def test (frac)
    dec = frac.numerator.to_f / frac.denominator
    @dec_str == "%0.#{@precision}f" % dec.round(@precision)
  end
  
  def build (whole)
    num, den = 1, 0
    whole.reverse_each do |n|
      num, den = den, num
      num += den * n
    end
    Rational(num, den)
  end
  
  def to_frac
    whole = []
    num = @dec_num
    den = @dec_den
    
    while true
      whole << num/den  # Division by integers should return integer
      num = num % den
      
      if test(build(whole))
        break
      end
      
      num, den = den, num
    end
    
    built = build(whole)
  end
end

def test_decimal
  puts Decimal.new("1.857").to_frac == Rational(13, 7)
  puts Decimal.new("0.5384615385").to_frac == Rational(7, 13)
  puts Decimal.new("1.6180340557").to_frac == Rational(4181, 2584)
  puts Decimal.new("0.61803396").to_frac == Rational(2584, 4181)
  puts Decimal.new("10").to_frac == Rational(10, 1)
  puts Decimal.new("0").to_frac == Rational(0, 1)
  puts Decimal.new("0.00").to_frac == Rational(0, 1)
  puts Decimal.new("10.000").to_frac == Rational(10, 1)
end

test_decimal
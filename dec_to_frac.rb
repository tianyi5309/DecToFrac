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
    dec = (frac[1].numerator.to_f / frac[1].denominator) ** (1.0/frac[0])
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
  
  def to_frac (num_terms) # Can return more than num_terms if multiple steps terminate
    returned = 0
    ans = []
    stage = 0
    todo = []
    whole = []
    num = []
    den = []
    while returned < num_terms  # Dovetails through different powers
      # Init new number
      todo << stage
      whole << []
      num << @dec_num ** (stage+1)
      den << @dec_den ** (stage+1)
      
      # Loop through each number and apply operation
      todo.each do |n|
        whole[n] << num[n] / den[n]
        num[n] = num[n] % den[n]
        
        built = [n+1, build(whole[n])]
        if test(built)
          ans << built
          returned += 1
          todo.delete(n)
          next
        end
        
        num[n], den[n] = den[n], num[n]
      end
      stage += 1
    end
    ans
  end
end

#def test_decimal
#  p Decimal.new("1.857").to_frac(1) # 13/7
#  p Decimal.new("0.538").to_frac(1) # 7/13
#  p Decimal.new("1.6180340557").to_frac(1) # 4181/2584
#  p Decimal.new("0.6180339632").to_frac(1) # 2584/4181
#  p Decimal.new("10").to_frac(1) # 10/1
#  p Decimal.new("0").to_frac(1) # 0/1
#  p Decimal.new("0.00").to_frac(1) # 0/1
#  p Decimal.new("10.000").to_frac(1) # 10/1
#  p Decimal.new("1.41").to_frac(1) # sqrt 2
#  p Decimal.new("1.73").to_frac(1) # sqrt 3
#  p Decimal.new("1.26").to_frac(1) # cbrt 2
#  p Decimal.new("1.442").to_frac(1) # cbrt 3
#  p Decimal.new("1.1224620").to_frac(5) # 2**(1/6)
#  p Decimal.new("1.2009").to_frac(5) # 3**(1/6)
#end
#
#test_decimal
#
#n = 0
#while n < 10000
#  puts "0." + n.to_s + "\t" + Decimal.new("0.#{n}").to_frac(1).inspect
#  n += 1
#end
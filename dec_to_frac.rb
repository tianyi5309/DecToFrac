class Decimal
  def initialize (dec)
    @dec_str = dec
    @dec = @dec_str.to_f
    
    @precision = @dec_str.split(".")[-1].size
  end
  
  def test (frac)
    dec = frac[0].to_f / frac[1]
    @dec_str == "%0.#{@precision}f" % dec.round(@precision)
  end
  
  def build (whole)
    num, den = 1, 0
    whole.reverse_each do |n|
      num, den = den, num
      num += den * n
    end
    [den, num]
  end
  
  def to_frac
    whole = []
    dec = @dec
    
    cont = true
    uncertain = 0.1**@precision / 2
    while true
      if dec >= 1
        whole << dec.to_i
        dec = dec % 1
      end
      
      uncertain_perc = uncertain / dec
      
      if dec.abs < 2*uncertain && test(build(whole))
        break
      end
      
      dec = 1/dec
      
      uncertain = uncertain_perc * dec
    end
    
    built = build(whole)
    Rational(built[0], built[1])
  end
end

test = Decimal.new(ARGV[0])
puts test.to_frac
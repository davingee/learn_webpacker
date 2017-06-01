class Fun
  
  def self.fib_memo(n, memo)
    # puts n
    # n_1 = fib_memo(n-1, memo)
    # n_2 = fib_memo(n-2, memo)
    # puts n_1
    # puts n_2
    # puts n_1 + n_2
    # memo[n] ||= n_1 + n_2
    memo[n] ||= fib_memo(n-1, memo) + fib_memo(n-2, memo)
    puts memo
    puts '-----------------------------------'
    memo[n]
  end

  def self.fib(n)
    raise "fib not defined for negative numbers" if n < 0
    fib_memo(n, [0, 1])
  end

  def self.timer
    n = Time.now
    yield
    puts "#{(Time.now - n) * 1_000}ms"
  end

  timer { fib(42) } # 0.013ms on my laptop

end

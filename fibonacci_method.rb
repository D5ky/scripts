require 'terminal-table'

a, b, e, i, n = -4.0, 1.0, 0.001, 0, 10

def f x
	Math.sin(x)**2 + x / 3
end

# Метод Фибоначчи
# Fibonacci method
def fibonacci n
  a, b = 0, 1
  (1..n).each{|_| a, b = b, a + b}
  a
end

fib = Array.new(n + 3){ |n| fibonacci(n) }.drop(1)

x1 = a + fib[n - 2] * (b - a) / fib[n]
y1 = f x1
x2 = a + fib[n - 1] * (b - a) / fib[n]
y2 = f x2

table = Terminal::Table.new :title => "Fibonacci method", :headings => ['№', 'a', 'b', 'x', 'f(x)'] do |t|
	(n - 1).downto 2 do |i|
	  if y1 < y2
	    b = x2
	    x2 = x1
	    y2 = f x1
	    x1 = a + fib[i - 2] * (b - a) / fib[i]
	    y1 = f x1
	    t.add_row [n - i, a, b, x1, f(x1)]
      	t.add_separator
	  else
	    a = x1
	    x1 = x2
	    y1 = y2
	    x2 = a + fib[i - 1] * (b - a) / fib[i]
	    y2 = f x2
	    t.add_row [n - i, a, b, x1, f(x1)]
      	t.add_separator
	  end
	end
end

puts table
require 'terminal-table'

a, b, e, i = -4.0, 1.0, 0.001, 0

def f x
	Math.sin(x)**2 + x / 3
end

# Метод дихонтомии
# dichotomy method
table = Terminal::Table.new :title => "Dichotomy method", :headings => ['№', 'a', 'b', 'x', 'f(x)'] do |t|
	while (b - a).abs > e do
    x = (a + b) / 2
    if f(a) * f(x) < 0
      b = x
      t.add_row [i += 1, a, b, x, f(x)]
      t.add_separator
    else
      a = x
      x = ( a + b ) / 2
      t.add_row [i += 1, a, b, x, f(x)]
      t.add_separator
    end
	end
end

puts table
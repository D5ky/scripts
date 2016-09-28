require 'terminal-table'

a, b, e, i, k = -4.0, 1.0, 0.001, 0, 0.618

def f x
	Math.sin(x)**2 + x / 3
end

# Метод золотого сечения
# golden section method
x1 = a + (b - a) * (1 - k)
y1 = f x1
x2 = a + (b - a) * k
y2 = f x2

table = Terminal::Table.new :title => "Golden section method", :headings => ['№', 'a', 'b', 'x', 'f(x)'] do |t|
	while (b - a).abs > e do
	  if y1 > y2
	    a = x1
	    x1 = x2
	    x2 = a + (b - a) * k
	    y1 = y2
	    y2 = f x2
	    t.add_row [i += 1, a, b, x1, f(x1)]
      	t.add_separator
	  else
	    b = x2
	    x2 = x1
	    x1 = a + (b - a) * (1 - k)
	    y2 = y1
	    y1 = f x1
	    t.add_row [i += 1, a, b, x1, f(x1)]
      	t.add_separator
	  end
	end
end

puts table
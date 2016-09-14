n= ARGV[0].to_i
rows = n + 1
columns = (n + 1) * n / 2

# puts "generating code for #{rows} rows"

def b(n)
  rows = []
  (1..n).each do |i|
    row = Array.new
    (1..n).each do |j|
       row.push (i == j ? "B" : "_")
    end
    rows.push row
  end

  rows
end

def v(n)
  if n == 1 then [["A"], ["B"]]
  else
    rows = []

    first_row = Array.new(n, "A")
    ((n - 1) * n / 2).times { first_row.push "_" }
    rows.push first_row

    b_n = b(n)
    v_n_1 = v(n - 1)

    (1..n).each do |i|
      rows.push (b_n[i-1] + v_n_1[i-1])
    end

    rows
  end
end

v_n = v(n)

# preamble
puts %q[
sealed trait O
object A extends O
object B extends O

object Test {

  def f(x: O) = ]

puts ("  (" + ("x, " * (columns - 1)) + "x) match {")

(1..rows).each do |row|
  print "    case ("

  (1..columns).each do |column|
     print (v_n[row - 1][column - 1])
     print (column == columns ? "" : ", ")
  end

  puts ") => #{row}"
end

# last braces
puts %q[
  }
}
]
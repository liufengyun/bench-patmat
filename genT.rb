n = ARGV[0].to_i
ROWS = 2 * n
COLS = n

# puts "generating code for #{rows} rows"

def get
  matrix = []
  (1..ROWS).each do |i|
    row = Array.new
    (1..COLS).each do |j|
      if i % 2 == 0 then
         row.push (j < i / 2 ? "_" : "B")
      else
         row.push (j <  (i + 1) / 2  ? "_" : "A")
      end
    end
    matrix.push row
  end

  matrix
end

t_n = get

# preamble
puts %q[
sealed trait O
object A extends O
object B extends O

object Test {

  def f(x: O) = ]

puts ("  (" + ("x, " * (COLS - 1)) + "x) match {")

(1..ROWS).each do |row|
  print "    case ("

  (1..COLS).each do |column|
     print (t_n[row - 1][column - 1])
     print (column == COLS ? "" : ", ")
  end

  puts ") => #{row}"
end

# last braces
puts %q[
  }
}
]
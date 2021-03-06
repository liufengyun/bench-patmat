# series S

# unfortunately, Scala only support at most 22 tuples

rows = ARGV[0].to_i
columns = rows * 2

# puts "generating code for #{rows} rows"

# preamble
puts %q[
sealed trait O
object A extends O
object B extends O

object Test {

  def test(x: O) = ]

puts ("  (" + ("x, " * (columns - 1)) + "x) match {")

(1..rows).each do |row|
  print "    case ("
    (1..columns).each do |column|
        print ((column + 1) / 2 == row ? "A" : "_")
        print (column == columns ? "" : ", ")
    end
  puts ") => #{row}"
end

print "    case ("
  (1..columns).each do |column|
      print (column % 2 == 0 ? "A" : "B")
      print (column == columns ? "" : ", ")
  end
puts ") => #{rows + 1}"

puts %q[
  }
}
]

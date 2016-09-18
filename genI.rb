n= ARGV[0].to_i

# preamble
puts "abstract sealed trait C"

(1..n).each do |i|
  puts "case object C#{i} extends C"
end

puts %q[
object Test {

  def test(c: C): Int = c match {]


(1..n).each do |i|
  puts "    case C#{i} => #{i}"
end

# last braces
puts %q[
  }
}
]

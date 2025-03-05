require_relative 'lib/hashmap'

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
test.set('big', 'sends')
test.set('huge', 'whipper')
test.set('free', 'solo')
test.set('grade', 'chaser')

test.set('grape', 'rocks')
#puts test.length

test.set('moon', 'silver')
#puts test.length
puts test.get('free') #solo
puts test.has?('big') #true
puts test.remove('jacket') #blue
puts test.length #16
print test.keys
puts '' 
print test.values
puts ''
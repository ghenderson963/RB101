produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce)
  result_hash = {}
  produce_keys = produce.keys 

  counter = 0
  loop do
    break if counter >= produce_keys.size

    if produce[produce_keys[counter]] == 'Fruit'
      result_hash[produce_keys[counter]] = produce[produce_keys[counter]]
    end
    counter += 1
    
  end
 result_hash
end

puts select_fruit(produce)

my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers(my_numbers)
  counter = 0

  loop do
    my_numbers[counter] = my_numbers[counter] * 2
    counter += 1
    break if counter >= my_numbers.size
  end
  my_numbers
end

puts double_numbers(my_numbers)
p my_numbers

arr = [1,2,3,4,5]
odds = arr.select do |num|
  num.odd?
end

=> [1, 3, 5]
arr
=> [1, 2, 3, 4, 5]

arr = [1,2,3,4,5]

arr.map do |num|
  num * 2
end

=> [2, 4, 6, 8, 10]
arr
 => [1, 2, 3, 4, 5]

 arr = [1,2,3,4,5]

 arr.any? do |num|
  num > 4
 end

 => True
 arr
 => [1, 2, 3, 4, 5]

 arr = [1,2,3,4,5]

 arr.all? do |num|
  num > 2
 end

 => false
 arr
 => [1, 2, 3, 4, 5]

 arr = ['gary','leah','bob', 'gerry']
 arr.each_with_index do |name, indx|
  puts "#{name}s index is #{indx}!"
 end

garys index is 0!
leahs index is 1!
bobs index is 2!
gerrys index is 3!
 => ["gary", "leah", "bob", "gerry"]

 hsh = { name: 'gary', dob: '09141971', address: '1192 SW Chestnut dr.'}

 hsh.each_with_object([]) do |pair, arr|
    arr << pair
  end

  => [[:name, "gary"], [:dob, "09141971"], [:address, "1192 SW Chestnut dr."]]

  hsh = { name: 'gary', dob: '09141971', address: '1192 SW Chestnut dr.'}
  hsh.first
  => [:name, "gary"]

  arr = [1,2,3,4,5]

  arr.partition do |num|
    num <= 3
  end

  => [[1, 2, 3], [4, 5]]


  hsh = { how: 'badly', why: 'dumb', when: 'tomorrow' }
  hsh.map do |key, value|
    if value.size > 4
      value
    end
  end
  => ["badly", nil, "tomorrow"]

  str = 'gary is the boss'
  str.scan('s')
  => ['s', 's', 's']

  arr = [1,1,1,2,3]
  arr.uniq
  => [1,2,3]

  arr = [1,2,3,4,5]

  arr.map { |num| num * 2 }
  => [2, 4, 6, 8, 10]

  arr
  => [1, 2, 3, 4, 5]

  arr = [[1,2],[4,6],[1,4]]
  arr.to_h
  => {1=>4, 4=>6}
  arr
  => [[1, 2], [4, 6], [1, 4]]

  arr1 # => ["A", "B", "C"] arr2 # => ["A", "B", "C"]

  arr1 = ["A", "B", "C"]
  arr2 = ["A", "B", "C"]

  num = 3.456754
  num.round(2)
  => 3.46
  num
   => 3.456754

   %[flags][width][.precision]type

   .49403
   format(%.3f,num)

   %[flags][width][.precision]type
   format("%20.3f",num)
   => "               0.494"

   str = 'gary henderson is great'
   => "gary henderson is great"
   str.sub('great', 'dumb')
   => "gary henderson is dumb"
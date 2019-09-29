# How Many?
Write a method that counts the number of occurrences of each element in a given array.

```rb
vehicles = [
	'car', 'car', 'truck', 'car', 'SUV', 'truck',
	'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurences(vehicles)
```

The words in the array are case-sensitive: `’suv’ != ‘SUV’`. Once counter, print each element alongside the number of occurrences

Expected output:

```
car => 4
truck => 3
SUV => 1
motorcycle => 2
```

```rb

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]


def count_occurences(array)
  array.uniq.each { |automobile| puts "#{automobile} => #{array.count(automobile)}"}
end

count_occurences(vehicles)
```

## Launch School Solution & Discussion
### Solution

```rb 
def count_occurences(array)
	occurences.each do |element|
	 occurences[element] = array.count(element)
end

occurences.each do |element, count|
	puts "#{element} => #{count}"
 end
end
```

### Discussion

As we iterate over each element, we create a new key-value pair in `occurences`, with the key as the element’s value. To count each occurrence, we use `Array#count` to count the number of elements with the same value.

Lastly, to print the desired output, we call `#each` on the newly created `occurences`, which lets us pass the keys and values as block parameters. Then, inside of the block, we invoke `#puts` to print each key-value pair.

### Further Exploration

Try to solve the problem when words are case insensitive, e.g. `”suv == “SUV”`

```rb
def count_occurences(array)
	array = array.map(&:downcase)
  puts array.map { |element| "#{element} => #{array.count(element)}" }.uniq
```
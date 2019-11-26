# Only Even
Using `next`, modify the code below so that it only prints even numbers.

```rb
number = 0

until number == 10 
  number += 1
  puts number 
end
```

### My Solution

```rb 
number = 0

until number == 10
  number += 1
	if number.odd? 
		next 
	else 
		puts number
	end
end
```

## Launch School Solution & Discussion
### Solution

```rb
number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end
```

### Discussion

Sometimes, when using a loop, you need to skip to the next iteration. That’s where `next` comes in. `next` lets you skip to the next iteration based on certain conditions. In this exercise, we use `next` to skip to the next iteration when `number` is odd. We can use the method `Integer#odd?` to evaluate `number` and return `true` if it’s an odd number.

### Further Exploration

Why did `next` have to be placed after the incrementation of `number` and before `#puts`?

There is a reason why `next` is strategically placed between the incrementation of `number` and `#puts`. We are working with an `until` loop in this problem with the conditional `number == 10`, meaning this loop will break once that condition is met upon each iteration. Outside of the loop, we have a counter (which is the `number` variable) that is initialized and upon each iteration we increment that number. If we had decided to put the `next` modifier on top of the code, it will only output 1 and then give us an infinite loop. However, after we place the `next` modifier after the incrementation, we’re able to skip over the integers that are odd and it would work like this under the hood:

```rb
# Each integer with a new line is an iteration

1 # number.odd? => true (will be skipped b/c of the next modifier)
2 # number.odd? => false (won't be skipped)
3 # number.odd? => true (will be skipped b/c of the next modifier)
4 # number.odd? => false (won't be skipped)
5 # number.odd? => true (will be skipped b/c of the next modifier)
6 # number.odd? => false (won't be skipped)
7 # number.odd? => true (will be skipped b/c of the next modifier)
8 # number.odd? => false (won't be skipped)
9 # number.odd? => true (will be skipped b/c of the next modifier)
10 # number.odd? => false (won't be skipped)
```

After the evaluations it will output the following results if it evaluated to false.
# When will I Retire?
Build a program that displays when the user will retire and how many years she has to work till retirement?

Example:

```
What is your age? 30
At what age would you like to retire?

It's 2016. You will retire in 2056.
You have only 40 years of work to go!
```

### My Solution

```rb 
CURRENT_YEAR = 2019

def prompt(message)
	puts "> #{message}"
end

prompt("What is your age?")
age = gets.chomp.to_i

prompt("At what age would you like to retire?")
retired_age = gets.chomp.to_i

years_to_go = (retired_age - age)

prompt("It's #{CURRENT_YEAR}. You will retire in #{CURRENT_YEAR + years_to_go}")
prompt("You have only #{years_to_go} years of work to go!")
```

## Launch School Solution & Discussion

### Approach / Algorithm

Use the `Time` class from the ruby core library.

### Solution

```rb
print 'What is your age? '
current_age = gets.to_i

print 'At what age would you like to retire? '
retirement_age = gets.to_i

current_year = Time.now.year
work_years_to_go = retirement_age - current_age
retirement_year = current_year + work_years_to_go

puts "It's #{current_year}. You will retire in #{retirement_year}. "
puts "You have only #{work_years_to_go} years of work to go!"
```

### Discussion

In this solution, we use `Time.now` to get the current date. This returns a `Time` object. The `Time` class has a fairly useful method, `Time#year` that gives us the current year. From there we can determine the retirement year based on the two inputs and the current year.

- - - -

### Refactoring my solution

```rb
CURRENT_YEAR = Time.now.year

def prompt(message)
	puts "> #{message}"
end
prompt("What is your age?")
age = gets.chomp.to_i

prompt("At what age would you like to retire?")
retired_age = gets.to_i

years_to_go = retired_age - age
retirement_year = CURRENT_YEAR + years_to_go

prompt("It's #{CURRENT_YEAR}. You will retire in #{retirement_year}")
prompt("You have only #{years_to_go} years of work to go!")
```
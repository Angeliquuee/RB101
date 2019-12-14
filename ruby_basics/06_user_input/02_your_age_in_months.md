# You Age in Months
Write a program that asks the user for their age in years, then converts that age into months.

Examples:

```
>> What is your age in years?
35
You are 420 months old.
```

### My Solution

```rb 
def prompt(message)
  puts ">> #{message}"
end

prompt("What is your age in years?")
user_age = gets.chomp.to_i
age_in_months = user_age * 12
prompt("You are #{age_in_months} months old.")
```

## Launch School Solution & Discussion
### Solution

```rb 
puts '>> What is your age in years?'
age_in_years = gets
age_in_months = 12 * age_in_years.to_i
puts "You are #{age_in_months} months old."
```

### Discussion

This solution is very similar to that of a previous exercise: we use `#puts` to display a prompt and output our results and use `#gets` to obtain a value from the user.

In addition, we need to perform a calculation on the input value. To accomplish this, we need to convert the input value (which is a String) to an Integer, which we do with the `#to_i` method. We then multiply the result by 12 to get the age in months.
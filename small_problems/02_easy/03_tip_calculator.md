# Tip calculator
Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

Example: 

```
What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0
```

```rb 
puts "=> Enter your bill number: "
bill = gets.chomp.to_i.to_f

puts "=> Please enter the tip percentage: "
tip_percentage = gets.chomp.to_i

conversion = (tip_percentage * 0.0100) # => 0.15 (this is based of example)
tip = (bill * conversion) # => 30 (this is based of example)
bill_total = (tip + bill)

puts "The tip is #{tip}"
puts "The total is #{bill_total}"
```

## Launch School Solution & Discussion

### Solution

```rb
print 'What is the bill? '
bill = gets.chomp
bill = bill.to_f

print 'What is the tip percentage? '
percentage = gets.chomp
percentage = percentage.to_f

tip = (bill * (percentage / 100)).round(2)
total = (bill + tip).round(2)

def format_me(integer)
 format("%.2f", 30.0) 
end

puts "The tip is #{tip}" 
puts "The total is #{total}"  
```

### Discussion

We first obtain the amount of the bill from the user, not worrying too much about data validity for this simple problem. Then we get the tip percentage.

Next, we calculate the actual tip, and the total bill, then output the results.

### Further Exploration

Our solution prints the results as `$30.0` and `$230.0` instead of the more usual `$30.00` and `$230.00`. Modify your solution so it always print the results with 2 decimal places.

Hint: You will likely need `Kernel#format` for this.

```rb 
def format_me(integer)
    "$" + format("%.2f", integer) 
end

puts "=> Enter your bill number: "
bill = gets.chomp.to_i.to_f

puts "=> Please enter the tip percentage: "
tip_percentage = gets.chomp.to_i

conversion = (tip_percentage * 0.0100)
tip = (bill * conversion)
bill_total = (tip + bill)
   
puts "The tip is " + format_me(tip)
puts "The total is " + format_me(bill_total)
```
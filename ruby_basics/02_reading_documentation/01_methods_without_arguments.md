# Methods Without Arguments
How would you use the `String#upcase` to create an uppercase version of the string `"xyz"`?

We can just call the upcast method on the string directly like so..

```rb
"xyz".upcase
# => "XYZ"
```

- - - -

## Launch School Solution & Discussion
### Solution

```rb
result = "xyz".upcase
```

### Discussion

The documentation for `String#upcase` shows that its signature is:

* upcase -> new_str

At first glance, this seems not too helpful. However, most documentation for ruby methods uses a notation similar to this. The part to the left side of the -> represents how the method is called, while the part to right shows what the method returns.

In this case, the method call reads simply “upcase”. Since the `#upcase` is an instance method, we also know that it needs to be applied to the string we wanted to operate on. To do this, we prepend the string and a period to the method name:

```rb
"xyz".upcase
```

This is the basic instance method call syntax; you should expect to use it whenever you see a signature for an instance method. If we were reading about class or module method, the same signature would imply that we need to prefix the method name with theme of the class and a period, e.g.,

```rb
String.upcase
```

(`String::upcase` isn’t a valid method, so the above call will fail.)

Now that we’ve taken care of the method call itself, we need to deal with the return value. Here, we are told that `#upcase` returns something it is calling `new_str`. When you see `new_xxx` as a return value, it usually means that you are getting a new object of the original object’s type. In this case, the original object is a String, so `new_str` is a new String.

Reading the description of the method, we also see that the method “Returns a copy of str with all lowercase letters replaced with their uppercase counterparts.” Reading “between the lines”m this means the original String is not being modified, so we need to get the result by examining the return value.

The assignment in our solution just shows that we are using the return value of `”xyz”.upcase` to access the modified value. We could just as easily use any of these values as well: 

```rb 
puts "xyz".upcase
puts "Welcome to #{'xyz'.upcase} Corporation!"
z = "xyz".upcase + "zyx".downcase
```

So long as we don’t expect the original String to change, we’re fine.

Actually, there’s an even easier way to see how `#upcase` is used; most method descriptions include one or more examples that demonstrate their use, and `#upcase` does indeed show such an example. However, the examples aren't always easy to understand, and they often don't point out the subtleties of a method, so, you should still know how to read the signature and the description of the method.
# String Class
Use the ruby documentation for the `String` class to determine which method can be used to right justify a `String` object.

```
"string".rjust(20) # => "              string"
```

- - - -

## Launch School Solution & Discussion

### Solution

```
#rjust
```

### Discussion

Start by finding the page that describes the String class; you should be there already if you came her from the previous exercise. Once there, all you need to do is find the appropriate method.

This won’t necessarily be easy. Sometimes, you just need to scan through the method names until you see something that sounds like its might do the trick. Other times, you will need to use your browser’s in-page search capability to find something. On other occasions, you may be forced to scan through the entire page, or followup in the class’s Parent or Included Modules (both of which we will see later).

In this case, we just found it easiest to do an in-page search for “justify”, which failed. So, we tweaked the search to “justified” which first found the `#ljust` method, and then the `#rjust` method. The `#rjust` method proved to be what we wanted.
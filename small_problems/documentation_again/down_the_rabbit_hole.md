# Down the Rabbit Hole
Sometimes, the documentation is going to leave you scratching your head.

In a very early assignment at Launch School, you are tasked with writing that loads some text messages from a YAML file. We do this with `YAML::load_file`:

```rb
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
```

Find the documentation for `YAML::load_file`.

A simple google search should help me find the documentation for YAML. Oh, and look, [here](https://ruby-doc.org/stdlib-2.5.1/libdoc/yaml/rdoc/YAML.html)it is. According to documentation YAML (*ain't markup language*). This module provides a Ruby interface for data serialization in the YAML format. The underlying implementation is the libyaml wrapper Psych.

- - - -
# Launch School Solution & Discussion
### Solution
 [http://ruby-doc.org/stdlib/libdoc/psych/rdoc/Psych.html#method-c-load_file](http://ruby-doc.org/stdlib/libdoc/psych/rdoc/Psych.html#method-c-load_file)

### Discussion
If you go to the YAML documentation (it’s part of the Standard Library API), you will find a page that is almost completely devoid of useful information. There’s not a single method described, and only 3 ridiculously trivial examples. There is no Parent class defined, there are no Included Modules, and the YAML-related links on the left-side are of no help.

The only really useful item on this page the 3rd paragraph:

> The underlying implementation is the libyaml wrapper Psych.

They key here is the reference to Psych. If you go back to the Standard Library API page and click on `psych`, you see a long list of Psych-related classes. Unfortunately, that long list makes a quest for a method named `::load_file` somewhat daunting.

Fortunately, this page also lists all of the methods in the different classes, and up near the top of this list is `::load_file`, which is part of the `Psych` module. Sure enough, there’s the documentation for what we were looking for.

In fact, the entire `Psych` class is about methods that will be useful when working with YAML files.

# Series Timer

scrapes the list of episodes of any series from wikipedia (i.e. http://en.wikipedia.org/wiki/List_of_House_episodes)

## Download
https://rubygems.org/gems/series_timer

## Usage

````./bin/seriestimr -[lac] <series names>````

- -l = last episode on air

- -a = list all episodes

- -n = next episode

ex:
````./bin/seriestimr -n House "The Big Bang Theory" "Dexter"````



## Next episode

````
./bin/series_timer -n "The Mentalist" Californication
[The Mentalist] S05e13   Red is the New Black	 2012-02-02 (4 days)
[Californication] S05e04	 Waiting for the Miracle	 2012-01-29 (0 days)
````


## Last episode on air

````
./bin/series_timer -l House Dexter
[House] S09e09   Better Half	 2012-01-23
[Dexter] S06e12	 This Is the Way the World Ends	 2011-12-18
````

## All Episodes

````
./bin/series_timer -a "Game of Thrones"
[Game of Thrones] S01e01   Winter Is Coming	 2011-04-17
[Game of Thrones] S01e02	 The Kingsroad	 2011-04-24
[Game of Thrones] S01e03	 Lord Snow	 2011-05-01
[Game of Thrones] S01e04	 Cripples	 2011-05-08
[Game of Thrones] S01e05	 The Wolf and the Lion	 2011-05-15
[Game of Thrones] S01e06	 A Golden Crown	 2011-05-22
[Game of Thrones] S01e07	 You Win or You Die	 2011-05-29
[Game of Thrones] S01e08	 The Pointy End	 2011-06-05
[Game of Thrones] S01e09	 Baelor	 2011-06-12
[Game of Thrones] S01e10	 Fire and Blood	 2011-06-19
[Game of Thrones] S10e09	 Blackwater	 2012-05-27
````




## Authorship

Written by [Adriano Bacha](http://github.com/abacha) for Mendicant University's January 2012 core skills course.

## License

Copyright (c) 2012 Adriano Bacha

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---

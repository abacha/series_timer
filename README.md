# Series Timer
usage: ````./bin/seriestimr -[lac] <series names>````

- -l = last episode on air

- -a = list all episodes

- -c = countdown to the next episode

ex:
````./bin/seriestimr -c House "The Big Bang Theory" "Dexter"````



## Countdown

````
./bin/series_timer -c "The Mentalist" Californication
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


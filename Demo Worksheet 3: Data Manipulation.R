---
  title: 'Worksheet 3: Data Manipulation'
author: "Will Hiott"
date: "2023-02-21"
---
  _Before you begin this worksheet this week, please reinstall `DigitalMethodsData` from GitHub by running: `devtools::install_github("regan008/DigitalMethodsData")` in your console. Also be sure that you have installed the Tidyverse library._
`devtools::install_github("regan008/DigitalMethodsData")`
R has powerful tools for manipulating data. The Tidyverse is a collection of packages for R that are designed for data science. Take a look at the website for the Tidyverse and the list of packages that are included at: [https://www.tidyverse.org/packages/](https://www.tidyverse.org/packages/)

## A Grammar of Data Manipulation with `dplyr()`

We'll start with **dplyr** which is described as "a grammar of data manipulation, providing a consistent set of verbs that help you solve the most common data manipulation challenges." The verbs included in this package are: 

* `select()`: picks variables based on their names.
* `mutate()`: adds new variables that are functions of existing variables.
* `filter()`: picks cases based on their values.
* `summarise()`: reduces multiple values down to a single summary.
* `arrange()`: changes the ordering of the rows.

All of these verbs play nicely and combine naturally with `group_by()` which allows you to perform any operation “by group”.

Lets load some data and libraries for our work. 
```{r}
library(DigitalMethodsData)
library(dplyr)

data("gayguides")
```

### Select
Lets start with `select()`. This function allows you to subset columns using their names and types. The `eval: false` line is a chunk option that simply prevents Quarto from printing 60k rows of data in your final rendered document. You can still run the chunk as you normally would.
```{r}
gayguides %>% 
  select(title, Year)
```
Notice that this subsetted the data and returned only the title and year. However, it didn't modify the `gayguides` data or save it to a new variable because we didn't assign the result to anything. 
                                                                  title Year
1                                                                'B.A.' 1982
2                                                          'B.A.' Beach 1981
3                                                          'B.A.' Beach 1981
4                                                          'B.A.' Beach 1981
5                                                          'B.A.' Beach 1982
it didn't modify the `gayguides` data or save it to a new variable because we didn't assign the result to anything.
(@) Use `select()` to take the city and state from gayguides and add them to a dataframe called "locations". 
```{r}
gayguides %>% 
select("city" & "state")
("gayguides")
  mutate("locations")
  
```

(@) What did you do to save the data to a new data frame? Why? 
DID NOT 
>Need to move and save data to a new data frame
How ???
gayguides.city.state <- 
(@) Can you use `select()` to grab all the columns of `gayguides` 
EXCEPT for the city and state? Hint: You might want to read the documentation for this function. 
TO DO CHECK DOCUMENTATION

```{r}
("gayguides")
`select(except "city" & "state")` 
```

### Filter
The filter function subsets a data frame and retains all the rows that satisfy your conditions. To be retained, the row must produce a value of TRUE for _all_ of the conditions you provide. 

```{r}
#| eval: false

gayguides %>% filter(Year > 1980)
```
   state Year                        notes      lat        lon
1     NY 1982                              44.27949  -73.97987
2     NY 1981                              42.72841  -73.69178
3     UT 1981                              40.74781 -112.18727
4     WA 1981                              47.60621 -122.33207
5     NY 1982                              42.72841  -73.69178
6     WA 1983                              47.60621 -122.33207
7     CA 1983                              38.91163 -123.01105
8     NY 1983                              42.72841  -73.69178
9     UT 1983                              40.74781 -112.18727
10    WA 1984                              47.60621 -122.33207

Filter also works with the logical values we learned earlier this semester.

```{r}
#| eval: false
gayguides %>% filter(Year == 1970 | Year == 1980)
```
And strings: 

```{r}
(gayguides)
gayguides %>% 
  filter(city == "Greenville" | state == "South Carolina")
```

(@) The above code grabs every location where the city is Greenville. However, there is more than one city named Greenville. Can you filter to retrieve Greenville, SC? 

```{r}
```{r}
(gayguides)
gayguides %>% 
  filter(city == "Greenville" | state == "South Carolina")
```
```

(@) How about every location between 1975 and 1980? 

```{r}
```{r}
(gayguides)
gayguides %>% 
select()
  filter(city == "Greenville" | state == "South Carolina")
```
gayguides %>% filter(Year == 1975 | Year == 1980)

```


(@) Every entry in Greenville, SC between 1975 and 1980? 

```{r}
gayguides %>% filter(Year == 1975 | Year == 1980)
gayguides %>% filter(Location == "Greenville")
summarise(NorthCarolina)
```

(@) Can you find all locations in 1975 except for New York and San Francisco? 
```{r}
gayguides %>% filter(Year == 1975)
gayguides %>% filter(Location == "Greenville")
select(except "New York" "San Francisco")
gayguides %>% filter(City == except "New York", "San Francisco")
#| eval: false
data("gayguides")
gayguides %>% mutate(NOT difference = "New York" - "San Francisco" 

```

(@) The amenity features column in gay guides contains a comma separated list of categorizations. (G), for example, stands for girls. However, this language changed over time and women's locations eventually are described as (L). What if we want to filter by any entry that has (G) OR (L) in the amenity feature column?  This is a bit more complicated because the entries are a comma separated list and (G) or (L) is often paired with other categorizations. How might you _search the dataframe for entries that match_ (G) or (L)?
  ```{r}
gayguides %>% filter("g" & "l")
data("gayguides")

```

### Mutate
The `mutate()` function adds new variables and preserves existing one. 
This is useful when you want to create a new column based on other values. 
For example, in the `statepopulation` dataset, we want to ask 
"How much did the population increase between 1800 and 1900 in each state?." 
We can do that by subtracting the population in 1900 from 1800 and storing that value in a new column. 

```{r}
#| eval: false
data("statepopulations")
statepopulations %>% mutate(difference = X1900 - X1800) 
```
GISJOIN                STATE STATEFP STATENH  X1790  X1800  X1810  X1820  X1830  X1840
1     G010              Alabama       1      10     NA     NA     NA 127901 309527 590756
2     G020               Alaska       2      20     NA     NA     NA     NA     NA     NA
3     G025     Alaska Territory      NA      25     NA     NA     NA     NA     NA     NA
4     G040              Arizona       4      40     NA     NA     NA     NA     NA     NA
5     G045    Arizona Territory      NA      45     NA     NA     NA     NA     NA     NA
6     G050             Arkansas       5      50     NA     NA     NA     NA     NA  97574
7     G055   Arkansas Territory      NA      55     NA     NA     NA  14273  30388     NA
8     G060           California       6      60     NA     NA     NA     NA     NA     NA
9     G080             Colorado       8      80     NA     NA     NA     NA     NA     NA


(@) In the Boston Women Voters dataset, every voter is given an age. 
Can you use their age to calculate each person's birth year? 
(Assume all this data was collected in 1920.)

```{r}
data('BostonWomensVoters')
library("BostonWomensVoters")
BostonWomensVoters %>% mutate(age) 
BostonWomensVoters %>% filter(Year == 1920)

```
Error in library("BostonWomensVoters") : 
  there is no package called ‘BostonWomensVoters’
  
(@) Can you create a new column that combines the city and state columns in `gayguides` 
into a new column called location? 
It should list the city, state. (i.e. San Diego, CA)

```{r}
gayguides %>%
select("city" & "state"
column(location))


```

### Arrange
`Arrange()` orders the rows of a data frame by the values of selected columns. 
In other words it sorts a data frame by a variable. 
In the `gayguides` data, we can sort the data by year with the earliest year first. 
If we wanted the latest year first, we could do so by using the `desc()` function. 

```{r}
#| eval: false

gayguides %>%
  arrange(Year)

gayguides %>%
  arrange(desc(Year))
  
  desc("latest" "year")
```


(@) Using the `statepopulation` data, which state has the largest population in 1850? 
Write code that pulls only the relevant columns (state and 1850) and sorts it accordingly. 
```{r}
 #| eval: false
data("statepopulations")
statepopulations %>% mutate(difference = state & 1850) 

```

### Group_by() and Summarize()

Arrange is useful for finding the highest and lowest values, 
but it returns those values for the entire dataset. `group_by()`, 
in contrast, takes an existing tbl and converts it into a grouped tbl where operations are 
performed "by group". Lets look at what that means in practice: 
```{r}
mydata <- gayguides %>% 
            select(title, Year) %>%
            group_by(Year)
```
It doesn't appear that this did much. But if you hover over this new variable in your environment pane, you'll see that its now listed as a "grouped data frame." Compare that to `gayguides` which is listed as just a data frame. This means that now we can run calculations on this data and it'll perform them "by group". Or, in other words, it'll perform operations on each year within the dataset. That's where `summarize()` comes in. `summarize()` creates a new data frame with one (or more) rows for each combination of grouping variables. In this case our grouping is by year, so the resulting data frame will group records by each year in the `gayguides` dataset.

```{r}
gayguides %>% 
  select(title, Year) %>%
  group_by(Year) %>%
  summarize(count = n())
```
What happened here? In this example, we asked group_by to create groups based on year and 
then in summarize we created a column called count. 
We passed it the n() function which gives the current group size. 
What results, is a dataset that lists each year and how many locations that state has. 

(@) You try, use group_by and summarize to find the total number of locations in each state, 
each year.
```{r}
mydata <- gayguides %>% 
  select("locations") %>%
  group_by(state) %>%
  summarize(count = n())
}
```
Error in `select()`:
  ! Can't subset columns that don't exist.
✖ Column `locations` doesn't exist.
Run `rlang::last_trace()` to see where the error occurred.


(@) Summarize can do more than just count rows. 
Can you use `summarize()` to find the average age for each occupation in the 
Boston Women Voters data?
  ```{r}
summarize(average age, occupation)
```

(@) In the `gayguides` data, on average how many locations did each city in South Carolina 
have between 1970 and 1975?
  ```{r}
gayguides %>% 
  select("south Carolina", 1970:1975) %>%
  group_by("City") %>%
  locations per city
  summarize(count = n())
```

(@) Filter the dataset for only the values in the southernstates list 
(created in the block below). Then tell me, how many locations were in all the 
southern states in 1975?
  ```{r}
southernstates <- c("AL", "AR", "FL", "GA", "KY", "LA", "MD", "MS", "NC", "SC", "TN", "TX", "VI", "WV")
select(locations = 1975)
summarize
```

## Re-Shaping Data: Joins and Pivots

### Joins()
At some point, you might have a situation where you want to join two tables together. 
For example, in the `almshouse_admissions` dataset there is a column called 
"Descriptions.by.Clerk" which contains a code for each occupation.

```{r}
data("almshouse_admissions")
head(almshouse_admissions$Descriptions.by.Clerk)
```
For the purposes of working with this data in R, having only the code isn't very useful. 
The code book for these occupations is available here: 
  
```{r}
almshouse.occupations <- read.csv(file="https://raw.githubusercontent.com/regan008/DigitalMethodsData/main/raw/almshouse-occupationalcodes.csv", header=TRUE)
```

A join allows us to join these two dataframes together, matching each row based on the occupational code provided in the `Descriptions.by.Clerk` column. To do that we'll use a function known as a mutating join. A mutating join allows you to combine variables from two tables. It first matches observations by their keys, then copies across variables from one table to the other. In this case we want to join the matching rows from `almshouse.occupations` to `almshouse_admissions`. In an ideal world, the column names in the two data frames would match but since that isn't the case, we'll have to specify what columns `left_join` should use to join the two data frames. 

```{r}
almshouse_admissions <- left_join(almshouse_admissions, almshouse.occupations, by=c("Descriptions.by.Clerk"="code"))

head(almshouse_admissions)
```

(@) Below I've downloaded data about each of the census regions. 
Join this dataset with `gayguides`. 
Create a data frame that includes each of the regions and the total number of locations 
in 1980. How many locations appear in the Mountain region in 1980?
  
```{r}
regions <- read.csv("https://raw.githubusercontent.com/regan008/DigitalMethodsData/main/raw/censusregions.csv")
```

(@) Explain what you did above. What variable did you join by and why? What results?
  
  Did not get.

(@)How much did LGTBQ life grow between 1970 and 1980? 
  an you create a data frame that computes the growth in the number of locations 
between 1970 and 1980 for every state? For every region? 
```{r}
gayguides
select(g or l)
filter year (1970-1980)
select(state)
summarise(region)

```


### `pivot_longer()` and `pivot_wider()`: Converting Wide and Long Data

It's possible that you won't create every dataset you use in R. Sometimes that means the dataset is in a format that isn't useful for the questions you want to ask. The dataset below is what is referred to as a "wide" data frame. That is in comparison to a "long" data frame (which would be considered tidy data).
```{r}
library(tidyr)
sc.parks <- read.csv("https://raw.githubusercontent.com/regan008/DigitalMethodsData/main/raw/RecreationData-Wide.csv")
head(sc.parks)
```
This dataset contains all of the localities in South Carolina along with information about the types of recreational workers in that city (paid vs unpaid, male vs female). However, the problem with this dataset is that every year is a column heading making it difficult to work with. On the surface this seems like a useful format, partially because it reads left to right which is how we're accustomed to reading documents. Its easy to compare, for example, the number of female paid recreation workers between 1930 and 1945. But for computational purposes this format is less than ideal for many types of visualizations and operations. R provides functions for dealing with this. `pivot_longer()` "lengthens" your data by increasing the number of rows and decreasing the number of columns. 
```{r}
sc.parks <- sc.parks %>%
  pivot_longer(!city:type_of_worker, names_to = "year", values_to = "count")
```

(@) What did this code do? 
>390                                                         'Rest Stop' 1982
391                                                         'Rest Stop' 1982
392                                                         'Rest Stop' 1982
393                                                         'Rest Stop' 1982
394                                                         'Rest Stop' 1982
395                                                         'Rest Stop' 1982
396                                                         'Rest Stop' 1982
397                                                         'Rest Stop' 1982
398                                                         'Rest Stop' 1982
399                                                         'Rest Stop' 1982
400                                                         'Rest Stop' 1982
401                                                         'Rest Stop' 1983
402                                                         'Rest Stop' 1983
403                                                         'Rest Stop' 1983
404                                                         'Rest Stop' 1983
405                                                         'Rest Stop' 1983
406                                                         'Rest Stop' 1983
407                                                         'Rest Stop' 1983
408                                                         'Rest Stop' 1983
409                                                         'Rest Stop' 1983
410                                                         'Rest Stop' 1983
411                                                         'Rest Stop' 1983
412                                                         'Rest Stop' 1983
413                                                         'Rest Stop' 1983
414                                                         'Rest Stop' 1983
415                                                         'Rest Stop' 1983
416                                                         'Rest Stop' 1983
417                                                         'Rest Stop' 1983
418                                                         'Rest Stop' 1983
419                                                         'Rest Stop' 1983
420                                                         'Rest Stop' 1983
421                                                         'Rest Stop' 1983
422                                                         'Rest Stop' 1983
423                                                         'Rest Stop' 1983
424                                                         'Rest Stop' 1983
425                                                         'Rest Stop' 1983
426                                                         'Rest Stop' 1983
427                                                         'Rest Stop' 1983
428                                                         'Rest Stop' 1983
429                                                         'Rest Stop' 1983
430                                                         'Rest Stop' 1983
431                                                         'Rest Stop' 1983
432                                                         'Rest Stop' 1983
433                                                         'Rest Stop' 1983
434                                                         'Rest Stop' 1983
435                                                         'Rest Stop' 1983
436                                                         'Rest Stop' 1983
437                                                         'Rest Stop' 1983
438                                                         'Rest Stop' 1983
439                                                         'Rest Stop' 1983
440                                                         'Rest Stop' 1983
441                                                         'Rest Stop' 1983
442                                                         'Rest Stop' 1983
443                                                         'Rest Stop' 1983
444                                                         'Rest Stop' 1983
445                                                         'Rest Stop' 1983
446                                                         'Rest Stop' 1983
447                                                         'Rest Stop' 1983
448                                                         'Rest Stop' 1983
449                                                         'Rest Stop' 1983
450                                                         'Rest Stop' 1983
451                                                         'Rest Stop' 1983
452                                                         'Rest Stop' 1983
453                                                         'Rest Stop' 1983
454                                                         'Rest Stop' 1983
455                                                         'Rest Stop' 1983
456                                                         'Rest Stop' 1983
457                                                         'Rest Stop' 1983
458                                                         'Rest Stop' 1983
459                                                         'Rest Stop' 1983
460                                                         'Rest Stop' 1983
461                                                         'Rest Stop' 1983
462                                                         'Rest Stop' 1983
463                                                         'Rest Stop' 1983
464                                                         'Rest Stop' 1983
465                                                         'Rest Stop' 1983
466                                                         'Rest Stop' 1983
467                                                         'Rest Stop' 1983
468                                                         'Rest Stop' 1983
469                                                         'Rest Stop' 1983
470                                                         'Rest Stop' 1983
471                                                         'Rest Stop' 1983
472                                                         'Rest Stop' 1983
473                                                         'Rest Stop' 1983
474                                                         'Rest Stop' 1983
475                                                         'Rest Stop' 1983
476                                                         'Rest Stop' 1983
477                                                         'Rest Stop' 1983
478                                                         'Rest Stop' 1983
479                                                         'Rest Stop' 1983
480                                                         'Rest Stop' 1983
481                                                         'Rest Stop' 1983
482                                                         'Rest Stop' 1983
483                                                         'Rest Stop' 1983
484                                                         'Rest Stop' 1983
485                                                         'Rest Stop' 1983
486                                                         'Rest Stop' 1983
487                                                         'Rest Stop' 1983
488                                                         'Rest Stop' 1983
489                                                         'Rest Stop' 1983
490                                                         'Rest Stop' 1983
491                                                         'Rest Stop' 1983
492                                                         'Rest Stop' 1983
493                                                         'Rest Stop' 1983
494                                                         'Rest Stop' 1983
495                                                         'Rest Stop' 1983
496                                                         'Rest Stop' 1983
497                                                         'Rest Stop' 1983
498                                                         'Rest Stop' 1983
499                                                         'Rest Stop' 1983
500                                                         'Rest Stop' 1983
[ reached 'max' / getOption("max.print") -- omitted 60198 rows ]
> ```{r}
Error: attempt to use zero-length variable name
> select("gayguides")
Error in UseMethod("select") : 
  no applicable method for 'select' applied to an object of class "character"
> ```{r}
Error: attempt to use zero-length variable name
> gayguides %>% 
  + select("gayguides")
Error in `select()`:
  ! Can't subset columns that don't exist.
✖ Column `gayguides` doesn't exist.
Run `rlang::last_trace()` to see where the error occurred.
> View(gayguides)
> gayguides %>% 
+ select("gayguides")
Error in `select()`:
! Can't subset columns that don't exist.
✖ Column `gayguides` doesn't exist.
Run `rlang::last_trace()` to see where the error occurred.
> gayguides %>% 
  + select data("gayguides")
Error: unexpected symbol in:
  "gayguides %>% 
select data"
> gayguides %>% 
  + select("city" & "state")
data frame with 0 columns and 60698 rows
> "gayguides")
Error: unexpected ')' in ""gayguides")"
> select("city" & "state")
Error in "city" & "state" : 
  operations are possible only for numeric, logical or complex types
Session restored from your saved work on 2024-Feb-20 03:39:34 UTC (1 day ago)
> library(DigitalMethodsData)
> library(dplyr)

> data("gayguides")

> 
  ```{r}
data("gayguides")
filter(state=SC)
1970-1975 

(1970:1975)
greenville 1970 5
charleston 1970 2
Charleston 1975 5
Create an average in group by year
group_by(year)

group_by(city)

data("gayguides")
avg.by.year <- gayguides %>% filter(state=="SC") %% filter(Year == 
      1970:1975) %>% grounp_by(city, year) %>% sumarize(count = n)) %>%
summarize(avg=mean(count)) %>% print()


avg.city.in.SC <- gayguides %.%

%>% filter(year ==1979:1975)
#1

Error: attempt to use zero-length variable name
> ```{r}
data("gayguides")
Error: attempt to use zero-length variable name
> gayguides %>% 
  +   select(title, Year)
title Year
1                                                                'B.A.' 1982
2                                                          'B.A.' Beach 1981
3                                                          'B.A.' Beach 1981
4                                                          'B.A.' Beach 1981
5                                                          'B.A.' Beach 1982
6                                                          'B.A.' Beach 1983
7                                                          'B.A.' Beach 1983
8                                                          'B.A.' Beach 1983
9                                                          'B.A.' Beach 1983
10                                                         'B.A.' Beach 1984
11                                                         'B.A.' Beach 1984
12                                                         'B.A.' Beach 1984
13                                                         'B.A.' Beach 1985
14                                                         'B.A.' beach 1981
15                                                         'B.A.' beach 1983
16                                                         'B.A.' beach 1984
17                                             'B.A.' beach at N. Truro 1982
18                           'B.A.' Beach nr. Evergreen Floating Bridge 1982
19                                      'B.A.' Beach nr. Salt Air Beach 1982
20                                        'B.A.' Beach on Russian River 1982
21                                        'B.A.' Beach on Russian River 1984
22         'B.A.' Beach on Russian River, 1 1/2 mi. from Mirabelle Park 1981
23                                                           'B' Street 1983
24                                                           'B' Street 1984
25                                                           'B' Street 1985
26                                                           'BA' beach 1985
27                                                           'BA' beach 1985
28                                                           'BA' beach 1985
29                                                           'BA' beach 1985
30                                                       'Black Forest' 1981
31                                                       'Black Forest' 1982
32                                                       'Black Forest' 1983
33                                                       'Black Forest' 1984
34                                                       'Black Forest' 1985
35                                                           'Bus Stop' 1982
36                                                           'Bus Stop' 1983
37                                                           'Bus Stop' 1984
38                                                           'Bus Stop' 1985
39                                       'Bus Stop' at Pine & Jefferson 1981
40                                                             'bushes' 1983
41                                                              'C' St. 1985
42                                                  'C' St. at 4th Ave. 1981
43                                                  'C' St. at 4th Ave. 1982
44                                                  'C' St. at 4th Ave. 1984
45                                                           'C' Street 1983
46                                                     'Castro Village' 1981
47                                                      'Chicken Hawks' 1982
48                                                 'Cruising the Levee' 1981
49                                                 'Cruising the Levee' 1981
50                                                 'Cruising the Levee' 1982
51                                                 'Cruising the Levee' 1983
52                                                     'Cruisy jacuzzi' 1984
53                                     'Cruisy jacuzzi' at Desert Palms 1981
54                      'Cruisy jacuzzi' sauna & bushes at Desert Palms 1982
55                      'Cruisy jacuzzi' sauna & bushes at Desert Palms 1983
56                      'Cruisy Jacuzzi' suana & bushes at Desert Palms 1985
57                                                            'Dog Run' 1981
58                                                            'Dog Run' 1982
59                                                            'Dog Run' 1983
60                                                            'Dog Run' 1984
61                                                            'Dog Run' 1985
62                                                    'F' St. Bookshore 1985
63                                                    'F' St. Bookstore 1981
64                                                    'F' St. Bookstore 1982
65                                                    'F' St. Bookstore 1983
66                                                    'F' St. Bookstore 1983
67                                                    'F' St. Bookstore 1984
68                                                 'F' Street Bookstore 1982
69                                                 'F' Street Bookstore 1983
70                                                 'F' Street Bookstore 1984
71                                                 'F' Street Bookstore 1985
72                                                           'Figure 8' 1981
73                                                        'First Beach' 1981
74                                                        'First Beach' 1983
75                                                        'First Beach' 1984
76                                                        'First Beach' 1985
77                          'First Beach' in front of concession stands 1982
78                                                          'Gay Acres' 1984
79                                                          'Gay Acres' 1985
80                                                           'Gay Loop' 1981
81                                                           'Gay Loop' 1984
82                                                           'Gay Loop' 1985
83                                                'Gay Loop' Keo & Park 1983
84                                          'Gay Loop' Keo & Park betw. 1982
85                                                     'Hibernia Beach' 1984
86                                                     'Hibernia Beach' 1985
87                                                      'Hippie Hollow' 1981
88                                                      'Hippie Hollow' 1982
89                                                      'Hippie Hollow' 1983
90                                                      'Hippie Hollow' 1984
91                                                      'Hippie Hollow' 1985
92                                                       'Hitch-Hikers' 1981
93                                                       'Hitch-Hikers' 1983
94                                                       'Hitch-Hikers' 1985
95                                                       'Hitch-hikers' 1981
96                                                       'Hitch-hikers' 1981
97                                                       'Hitch-hikers' 1981
98                                                       'Hitch-hikers' 1982
99                                                       'Hitch-hikers' 1982
100                                                      'Hitch-hikers' 1982
101                                                      'Hitch-hikers' 1982
102                                                      'Hitch-hikers' 1982
103                                                      'Hitch-hikers' 1982
104                                                      'Hitch-hikers' 1982
105                                                      'Hitch-hikers' 1982
106                                                      'Hitch-hikers' 1982
107                                                      'Hitch-hikers' 1983
108                                                      'Hitch-hikers' 1983
109                                                      'Hitch-hikers' 1983
110                                                      'Hitch-hikers' 1983
111                                                      'Hitch-hikers' 1983
112                                                      'Hitch-hikers' 1983
113                                                      'Hitch-hikers' 1983
114                                                      'Hitch-hikers' 1983
115                                                      'Hitch-hikers' 1983
116                                                      'Hitch-hikers' 1983
117                                                      'Hitch-hikers' 1983
118                                                      'Hitch-hikers' 1983
119                                                      'Hitch-hikers' 1983
120                                                      'Hitch-hikers' 1983
121                                                      'Hitch-hikers' 1983
122                                                      'Hitch-hikers' 1983
123                                                      'Hitch-hikers' 1984
124                                                      'Hitch-hikers' 1984
125                                                      'Hitch-hikers' 1984
126                                                      'Hitch-hikers' 1984
127                                                      'Hitch-hikers' 1984
128                                                      'Hitch-hikers' 1984
129                                                      'Hitch-hikers' 1984
130                                                      'Hitch-hikers' 1985
131                                                      'Hitch-hikers' 1985
132                                                      'Hitch-hikers' 1985
133                                                      'Hitch-hikers' 1985
134                                                      'Hitch-hikers' 1985
135                                                      'Hitch-hikers' 1985
136                                                      'Hitch-hikers' 1985
137                            'Hitch-hikers' (Sailors) along Rosecrans 1981
138                                 'Hitch-hikers' 2nd & Roosevelt Sts. 1981
139                                 'Hitch-hikers' 2nd & Roosevelt Sts. 1982
140                            'Hitch-hikers' 2nd Sts. & Roosevelt Sts. 1984
141                                       'Hitch-hikers' along El Cajon 1981
142                                  'Hitch-hikers' on 4th Ave. & Hwy 8 1981
143                                 'Hitch-hikers' on 4th Ave. & Hwy. 8 1984
144        'Hitch-hikers' on Broadway betw. Long Beach Blvd. & Magnolia 1981
145 'Hitch-hikers' on Coast Hwy. from Myrtle St. to Bluebird Canyon Rd. 1981
146                                         'Hitch-Hikers' on E. Colfax 1982
147                                        'Hitch-hikers' on E. Prince. 1984
148                                       'Hitch-hikers' on E. Speedway 1981
149                                     'Holdings' Little America Lodge 1981
150                                                      'Homo Heights' 1981
151                                                      'Homo Heights' 1982
152                                                      'Homo Heights' 1983
153                                                      'Homo Heights' 1984
154                                                      'Homo Heights' 1985
155                                                          'Hustlers' 1983
156                                                      'In the woods' 1983
157                                     'Info center 'Rest Stop' T-Room 1981
158                                                            'K' Mart 1982
159                                                            'K' Mart 1983
160                                                     'K' Mart T-Room 1984
161                                                             'K' St. 1983
162                                                        'K' St. Mall 1981
163                                                        'K' St. Mall 1982
164                                                        'K' St. Mall 1983
165                                                          'K' Street 1985
166                                                       'L' St. Beach 1981
167                                                       'L' St. Beach 1982
168                                                       'L' St. Beach 1983
169                                                       'L' St. Beach 1984
170                                                       'L' St. Beach 1985
171                                                        'Land's End' 1984
172                                                        'Land's End' 1985
173                                                  'Lavender Heights' 1985
174                                                   'Lollypop Heaven' 1981
175                                                   'Lollypop Heaven' 1982
176                                                   'Lollypop Heaven' 1983
177                                                   'Lollypop Heaven' 1984
178                                                   'Lollypop Heaven' 1985
179                                                         'Meat Rack' 1983
180                                                         'Meat Rack' 1985
181                                              'Meat Rack' & 'bushes' 1981
182                                                          'Milk Run' 1982
183                                                          'Milk Run' 1983
184                                                          'Milk Run' 1984
185                                                          'Milk Run' 1985
186                                                          'Milk Run' 1985
187                                                      'Miracle Mile' 1981
188                                                      'Miracle Mile' 1982
189                                                      'Miracle Mile' 1982
190                                                      'Miracle Mile' 1983
191                                                      'Miracle Mile' 1983
192                                                      'Miracle Mile' 1985
193                                                           'Miracle' 1984
194                                                            'N Touch 1981
195                                                            'N Touch 1982
196                                                            'N Touch 1983
197                                                           'N' Touch 1984
198                                                             'O' St. 1984
199                                            'O' St. from 9th to 27th 1985
200                                                       'P' St. Beach 1981
201                                                       'P' St. Beach 1982
202                                                       'P' St. Beach 1983
203                                                       'P' St. Beach 1984
204                                                       'P' St. Beach 1985
205                                                  'P' Street Station 1985
206                                                       'Polkstrasse' 1982
207                                                        'Polstrasse' 1983
208                                                     'Primrose Path' 1981
209                                                     'Primrose Path' 1982
210                                                     'Primrose Path' 1983
211                                                     'Primrose Path' 1984
212                                                     'Primrose Path' 1985
213                                                          'Rest Stop 1985
214                                                        'Rest Stop ' 1983
215                                                         'Rest Stop' 1981
216                                                         'Rest Stop' 1981
217                                                         'Rest Stop' 1981
218                                                         'Rest Stop' 1981
219                                                         'Rest Stop' 1981
220                                                         'Rest Stop' 1981
221                                                         'Rest Stop' 1981
222                                                         'Rest Stop' 1981
223                                                         'Rest Stop' 1981
224                                                         'Rest Stop' 1981
225                                                         'Rest Stop' 1981
226                                                         'Rest Stop' 1981
227                                                         'Rest Stop' 1981
228                                                         'Rest Stop' 1981
229                                                         'Rest Stop' 1981
230                                                         'Rest Stop' 1981
231                                                         'Rest Stop' 1981
232                                                         'Rest Stop' 1981
233                                                         'Rest Stop' 1981
234                                                         'Rest Stop' 1981
235                                                         'Rest Stop' 1981
236                                                         'Rest Stop' 1981
237                                                         'Rest Stop' 1981
238                                                         'Rest Stop' 1981
239                                                         'Rest Stop' 1981
240                                                         'Rest Stop' 1981
241                                                         'Rest Stop' 1981
242                                                         'Rest Stop' 1981
243                                                         'Rest Stop' 1981
244                                                         'Rest Stop' 1981
245                                                         'Rest Stop' 1981
246                                                         'Rest Stop' 1981
247                                                         'Rest Stop' 1981
248                                                         'Rest Stop' 1981
249                                                         'Rest Stop' 1981
250                                                         'Rest Stop' 1981
251                                                         'Rest Stop' 1981
252                                                         'Rest Stop' 1981
253                                                         'Rest Stop' 1981
254                                                         'Rest Stop' 1981
255                                                         'Rest Stop' 1981
256                                                         'Rest Stop' 1981
257                                                         'Rest Stop' 1981
258                                                         'Rest Stop' 1981
259                                                         'Rest Stop' 1981
260                                                         'Rest Stop' 1981
261                                                         'Rest Stop' 1981
262                                                         'Rest Stop' 1981
263                                                         'Rest Stop' 1981
264                                                         'Rest Stop' 1981
265                                                         'Rest Stop' 1981
266                                                         'Rest Stop' 1981
267                                                         'Rest Stop' 1981
268                                                         'Rest Stop' 1981
269                                                         'Rest Stop' 1981
270                                                         'Rest Stop' 1981
271                                                         'Rest Stop' 1981
272                                                         'Rest Stop' 1981
273                                                         'Rest Stop' 1981
274                                                         'Rest Stop' 1981
275                                                         'Rest Stop' 1981
276                                                         'Rest Stop' 1981
277                                                         'Rest Stop' 1981
278                                                         'Rest Stop' 1981
279                                                         'Rest Stop' 1981
280                                                         'Rest Stop' 1981
281                                                         'Rest Stop' 1981
282                                                         'Rest Stop' 1981
283                                                         'Rest Stop' 1981
284                                                         'Rest Stop' 1981
285                                                         'Rest Stop' 1981
286                                                         'Rest Stop' 1981
287                                                         'Rest Stop' 1981
288                                                         'Rest Stop' 1981
289                                                         'Rest Stop' 1981
290                                                         'Rest Stop' 1981
291                                                         'Rest Stop' 1981
292                                                         'Rest Stop' 1981
293                                                         'Rest Stop' 1981
294                                                         'Rest Stop' 1981
295                                                         'Rest Stop' 1981
296                                                         'Rest Stop' 1981
297                                                         'Rest Stop' 1981
298                                                         'Rest Stop' 1981
299                                                         'Rest Stop' 1981
300                                                         'Rest Stop' 1981
301                                                         'Rest Stop' 1981
302                                                         'Rest Stop' 1981
303                                                         'Rest Stop' 1981
304                                                         'Rest Stop' 1981
305                                                         'Rest Stop' 1981
306                                                         'Rest Stop' 1981
307                                                         'Rest Stop' 1981
308                                                         'Rest Stop' 1981
309                                                         'Rest Stop' 1981
310                                                         'Rest Stop' 1981
311                                                         'Rest Stop' 1981
312                                                         'Rest Stop' 1981
313                                                         'Rest Stop' 1982
314                                                         'Rest Stop' 1982
315                                                         'Rest Stop' 1982
316                                                         'Rest Stop' 1982
317                                                         'Rest Stop' 1982
318                                                         'Rest Stop' 1982
319                                                         'Rest Stop' 1982
320                                                         'Rest Stop' 1982
321                                                         'Rest Stop' 1982
322                                                         'Rest Stop' 1982
323                                                         'Rest Stop' 1982
324                                                         'Rest Stop' 1982
325                                                         'Rest Stop' 1982
326                                                         'Rest Stop' 1982
327                                                         'Rest Stop' 1982
328                                                         'Rest Stop' 1982
329                                                         'Rest Stop' 1982
330                                                         'Rest Stop' 1982
331                                                         'Rest Stop' 1982
332                                                         'Rest Stop' 1982
333                                                         'Rest Stop' 1982
334                                                         'Rest Stop' 1982
335                                                         'Rest Stop' 1982
336                                                         'Rest Stop' 1982
337                                                         'Rest Stop' 1982
338                                                         'Rest Stop' 1982
339                                                         'Rest Stop' 1982
340                                                         'Rest Stop' 1982
341                                                         'Rest Stop' 1982
342                                                         'Rest Stop' 1982
343                                                         'Rest Stop' 1982
344                                                         'Rest Stop' 1982
345                                                         'Rest Stop' 1982
346                                                         'Rest Stop' 1982
347                                                         'Rest Stop' 1982
348                                                         'Rest Stop' 1982
349                                                         'Rest Stop' 1982
350                                                         'Rest Stop' 1982
351                                                         'Rest Stop' 1982
352                                                         'Rest Stop' 1982
353                                                         'Rest Stop' 1982
354                                                         'Rest Stop' 1982
355                                                         'Rest Stop' 1982
356                                                         'Rest Stop' 1982
357                                                         'Rest Stop' 1982
358                                                         'Rest Stop' 1982
359                                                         'Rest Stop' 1982
360                                                         'Rest Stop' 1982
361                                                         'Rest Stop' 1982
362                                                         'Rest Stop' 1982
363                                                         'Rest Stop' 1982
364                                                         'Rest Stop' 1982
365                                                         'Rest Stop' 1982
366                                                         'Rest Stop' 1982
367                                                         'Rest Stop' 1982
368                                                         'Rest Stop' 1982
369                                                         'Rest Stop' 1982
370                                                         'Rest Stop' 1982
371                                                         'Rest Stop' 1982
372                                                         'Rest Stop' 1982
373                                                         'Rest Stop' 1982
374                                                         'Rest Stop' 1982
375                                                         'Rest Stop' 1982
376                                                         'Rest Stop' 1982
377                                                         'Rest Stop' 1982
378                                                         'Rest Stop' 1982
379                                                         'Rest Stop' 1982
380                                                         'Rest Stop' 1982
381                                                         'Rest Stop' 1982
382                                                         'Rest Stop' 1982
383                                                         'Rest Stop' 1982
384                                                         'Rest Stop' 1982
385                                                         'Rest Stop' 1982
386                                                         'Rest Stop' 1982
387                                                         'Rest Stop' 1982
388                                                         'Rest Stop' 1982
389                                                         'Rest Stop' 1982
390                                                         'Rest Stop' 1982
391                                                         'Rest Stop' 1982
392                                                         'Rest Stop' 1982
393                                                         'Rest Stop' 1982
394                                                         'Rest Stop' 1982
395                                                         'Rest Stop' 1982
396                                                         'Rest Stop' 1982
397                                                         'Rest Stop' 1982
398                                                         'Rest Stop' 1982
399                                                         'Rest Stop' 1982
400                                                         'Rest Stop' 1982
401                                                         'Rest Stop' 1983
402                                                         'Rest Stop' 1983
403                                                         'Rest Stop' 1983
404                                                         'Rest Stop' 1983
405                                                         'Rest Stop' 1983
406                                                         'Rest Stop' 1983
407                                                         'Rest Stop' 1983
408                                                         'Rest Stop' 1983
409                                                         'Rest Stop' 1983
410                                                         'Rest Stop' 1983
411                                                         'Rest Stop' 1983
412                                                         'Rest Stop' 1983
413                                                         'Rest Stop' 1983
414                                                         'Rest Stop' 1983
415                                                         'Rest Stop' 1983
416                                                         'Rest Stop' 1983
417                                                         'Rest Stop' 1983
418                                                         'Rest Stop' 1983
419                                                         'Rest Stop' 1983
420                                                         'Rest Stop' 1983
421                                                         'Rest Stop' 1983
422                                                         'Rest Stop' 1983
423                                                         'Rest Stop' 1983
424                                                         'Rest Stop' 1983
425                                                         'Rest Stop' 1983
426                                                         'Rest Stop' 1983
427                                                         'Rest Stop' 1983
428                                                         'Rest Stop' 1983
429                                                         'Rest Stop' 1983
430                                                         'Rest Stop' 1983
431                                                         'Rest Stop' 1983
432                                                         'Rest Stop' 1983
433                                                         'Rest Stop' 1983
434                                                         'Rest Stop' 1983
435                                                         'Rest Stop' 1983
436                                                         'Rest Stop' 1983
437                                                         'Rest Stop' 1983
438                                                         'Rest Stop' 1983
439                                                         'Rest Stop' 1983
440                                                         'Rest Stop' 1983
441                                                         'Rest Stop' 1983
442                                                         'Rest Stop' 1983
443                                                         'Rest Stop' 1983
444                                                         'Rest Stop' 1983
445                                                         'Rest Stop' 1983
446                                                         'Rest Stop' 1983
447                                                         'Rest Stop' 1983
448                                                         'Rest Stop' 1983
449                                                         'Rest Stop' 1983
450                                                         'Rest Stop' 1983
451                                                         'Rest Stop' 1983
452                                                         'Rest Stop' 1983
453                                                         'Rest Stop' 1983
454                                                         'Rest Stop' 1983
455                                                         'Rest Stop' 1983
456                                                         'Rest Stop' 1983
457                                                         'Rest Stop' 1983
458                                                         'Rest Stop' 1983
459                                                         'Rest Stop' 1983
460                                                         'Rest Stop' 1983
461                                                         'Rest Stop' 1983
462                                                         'Rest Stop' 1983
463                                                         'Rest Stop' 1983
464                                                         'Rest Stop' 1983
465                                                         'Rest Stop' 1983
466                                                         'Rest Stop' 1983
467                                                         'Rest Stop' 1983
468                                                         'Rest Stop' 1983
469                                                         'Rest Stop' 1983
470                                                         'Rest Stop' 1983
471                                                         'Rest Stop' 1983
472                                                         'Rest Stop' 1983
473                                                         'Rest Stop' 1983
474                                                         'Rest Stop' 1983
475                                                         'Rest Stop' 1983
476                                                         'Rest Stop' 1983
477                                                         'Rest Stop' 1983
478                                                         'Rest Stop' 1983
479                                                         'Rest Stop' 1983
480                                                         'Rest Stop' 1983
481                                                         'Rest Stop' 1983
482                                                         'Rest Stop' 1983
483                                                         'Rest Stop' 1983
484                                                         'Rest Stop' 1983
485                                                         'Rest Stop' 1983
486                                                         'Rest Stop' 1983
487                                                         'Rest Stop' 1983
488                                                         'Rest Stop' 1983
489                                                         'Rest Stop' 1983
490                                                         'Rest Stop' 1983
491                                                         'Rest Stop' 1983
492                                                         'Rest Stop' 1983
493                                                         'Rest Stop' 1983
494                                                         'Rest Stop' 1983
495                                                         'Rest Stop' 1983
496                                                         'Rest Stop' 1983
497                                                         'Rest Stop' 1983
498                                                         'Rest Stop' 1983
499                                                         'Rest Stop' 1983
500                                                         'Rest Stop' 1983
 [ reached 'max' / getOption("max.print") -- omitted 60198 rows ]
> ```{r}
Error: attempt to use zero-length variable name
> gayguides %>% 
+ select("city" & "state")
data frame with 0 columns and 60698 rows
> "gayguides")
Error: unexpected ')' in ""gayguides")"
> gayguides %>% 
+ select("city" & "state")
data frame with 0 columns and 60698 rows
> "gayguides")
Error: unexpected ')' in ""gayguides")"
> gayguides %>% 
+ select("city" & "state")
data frame with 0 columns and 60698 rows
> "gayguides")
Error: unexpected ')' in ""gayguides")"
> ("gayguides")
[1] "gayguides"
>  mutate("locations")
Error in UseMethod("mutate") : 
  no applicable method for 'mutate' applied to an object of class "character"
> gayguides %>% 
+ select("city" & "state")
data frame with 0 columns and 60698 rows
> ("gayguides")
[1] "gayguides"
>   mutate("locations")
Error in UseMethod("mutate") : 
  no applicable method for 'mutate' applied to an object of class "character"
> install.packages("ggplot2")
Installing package into ‘/home/hiottw/R/x86_64-pc-linux-gnu-library/4.2’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/src/contrib/ggplot2_3.4.4.tar.gz'
Content type 'application/x-gzip' length 3159578 bytes (3.0 MB)
==================================================
downloaded 3.0 MB

* installing *source* package ‘ggplot2’ ...
** package ‘ggplot2’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
*** copying figures
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (ggplot2)

The downloaded source packages are in
	‘/local_scratch/pbs.2006217.pbs02/tmp.2ePjywA81u/RtmptiNRlT/downloaded_packages’
> 
> ```{r}
Error: attempt to use zero-length variable name
> data('BostonWomensVoters')
Warning message:
In data("BostonWomensVoters") : data set ‘BostonWomensVoters’ not found
> library("BostonWomensVoters")
Error in library("BostonWomensVoters") : 
  there is no package called ‘BostonWomensVoters’
> library(BostonWomenVoters)
Error in library(BostonWomenVoters) : 
  there is no package called ‘BostonWomenVoters’
> library("BostonWomensVoters")
Error in library("BostonWomensVoters") : 
  there is no package called ‘BostonWomensVoters’
> data("statepopulations")
> statepopulations %>% mutate(difference = state - 1850) 
   GISJOIN                STATE STATEFP STATENH  X1790  X1800  X1810  X1820  X1830  X1840  X1850
1     G010              Alabama       1      10     NA     NA     NA 127901 309527 590756 771623
2     G020               Alaska       2      20     NA     NA     NA     NA     NA     NA     NA
3     G025     Alaska Territory      NA      25     NA     NA     NA     NA     NA     NA     NA
4     G040              Arizona       4      40     NA     NA     NA     NA     NA     NA     NA
5     G045    Arizona Territory      NA      45     NA     NA     NA     NA     NA     NA     NA
6     G050             Arkansas       5      50     NA     NA     NA     NA     NA  97574 209897
7     G055   Arkansas Territory      NA      55     NA     NA     NA  14273  30388     NA     NA
8     G060           California       6      60     NA     NA     NA     NA     NA     NA  92597
9     G080             Colorado       8      80     NA     NA     NA     NA     NA     NA     NA
10    G085   Colorado Territory      NA      85     NA     NA     NA     NA     NA     NA     NA
11    G090          Connecticut       9      90 237655 251002 261942 275248 297675 309978 370792
12    G095     Dakota Territory      NA      95     NA     NA     NA     NA     NA     NA     NA
13    G100             Delaware      10     100  59096  64273  72674  72749  76748  78085  91532
14    G110 District Of Columbia      11     110     NA  14093  24023  33039  39834  43712  51687
15    G120              Florida      12     120     NA     NA     NA     NA     NA     NA  87445
16    G125    Florida Territory      NA     125     NA     NA     NA     NA  34730  54477     NA
17    G130              Georgia      13     130  82548 162686 252433 340989 516823 691392 906185
18    G150               Hawaii      15     150     NA     NA     NA     NA     NA     NA     NA
19    G155     Hawaii Territory      NA     155     NA     NA     NA     NA     NA     NA     NA
20    G160                Idaho      16     160     NA     NA     NA     NA     NA     NA     NA
21    G165      Idaho Territory      NA     165     NA     NA     NA     NA     NA     NA     NA
22    G170             Illinois      17     170     NA     NA     NA  55211 157445 476183 851470
23    G175   Illinois Territory      NA     175     NA     NA  12282     NA     NA     NA     NA
24    G178     Indian Territory      NA     178     NA     NA     NA     NA     NA     NA     NA
25    G180              Indiana      18     180     NA     NA     NA 147178 343031 685866 988416
26    G185    Indiana Territory      NA     185     NA   5641  24520     NA     NA     NA     NA
27    G190                 Iowa      19     190     NA     NA     NA     NA     NA     NA 192214
28    G195       Iowa Territory      NA     195     NA     NA     NA     NA     NA  43112     NA
29    G200               Kansas      20     200     NA     NA     NA     NA     NA     NA     NA
30    G205     Kansas Territory      NA     205     NA     NA     NA     NA     NA     NA     NA
31    G210             Kentucky      21     210     NA 220955 406511 564317 687917 779828 982405
32    G220            Louisiana      22     220     NA     NA     NA 153407 215739 352411 517762
33    G225  Louisiana Territory      NA     225     NA     NA  20845     NA     NA     NA     NA
34    G230                Maine      23     230     NA     NA     NA 298335 399455 501793 583169
     X1860   X1870   X1880   X1890   X1900   X1910   X1920   X1930   X1940    X1950    X1960
1   964201  996992 1262505 1513017 1828697 2138093 2348174 2646248 2832961  3061743  3266740
2       NA      NA      NA      NA      NA      NA      NA      NA      NA       NA   226167
3       NA      NA   33426   32052   63592   64356   55036   59278   72524   128643       NA
4       NA      NA      NA      NA      NA      NA  334162  435573  499261   749587  1302161
5       NA    9658   40440   59620  122931  204354      NA      NA      NA       NA       NA
6   435450  484471  802525 1128179 1311564 1574449 1752204 1854482 1949387  1909511  1786272
7       NA      NA      NA      NA      NA      NA      NA      NA      NA       NA       NA
8   379994  560247  864694 1208130 1485053 2377549 3426861 5677251 6907387 10586224 15717204
9       NA      NA  194327  412198  539700  799024  939629 1035791 1123296  1325089  1753947
10   34277   39864      NA      NA      NA      NA      NA      NA      NA       NA       NA
11  460147  537454  622700  746258  908420 1114756 1380631 1606903 1709242  2007280  2535234
12    4837   14181  135177      NA      NA      NA      NA      NA      NA       NA       NA
13  112216  125015  146608  168493  184735  202322  223003  238380  266505   318085   446292
14   75080  131700  177624  230392  278718  331069  437571  486869  663091   802178   763956
15  140424  187748  269493  391422  528542  752619  968470 1468211 1897414  2771305  4951560
16      NA      NA      NA      NA      NA      NA      NA      NA      NA       NA       NA
17 1057286 1184109 1542180 1837353 2216331 2609121 2895832 2908506 3123723  3444578  3943116
18      NA      NA      NA      NA      NA      NA      NA      NA      NA       NA   632772
19      NA      NA      NA      NA  154001  191909  255881  368336  422770   499794       NA
20      NA      NA      NA   84385  161772  325594  431866  445032  524873   588637   667191
21      NA   14999   32610      NA      NA      NA      NA      NA      NA       NA       NA
22 1711951 2539891 3077871 3826351 4821550 5638591 6485280 7630654 7897241  8712176 10081158
23      NA      NA      NA      NA      NA      NA      NA      NA      NA       NA       NA
24      NA      NA      NA      NA  392060      NA      NA      NA      NA       NA       NA
25 1350428 1680637 1978301 2192404 2516462 2700876 2930390 3238503 3427796  3934224  4662498
26      NA      NA      NA      NA      NA      NA      NA      NA      NA       NA       NA
27  674913 1194020 1624615 1911896 2231853 2224771 2404021 2470939 2538268  2621073  2757537
28      NA      NA      NA      NA      NA      NA      NA      NA      NA       NA       NA
29      NA  364399  996096 1427096 1470495 1690949 1769257 1880999 1801028  1905299  2178611
30  107206      NA      NA      NA      NA      NA      NA      NA      NA       NA       NA
31 1155684 1321011 1648690 1858635 2147174 2289905 2416630 2614589 2845627  2944806  3038156
32  708002  726915  939946 1118587 1381625 1656388 1798509 2101593 2363880  2683516  3257022
33      NA      NA      NA      NA      NA      NA      NA      NA      NA       NA       NA
34  628279  626915  648936  661086  694466  742371  768014  797423  847226   913774   969265
      X1970    X1980    X1990    X2000    X2010    X2020 difference
1   3444165  3893888  4040587  4447100  4779736  5024279     248150
2    300382   401851   550043   626932   710231   733391     248150
3        NA       NA       NA       NA       NA       NA     248150
4   1770900  2718215  3665228  5130632  6392017  7151502     248150
5        NA       NA       NA       NA       NA       NA     248150
6   1923295  2286435  2350725  2673400  2915918  3011524     248150
7        NA       NA       NA       NA       NA       NA     248150
8  19953134 23667902 29760021 33871648 37253956 39538223     248150
9   2207259  2889964  3294394  4301261  5029196  5773714     248150
10       NA       NA       NA       NA       NA       NA     248150
11  3031709  3107576  3287116  3405565  3574097  3605944     248150
12       NA       NA       NA       NA       NA       NA     248150
13   548104   594338   666168   783600   897934   989948     248150
14   756510   638333   606900   572059   601723   689545     248150
15  6789443  9746324 12937926 15982378 18801310 21538187     248150
16       NA       NA       NA       NA       NA       NA     248150
17  4589575  5463105  6478216  8186453  9687653 10711908     248150
18   768561   964691  1108229  1211537  1360301  1455271     248150
19       NA       NA       NA       NA       NA       NA     248150
20   712567   943935  1006749  1293953  1567582  1839106     248150
21       NA       NA       NA       NA       NA       NA     248150
22 11113976 11426518 11430602 12419293 12830632 12812508     248150
23       NA       NA       NA       NA       NA       NA     248150
24       NA       NA       NA       NA       NA       NA     248150
25  5193669  5490224  5544159  6080485  6483802  6785528     248150
26       NA       NA       NA       NA       NA       NA     248150
27  2824376  2913808  2776755  2926324  3046355  3190369     248150
28       NA       NA       NA       NA       NA       NA     248150
29  2246578  2363679  2477574  2688418  2853118  2937880     248150
30       NA       NA       NA       NA       NA       NA     248150
31  3218706  3660777  3685296  4041769  4339367  4505836     248150
32  3641306  4205900  4219973  4468976  4533372  4657757     248150
33       NA       NA       NA       NA       NA       NA     248150
34   992048  1124660  1227928  1274923  1328361  1362359     248150
 [ reached 'max' / getOption("max.print") -- omitted 50 rows ]
> data("statepopulations")
> statepopulations %>% mutate(difference = state & 1850) 
   GISJOIN                STATE STATEFP STATENH  X1790  X1800  X1810  X1820  X1830  X1840  X1850
1     G010              Alabama       1      10     NA     NA     NA 127901 309527 590756 771623
2     G020               Alaska       2      20     NA     NA     NA     NA     NA     NA     NA
3     G025     Alaska Territory      NA      25     NA     NA     NA     NA     NA     NA     NA
4     G040              Arizona       4      40     NA     NA     NA     NA     NA     NA     NA
5     G045    Arizona Territory      NA      45     NA     NA     NA     NA     NA     NA     NA
6     G050             Arkansas       5      50     NA     NA     NA     NA     NA  97574 209897
7     G055   Arkansas Territory      NA      55     NA     NA     NA  14273  30388     NA     NA
8     G060           California       6      60     NA     NA     NA     NA     NA     NA  92597
9     G080             Colorado       8      80     NA     NA     NA     NA     NA     NA     NA
10    G085   Colorado Territory      NA      85     NA     NA     NA     NA     NA     NA     NA
11    G090          Connecticut       9      90 237655 251002 261942 275248 297675 309978 370792
12    G095     Dakota Territory      NA      95     NA     NA     NA     NA     NA     NA     NA
13    G100             Delaware      10     100  59096  64273  72674  72749  76748  78085  91532
14    G110 District Of Columbia      11     110     NA  14093  24023  33039  39834  43712  51687
15    G120              Florida      12     120     NA     NA     NA     NA     NA     NA  87445
16    G125    Florida Territory      NA     125     NA     NA     NA     NA  34730  54477     NA
17    G130              Georgia      13     130  82548 162686 252433 340989 516823 691392 906185
18    G150               Hawaii      15     150     NA     NA     NA     NA     NA     NA     NA
19    G155     Hawaii Territory      NA     155     NA     NA     NA     NA     NA     NA     NA
20    G160                Idaho      16     160     NA     NA     NA     NA     NA     NA     NA
21    G165      Idaho Territory      NA     165     NA     NA     NA     NA     NA     NA     NA
22    G170             Illinois      17     170     NA     NA     NA  55211 157445 476183 851470
23    G175   Illinois Territory      NA     175     NA     NA  12282     NA     NA     NA     NA
24    G178     Indian Territory      NA     178     NA     NA     NA     NA     NA     NA     NA
25    G180              Indiana      18     180     NA     NA     NA 147178 343031 685866 988416
26    G185    Indiana Territory      NA     185     NA   5641  24520     NA     NA     NA     NA
27    G190                 Iowa      19     190     NA     NA     NA     NA     NA     NA 192214
28    G195       Iowa Territory      NA     195     NA     NA     NA     NA     NA  43112     NA
29    G200               Kansas      20     200     NA     NA     NA     NA     NA     NA     NA
30    G205     Kansas Territory      NA     205     NA     NA     NA     NA     NA     NA     NA
31    G210             Kentucky      21     210     NA 220955 406511 564317 687917 779828 982405
32    G220            Louisiana      22     220     NA     NA     NA 153407 215739 352411 517762
33    G225  Louisiana Territory      NA     225     NA     NA  20845     NA     NA     NA     NA
34    G230                Maine      23     230     NA     NA     NA 298335 399455 501793 583169
     X1860   X1870   X1880   X1890   X1900   X1910   X1920   X1930   X1940    X1950    X1960
1   964201  996992 1262505 1513017 1828697 2138093 2348174 2646248 2832961  3061743  3266740
2       NA      NA      NA      NA      NA      NA      NA      NA      NA       NA   226167
3       NA      NA   33426   32052   63592   64356   55036   59278   72524   128643       NA
4       NA      NA      NA      NA      NA      NA  334162  435573  499261   749587  1302161
5       NA    9658   40440   59620  122931  204354      NA      NA      NA       NA       NA
6   435450  484471  802525 1128179 1311564 1574449 1752204 1854482 1949387  1909511  1786272
7       NA      NA      NA      NA      NA      NA      NA      NA      NA       NA       NA
8   379994  560247  864694 1208130 1485053 2377549 3426861 5677251 6907387 10586224 15717204
9       NA      NA  194327  412198  539700  799024  939629 1035791 1123296  1325089  1753947
10   34277   39864      NA      NA      NA      NA      NA      NA      NA       NA       NA
11  460147  537454  622700  746258  908420 1114756 1380631 1606903 1709242  2007280  2535234
12    4837   14181  135177      NA      NA      NA      NA      NA      NA       NA       NA
13  112216  125015  146608  168493  184735  202322  223003  238380  266505   318085   446292
14   75080  131700  177624  230392  278718  331069  437571  486869  663091   802178   763956
15  140424  187748  269493  391422  528542  752619  968470 1468211 1897414  2771305  4951560
16      NA      NA      NA      NA      NA      NA      NA      NA      NA       NA       NA
17 1057286 1184109 1542180 1837353 2216331 2609121 2895832 2908506 3123723  3444578  3943116
18      NA      NA      NA      NA      NA      NA      NA      NA      NA       NA   632772
19      NA      NA      NA      NA  154001  191909  255881  368336  422770   499794       NA
20      NA      NA      NA   84385  161772  325594  431866  445032  524873   588637   667191
21      NA   14999   32610      NA      NA      NA      NA      NA      NA       NA       NA
22 1711951 2539891 3077871 3826351 4821550 5638591 6485280 7630654 7897241  8712176 10081158
23      NA      NA      NA      NA      NA      NA      NA      NA      NA       NA       NA
24      NA      NA      NA      NA  392060      NA      NA      NA      NA       NA       NA
25 1350428 1680637 1978301 2192404 2516462 2700876 2930390 3238503 3427796  3934224  4662498
26      NA      NA      NA      NA      NA      NA      NA      NA      NA       NA       NA
27  674913 1194020 1624615 1911896 2231853 2224771 2404021 2470939 2538268  2621073  2757537
28      NA      NA      NA      NA      NA      NA      NA      NA      NA       NA       NA
29      NA  364399  996096 1427096 1470495 1690949 1769257 1880999 1801028  1905299  2178611
30  107206      NA      NA      NA      NA      NA      NA      NA      NA       NA       NA
31 1155684 1321011 1648690 1858635 2147174 2289905 2416630 2614589 2845627  2944806  3038156
32  708002  726915  939946 1118587 1381625 1656388 1798509 2101593 2363880  2683516  3257022
33      NA      NA      NA      NA      NA      NA      NA      NA      NA       NA       NA
34  628279  626915  648936  661086  694466  742371  768014  797423  847226   913774   969265
      X1970    X1980    X1990    X2000    X2010    X2020 difference
1   3444165  3893888  4040587  4447100  4779736  5024279       TRUE
2    300382   401851   550043   626932   710231   733391       TRUE
3        NA       NA       NA       NA       NA       NA       TRUE
4   1770900  2718215  3665228  5130632  6392017  7151502       TRUE
5        NA       NA       NA       NA       NA       NA       TRUE
6   1923295  2286435  2350725  2673400  2915918  3011524       TRUE
7        NA       NA       NA       NA       NA       NA       TRUE
8  19953134 23667902 29760021 33871648 37253956 39538223       TRUE
9   2207259  2889964  3294394  4301261  5029196  5773714       TRUE
10       NA       NA       NA       NA       NA       NA       TRUE
11  3031709  3107576  3287116  3405565  3574097  3605944       TRUE
12       NA       NA       NA       NA       NA       NA       TRUE
13   548104   594338   666168   783600   897934   989948       TRUE
14   756510   638333   606900   572059   601723   689545       TRUE
15  6789443  9746324 12937926 15982378 18801310 21538187       TRUE
16       NA       NA       NA       NA       NA       NA       TRUE
17  4589575  5463105  6478216  8186453  9687653 10711908       TRUE
18   768561   964691  1108229  1211537  1360301  1455271       TRUE
19       NA       NA       NA       NA       NA       NA       TRUE
20   712567   943935  1006749  1293953  1567582  1839106       TRUE
21       NA       NA       NA       NA       NA       NA       TRUE
22 11113976 11426518 11430602 12419293 12830632 12812508       TRUE
23       NA       NA       NA       NA       NA       NA       TRUE
24       NA       NA       NA       NA       NA       NA       TRUE
25  5193669  5490224  5544159  6080485  6483802  6785528       TRUE
26       NA       NA       NA       NA       NA       NA       TRUE
27  2824376  2913808  2776755  2926324  3046355  3190369       TRUE
28       NA       NA       NA       NA       NA       NA       TRUE
29  2246578  2363679  2477574  2688418  2853118  2937880       TRUE
30       NA       NA       NA       NA       NA       NA       TRUE
31  3218706  3660777  3685296  4041769  4339367  4505836       TRUE
32  3641306  4205900  4219973  4468976  4533372  4657757       TRUE
33       NA       NA       NA       NA       NA       NA       TRUE
34   992048  1124660  1227928  1274923  1328361  1362359       TRUE
 [ reached 'max' / getOption("max.print") -- omitted 50 rows ]
> mydata <- gayguides %>% 
+             select(title, Year) %>%
+             group_by(Year)
> gayguides %>% 
+   select(locations) %>%
+   group_by(state) %>%
+   summarize(count = n())
Error in `select()`:
! Can't subset columns that don't exist.
✖ Column `locations` doesn't exist.
Run `rlang::last_trace()` to see where the error occurred.
> gayguides %>% 
  +   select("locations") %>%
  +   group_by(state) %>%
  +   summarize(count = n())
Error in `select()`:
  ! Can't subset columns that don't exist.
✖ Column `locations` doesn't exist.
Run `rlang::last_trace()` to see where the error occurred.
> mydata <- gayguides %>% gayguides %>% 
+   select("locations") %>%
+   group_by(state) %>%
+   summarize(count = n())
Error in gayguides(.) : could not find function "gayguides"
> mydata <- gayguides %>% 
+   select("locations") %>%
+   group_by(state) %>%
+   summarize(count = n())
Error in `select()`:
! Can't subset columns that don't exist.
✖ Column `locations` doesn't exist.
Run `rlang::last_trace()` to see where the error occurred.
> gayguides %>% 
  +   select("south Carolina", 1970:1975) %>%
  +   group_by("City") %>%
  +   locations per city
Error: unexpected symbol in:
  "  group_by("City") %>%
  locations per"
> ```{r}
Error: attempt to use zero-length variable name
> ```{r}
Error: attempt to use zero-length variable name
> almshouse.occupations <- read.csv(file="https://raw.githubusercontent.com/regan008/DigitalMethodsData/main/raw/almshouse-occupationalcodes.csv", header=TRUE)
> ```
Error: attempt to use zero-length variable name
> ```{r}
Error: attempt to use zero-length variable name
> ```{r}
Error: attempt to use zero-length variable name
> sc.parks <- sc.parks %>%
  +   pivot_longer(!city:type_of_worker, names_to = "year", values_to = "count")
Error in pivot_longer(., !city:type_of_worker, names_to = "year", values_to = "count") : 
  could not find function "pivot_longer"

(@) Here's another wide data frame. Can you turn this from a wide to a narrow data frame? 
  ```{r}
rec.spaces <- read.csv("https://raw.githubusercontent.com/regan008/DigitalMethodsData/main/raw/PlayAreabyType.csv")
```

The opposite of `pivot_longer()` is `pivot_wider()`. It "widens" data by increasing the number of columns and decreasing the number of rows. We can revert `sc.parks` back to a wide dataset using this function.
```{r}
sc.parks %>%
  pivot_wider(names_from = year, values_from = count)
```

(@) Widen the `sc.parks` dataset so that the column names are drawn from the type of recreation worker.
```{r}
sc.parks %>%
  pivot_wider(names_from = year, values_from = count)
```

(@) Turn `rec.spaces` into a wide dataframe. 
```{r}
library(tidy)
head(sc.parks)
sc.parks ,- read csv
sc.parks %>%
  pivot_wider(names_from = year, values_from = count)
  
view(scparks)
?pivot longer

scpstkd
city
type of worker

pivot_longer(!city:type_of_worker, Names_to = "year", values_to
sc.parks <- sc.parks %>% pivot_wider (names_from = year, values_ = count)

fish_encounters


```


## Putting it all together
Each of the functions covered in this worksheet are valuable tools for manipulating datasets. But they are more powerful when combined. When using them to pair down a dataset, we are asking and answering a question. For example in this code from earlier in our worksheet:
  ```{r}
gayguides %>% 
  select(title, Year) %>%
  group_by(Year) %>%
  summarize(count = n())
```
The implicit question was, "How many locations appear in each year?". 
The `judges` dataset in provided in the DigitalMethodsData package is a large, messy, 
wide dataframe that contains a lot of information. 
Look at this dataframe and then compose a question to ask of the data.

(@) First, tell me, what is the question you are asking? 
  ```{r}

```

(@) Now write some code to address that question. Comment the code with notes that explain your thinking as you go. Use functions like select(), filter(), etc to pair down your dataset and reshape it to address your question. 
```{r}

```

(@) Now ask a question of the `gayguides` data (or another dataset of your choice). What is the question you are asking? 
  ```{r}
gayguides %>% 
  select(title, Year) %>%
  group_by(Year) %>%
  summarize(count = n())
```

(@) Now write some code to address that question. Comment the code with notes that explain your thinking as you go. Use functions like select(), filter(), etc to pair down your dataset and reshape it to address your question. 
```{r}
gayguides %>% 
  select(title, Year) %>%
  group_by(Year) %>%
  summarize(count = n())
```

(@) Write a function that filters the gay guides dataset. It should accept 2 arguments: year and state. When passed to the function the function should return only the title, type, state and year for each entry. 
```{r}
gayguides %>% 
  select(title, Year) %>%
  group_by(Year) %>%
  summarize(count = n())git
  
  
  
  
  gayguides %>% select(description, city, year, state, ) %>% filter state == southernstates
  
  filter(state%>%)
  
  ss <- gayguides %>% 
  663 Meg
  ss
  
  Joins---------------------------------------------------------
  takes data from two data bases (id) variable
  more information in another data set
  year occupation, title
  occupation 2
  OO2 as a carpenter
  code means XXX
  take 2 and make carpenter
  left join to a larger data set
  full joins from both data sets
  left join is the most common
  
  
  data(almshouse)
  gender descriptions by clerk
  
  head
  occupations code key
  marry together
  
  almshouse_admissions <- left_join(almshouse_admissions, almshoud.occupations, by= c("Descriptions.by.Clerk"="code))
  look at tidyverse website
  w/censusregions.csv"
  View(regions)
  
  
  mggdata ,- read RDS("data.rds")
  mgg.aminitycode.format <- function(year1, year2, original amentiy, new amenity) { included.data <<mggdata %>% filter }
  almshouse admissions example
  almshous_admissions 
  SAMPLE
  Library(DigitalMethodsData)
  
  gg.
  
  gg.filter <- function(year.designated, state.designated) {
  
  data(gayguides) gg <-data(gayguides); gg <- gg%>% select(Year, state, title, type) %>% filter(Year == year.designated & state = state.designated
  )
  gg.gilter(1880,NY) 
  -------------------------------------------------------------------------
  
  gg.byyear <- gayguides %>% group_by(Year) %>% summarize(count = n())
  
  ggplot(data = gg.byyear, mapping = aes(x=Year, y=count)) + geom_col()
  
  --------------------------------------------------------------------------
  
  gg.byyear <- gayguides %>% filter(state == "SC") %>% group_by(Year)
  %>% summarize(count = n())
  
  ggplot(data = gg.byyear, mapping = aes(x=Year, y=count)) + geom_col()
  
  ----------------------------------------------------------------------------------------------
  
  state year count
  group_by (Year,state)
  + facet_wrap(~
  
  ggplot2 cookbook
  ????????????????????
  
  Data Visualization
  online book
  on graphts
  Charts that are stacked
  
  inquire locally
  burned
  risk data set
  risk in guides
  
  data("BostonWomensVoters")
  
  ``
  
  
  
  
  
  
  
  
  ``
  )
  
  R Graph Gallery
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
```

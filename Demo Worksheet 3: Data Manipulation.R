---
  title: 'Worksheet 3: Data Manipulation'
author: "Will Hiott"
date: "2023-02-18"
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
select("gayguides")
  mutate("locations")
```

(@) What did you do to save the data to a new data frame? Why? 

>

(@) Can you use `select()` to grab all the columns of `gayguides` EXCEPT for the city and state? Hint: You might want to read the documentation for this function. 
```{r}

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

gayguides %>% 
  filter(city == "Greenville" | state == "South Carolina")
```

(@) The above code grabs every location where the city is Greenville. However, there is more than one city named Greenville. Can you filter to retrieve Greenville, SC? 

```{r}

```

(@) How about every location between 1975 and 1980? 

```{r}

gayguides %>% filter(Year == 1975 | Year == 1980)

```


(@) Every entry in Greenville, SC between 1975 and 1980? 

```{r}
gayguides %>% filter(Year == 1975 | Year == 1980)
gayguides %>% filter(Location == "Greenville")
```

(@) Can you find all locations in 1975 except for New York and San Francisco? 
```{r}
gayguides %>% filter(Year == 1975)
gayguides %>% filter(Location == "Greenville")
gayguides %>% filter(City == except "New York", "San" "francisco")
```

(@) The amenity features column in gay guides contains a comma separated list of categorizations. (G), for example, stands for girls. However, this language changed over time and women's locations eventually are described as (L). What if we want to filter by any entry that has (G) OR (L) in the amenity feature column?  This is a bit more complicated because the entries are a comma separated list and (G) or (L) is often paired with other categorizations. How might you _search the dataframe for entries that match_ (G) or (L)?
  ```{r}

```

### Mutate
The `mutate()` function adds new variables and preserves existing one. This is useful when you want to create a new column based on other values. For example, in the `statepopulation` dataset, we want to ask "How much did the population increase between 1800 and 1900 in each state?." We can do that by subtracting the population in 1900 from 1800 and storing that value in a new column. 

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


(@) In the Boston Women Voters dataset, every voter is given an age. Can you use their age to calculate each person's birth year? (Assume all this data was collected in 1920.)
```{r}
data('BostonWomensVoters')
library("BostonWomensVoters")
BostonWomensVoters %>% mutate(age) 
BostonWomensVoters %>% filter(Year == 1920)

```

(@) Can you create a new column that combines the city and state columns in `gayguides` into a new column called location? It should list the city, state. (i.e. San Diego, CA)

```{r}

```

### Arrange
`Arrange()` orders the rows of a data frame by the values of selected columns. In other words it sorts a data frame by a variable. In the `gayguides` data, we can sort the data by year with the earliest year first. If we wanted the latest year first, we could do so by using the `desc()` function. 

```{r}
#| eval: false

gayguides %>%
  arrange(Year)

gayguides %>%
  arrange(desc(Year))
```


(@) Using the `statepopulation` data, which state has the largest population in 1850? Write code that pulls only the relevant columns (state and 1850) and sorts it accordingly. 
```{r}
 

```

### Group_by() and Summarize()

Arrange is useful for finding the highest and lowest values, but it returns those values for the entire dataset. `group_by()`, in contrast, takes an existing tbl and converts it into a grouped tbl where operations are performed "by group". Lets look at what that means in practice: 
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
What happened here? In this example, we asked group_by to create groups based on year and then in summarize we created a column called count. We passed it the n() function which gives the current group size. What results, is a dataset that lists each year and how many locations that state has. 

(@) You try, use group_by and summarize to find the total number of locations in each state, each year.
```{r}
{(1 * 1)
}
```

(@) Summarize can do more than just count rows. Can you use `summarize()` to find the average age for each occupation in the Boston Women Voters data?
  ```{r}

```

(@) In the `gayguides` data, on average how many locations did each city in South Carolina have between 1970 and 1975?
  ```{r}

```

(@) Filter the dataset for only the values in the southernstates list (created in the block below). Then tell me, how many locations were in all the southern states in 1975?
  ```{r}
southernstates <- c("AL", "AR", "FL", "GA", "KY", "LA", "MD", "MS", "NC", "SC", "TN", "TX", "VI", "WV")

```

## Re-Shaping Data: Joins and Pivots

### Joins()
At some point, you might have a situation where you want to join two tables together. For example, in the `almshouse_admissions` dataset there is a column called "Descriptions.by.Clerk" which contains a code for each occupation.
```{r}
data("almshouse_admissions")
head(almshouse_admissions$Descriptions.by.Clerk)
```
For the purposes of working with this data in R, having only the code isn't very useful. The code book for these occupations is available here: 
```{r}
almshouse.occupations <- read.csv(file="https://raw.githubusercontent.com/regan008/DigitalMethodsData/main/raw/almshouse-occupationalcodes.csv", header=TRUE)
```

A join allows us to join these two dataframes together, matching each row based on the occupational code provided in the `Descriptions.by.Clerk` column. To do that we'll use a function known as a mutating join. A mutating join allows you to combine variables from two tables. It first matches observations by their keys, then copies across variables from one table to the other. In this case we want to join the matching rows from `almshouse.occupations` to `almshouse_admissions`. In an ideal world, the column names in the two data frames would match but since that isn't the case, we'll have to specify what columns `left_join` should use to join the two data frames. 

```{r}
almshouse_admissions <- left_join(almshouse_admissions, almshouse.occupations, by=c("Descriptions.by.Clerk"="code"))

head(almshouse_admissions)
```

(@) Below I've downloaded data about each of the census regions. Join this dataset with `gayguides`. Create a data frame that includes each of the regions and the total number of locations in 1980. How many locations appear in the Mountain region in 1980?
```{r}
regions <- read.csv("https://raw.githubusercontent.com/regan008/DigitalMethodsData/main/raw/censusregions.csv")
```

(@) Explain what you did above. What variable did you join by and why? What results?

(@)How much did LGTBQ life grow between 1970 and 1980? Can you create a data frame that computes the growth in the number of locations between 1970 and 1980 for every state? For every region? 
```{r}

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
>

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

```

(@) Turn `rec.spaces` into a wide dataframe. 
```{r}

```


## Putting it all together
Each of the functions covered in this worksheet are valuable tools for manipulating datasets. But they are more powerful when combined. When using them to pair down a dataset, we are asking and answering a question. For example in this code from earlier in our worksheet:
  ```{r}
gayguides %>% 
  select(title, Year) %>%
  group_by(Year) %>%
  summarize(count = n())
```
The implicit question was, "How many locations appear in each year?". The `judges` dataset in provided in the DigitalMethodsData package is a large, messy, wide dataframe that contains a lot of information. Look at this dataframe and then compose a question to ask of the data.

(@) First, tell me, what is the question you are asking? 
  ```{r}

```

(@) Now write some code to address that question. Comment the code with notes that explain your thinking as you go. Use functions like select(), filter(), etc to pair down your dataset and reshape it to address your question. 
```{r}

```

(@) Now ask a question of the `gayguides` data (or another dataset of your choice). What is the question you are asking? 
  ```{r}

```

(@) Now write some code to address that question. Comment the code with notes that explain your thinking as you go. Use functions like select(), filter(), etc to pair down your dataset and reshape it to address your question. 
```{r}

```

(@) Write a function that filters the gay guides dataset. It should accept 2 arguments: year and state. When passed to the function the function should return only the title, type, state and year for each entry. 
```{r}

```

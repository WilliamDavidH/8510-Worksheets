#Formulate your question
#Read in your data
#Check the packaging
#Run str()
#Look at the top and the bottom of your data
#Check your “n”s
#Validate with at least one external data source
#Try the easy solution first
#Challenge your solution
#Follow up

#Will Hiott
#March 6, 2024
#Exploratory Data Analysis

library(dbplyr)

options(width = 105)

#4.1 Formulate your question----------------------------------------------------
-------------------------------------------------------------------------------------
#Are air pollution levels higher on the east coast than on the west coast?

#But a more specific question might be

#-------------------------------------------------------------EXAMPLE----------------
#Are hourly ozone levels on average higher in New York City than they are in Los Angeles?
#Which counties in the United States have the highest levels of ambient ozone pollution?

4.2 Read in your data------------------------------------------DRAFT-------------------
library(DigitalMethodsData)
data("statepopulations")

dim(statepopulations)

#[1] 84 28

str(statepopulations)

#Completed

'data.frame':	84 obs. of  28 variables:
  $ GISJOIN: chr  "G010" "G020" "G025" "G040" ...
$ STATE  : chr  "Alabama" "Alaska" "Alaska Territory" "Arizona" ...
$ STATEFP: int  1 2 NA 4 NA 5 NA 6 8 NA ...
$ STATENH: int  10 20 25 40 45 50 55 60 80 85 ...
$ X1790  : int  NA NA NA NA NA NA NA NA NA NA ...
$ X1800  : int  NA NA NA NA NA NA NA NA NA NA ...
$ X1810  : int  NA NA NA NA NA NA NA NA NA NA ...
$ X1820  : int  127901 NA NA NA NA NA 14273 NA NA NA ...
$ X1830  : int  309527 NA NA NA NA NA 30388 NA NA NA ...
$ X1840  : int  590756 NA NA NA NA 97574 NA NA NA NA ...
$ X1850  : int  771623 NA NA NA NA 209897 NA 92597 NA NA ...
$ X1860  : int  964201 NA NA NA NA 435450 NA 379994 NA 34277 ...
$ X1870  : int  996992 NA NA NA 9658 484471 NA 560247 NA 39864 ...
$ X1880  : int  1262505 NA 33426 NA 40440 802525 NA 864694 194327 NA ...
$ X1890  : int  1513017 NA 32052 NA 59620 1128179 NA 1208130 412198 NA ...
$ X1900  : int  1828697 NA 63592 NA 122931 1311564 NA 1485053 539700 NA ...
$ X1910  : int  2138093 NA 64356 NA 204354 1574449 NA 2377549 799024 NA ...
$ X1920  : int  2348174 NA 55036 334162 NA 1752204 NA 3426861 939629 NA ...
$ X1930  : int  2646248 NA 59278 435573 NA 1854482 NA 5677251 1035791 NA ...
$ X1940  : int  2832961 NA 72524 499261 NA 1949387 NA 6907387 1123296 NA ...
$ X1950  : int  3061743 NA 128643 749587 NA 1909511 NA 10586224 1325089 NA ...
$ X1960  : int  3266740 226167 NA 1302161 NA 1786272 NA 15717204 1753947 NA ...
$ X1970  : int  3444165 300382 NA 1770900 NA 1923295 NA 19953134 2207259 NA ...
$ X1980  : int  3893888 401851 NA 2718215 NA 2286435 NA 23667902 2889964 NA ...
$ X1990  : int  4040587 550043 NA 3665228 NA 2350725 NA 29760021 3294394 NA ...
$ X2000  : int  4447100 626932 NA 5130632 NA 2673400 NA 33871648 4301261 NA ...
$ X2010  : int  4779736 710231 NA 6392017 NA 2915918 NA 37253956 5029196 NA ...
$ X2020  : int  5024279 733391 NA 7151502 NA 3011524 NA 39538223 5773714 NA ...

names(statepopulations)

> names(statepopulations)
#Completed
[1] "GISJOIN" "STATE"   "STATEFP" "STATENH" "X1790"   "X1800"   "X1810"  
[8] "X1820"   "X1830"   "X1840"   "X1850"   "X1860"   "X1870"   "X1880"  
[15] "X1890"   "X1900"   "X1910"   "X1920"   "X1930"   "X1940"   "X1950"  
[22] "X1960"   "X1970"   "X1980"   "X1990"   "X2000"   "X2010"   "X2020"  

head(select(statepopulations, GISJOIN:STATENH))

GISJOIN             STATE STATEFP STATENH
1    G010           Alabama       1      10
2    G020            Alaska       2      20
3    G025  Alaska Territory      NA      25
4    G040           Arizona       4      40
5    G045 Arizona Territory      NA      45
6    G050          Arkansas       5      50

#Completed

head(select(statepopulations, -(GISJOIN:STATENH)))

X1790 X1800 X1810  X1820  X1830  X1840  X1850  X1860  X1870   X1880
1    NA    NA    NA 127901 309527 590756 771623 964201 996992 1262505
2    NA    NA    NA     NA     NA     NA     NA     NA     NA      NA
3    NA    NA    NA     NA     NA     NA     NA     NA     NA   33426
4    NA    NA    NA     NA     NA     NA     NA     NA     NA      NA
5    NA    NA    NA     NA     NA     NA     NA     NA   9658   40440
6    NA    NA    NA     NA     NA  97574 209897 435450 484471  802525
X1890   X1900   X1910   X1920   X1930   X1940   X1950   X1960   X1970
1 1513017 1828697 2138093 2348174 2646248 2832961 3061743 3266740 3444165
2      NA      NA      NA      NA      NA      NA      NA  226167  300382
3   32052   63592   64356   55036   59278   72524  128643      NA      NA
4      NA      NA      NA  334162  435573  499261  749587 1302161 1770900
5   59620  122931  204354      NA      NA      NA      NA      NA      NA
6 1128179 1311564 1574449 1752204 1854482 1949387 1909511 1786272 1923295
X1980   X1990   X2000   X2010   X2020
1 3893888 4040587 4447100 4779736 5024279
2  401851  550043  626932  710231  733391
3      NA      NA      NA      NA      NA
4 2718215 3665228 5130632 6392017 7151502
5      NA      NA      NA      NA      NA
6 2286435 2350725 2673400 2915918 3011524
#Complete

> library(readr)

#4.3 Check the packaging EXAMPLE STATE POPULATIONS--------------------------------------

nrow(statepopulations)
#[1] 84

ncol(statepopulations)
#[1] 28
#DONE

#4.4 Run str()------------------------------------------------------------------

str(statepopulations)

#DONE BELOW

'data.frame':	84 obs. of  28 variables:
  $ GISJOIN: chr  "G010" "G020" "G025" "G040" ...
$ STATE  : chr  "Alabama" "Alaska" "Alaska Territory" "Arizona" ...
$ STATEFP: int  1 2 NA 4 NA 5 NA 6 8 NA ...
$ STATENH: int  10 20 25 40 45 50 55 60 80 85 ...
$ X1790  : int  NA NA NA NA NA NA NA NA NA NA ...
$ X1800  : int  NA NA NA NA NA NA NA NA NA NA ...
$ X1810  : int  NA NA NA NA NA NA NA NA NA NA ...
$ X1820  : int  127901 NA NA NA NA NA 14273 NA NA NA ...
$ X1830  : int  309527 NA NA NA NA NA 30388 NA NA NA ...
$ X1840  : int  590756 NA NA NA NA 97574 NA NA NA NA ...
$ X1850  : int  771623 NA NA NA NA 209897 NA 92597 NA NA ...
$ X1860  : int  964201 NA NA NA NA 435450 NA 379994 NA 34277 ...
$ X1870  : int  996992 NA NA NA 9658 484471 NA 560247 NA 39864 ...
$ X1880  : int  1262505 NA 33426 NA 40440 802525 NA 864694 194327 NA ...
$ X1890  : int  1513017 NA 32052 NA 59620 1128179 NA 1208130 412198 NA ...
$ X1900  : int  1828697 NA 63592 NA 122931 1311564 NA 1485053 539700 NA ...
$ X1910  : int  2138093 NA 64356 NA 204354 1574449 NA 2377549 799024 NA ...
$ X1920  : int  2348174 NA 55036 334162 NA 1752204 NA 3426861 939629 NA ...
$ X1930  : int  2646248 NA 59278 435573 NA 1854482 NA 5677251 1035791 NA ...
$ X1940  : int  2832961 NA 72524 499261 NA 1949387 NA 6907387 1123296 NA ...
$ X1950  : int  3061743 NA 128643 749587 NA 1909511 NA 10586224 1325089 NA ...
$ X1960  : int  3266740 226167 NA 1302161 NA 1786272 NA 15717204 1753947 NA ...
$ X1970  : int  3444165 300382 NA 1770900 NA 1923295 NA 19953134 2207259 NA ...
$ X1980  : int  3893888 401851 NA 2718215 NA 2286435 NA 23667902 2889964 NA ...
$ X1990  : int  4040587 550043 NA 3665228 NA 2350725 NA 29760021 3294394 NA ...
$ X2000  : int  4447100 626932 NA 5130632 NA 2673400 NA 33871648 4301261 NA ...
$ X2010  : int  4779736 710231 NA 6392017 NA 2915918 NA 37253956 5029196 NA ...
$ X2020  : int  5024279 733391 NA 7151502 NA 3011524 NA 39538223 5773714 NA ...

#4.5 Look at the top and the bottom of your data-------------------------------------------

head(statepopulations[, c(6:7, 10)])

> head(statepopulations[, c(6:7, 10)])
X1800 X1810  X1840
1    NA    NA 590756
2    NA    NA     NA
3    NA    NA     NA
4    NA    NA     NA
5    NA    NA     NA
6    NA    NA  97574

DONE--------------------------------------------------------------------------------------
  tail(statepopulations[, c(6:7, 10)])

> tail(statepopulations[, c(6:7, 10)])
X1800 X1810 X1840
79    NA    NA    NA
80    NA    NA 30945
81    NA    NA    NA
82    NA    NA    NA
83    NA    NA    NA
84    NA    NA    NA
#DONE----------------------------------------------------------------------------------

#4.6 Check your “n”s-------------------------------------------------------------------

table(statepopulations$GISJOIN.STATE)
Length  Class   Mode 
0   NULL   NULL 
#--------------------------------------------------------------------?

#4.7 Validate with at least one external data source

summary(statepopulations$Sample.Measurement)

#Length  Class   Mode 
#0   NULL   NULL 
#--------------------------------------------------------------------?

#4.8 Try the easy solution first-------------------------------------
EXAMPLE
> ranking <- group_by(ozone, State.Name, County.Name) %>%
  +         summarize(ozone = mean(Sample.Measurement)) %>%
  +         as.data.frame %>%
  +         arrange(desc(ozone))

#--------------------------------------------------------------------?
4.9 Challenge your solution
EXAMPLE
> set.seed(10234)
> N <- nrow(ozone)
> idx <- sample(N, N, replace = TRUE)
> ozone2 <- ozone[idx, ]

4.10 Follow up questions-----------------------------------------------------------------
Do you have the right data? 
NO

Sometimes at the conclusion of an exploratory data analysis, the conclusion is that the dataset is not really appropriate for this question. 
TRUE

Do you need other data? 
YES

Do you have the right question? 
NOT REALLY

BUT I GUESS THAT IS THE IDEA OF EXPLORATORY DATA ANALYSIS.
YOU DONT KNOW WHAT YOU DONT KNOW
SO THE PROCESS IS EXPLORATION
SOME MAY BE USEFUL LIKE THE OZONE EXAMPLE FROM PENG
HOWEVER, SOME MAY NOT LIKE THE statepopulations data.class(
  
)
#---------------------------------------------------------------------------------- 
  > ozone <- read_csv("data/hourly_44201_2014.csv", 
                      +                   col_types = "ccccinnccccccncnncccccc")
Error in `select()`:
  ! Can't subset columns past the end.
ℹ Locations 250000, 249999, 249998, …, 30, and 29 don't exist.
ℹ There are only 28 columns.

NPS <- readRDS("NPS")
dim(NPS)

#4.1 Formulate your question

#Are air pollution levels higher on the east coast than on the west coast?

#But a more specific question might be

#Are hourly ozone levels on average higher in New York City than they are in Los Angeles?
#Which counties in the United States have the highest levels of ambient ozone pollution?

#4.2 Read in your data-----------------------------------------------EXAMPLE-----------

#  > library(readr)
#> ozone <- read_csv("data/hourly_44201_2014.csv", 
+                   col_types = "ccccinnccccccncnncccccc")

#> names(ozone) <- make.names(names(ozone))

#4.3 Check the packaging--------------------------------------EXAMPLE----------------

#> nrow(ozone)
#[1] 7147884
#> ncol(ozone)
#[1] 23

#4.4 Run str()--------------------------------------------------EXAMPLE--------------

#> str(ozone)
#Classes 'tbl_df', 'tbl' and 'data.frame':   7147884 obs. of  23 variables:
# $ State.Code         : chr  "01" "01" "01" "01" ...
#$ County.Code        : chr  "003" "003" "003" "003" ...
#$ Site.Num           : chr  "0010" "0010" "0010" "0010" ...
#$ Parameter.Code     : chr  "44201" "44201" "44201" "44201" ...
#$ POC                : int  1 1 1 1 1 1 1 1 1 1 ...
#$ Latitude           : num  30.5 30.5 30.5 30.5 30.5 ...
#$ Longitude          : num  -87.9 -87.9 -87.9 -87.9 -87.9 ...
#$ Datum              : chr  "NAD83" "NAD83" "NAD83" "NAD83" ...
$ Parameter.Name     : chr  "Ozone" "Ozone" "Ozone" "Ozone" ...
$ Date.Local         : chr  "2014-03-01" "2014-03-01" "2014-03-01" "2014-03-01" ...
$ Time.Local         : chr  "01:00" "02:00" "03:00" "04:00" ...
$ Date.GMT           : chr  "2014-03-01" "2014-03-01" "2014-03-01" "2014-03-01" ...
$ Time.GMT           : chr  "07:00" "08:00" "09:00" "10:00" ...
$ Sample.Measurement : num  0.047 0.047 0.043 0.038 0.035 0.035 0.034 0.037 0.044 0.046 ...
$ Units.of.Measure   : chr  "Parts per million" "Parts per million" "Parts per million" "Parts per million" ...
$ MDL                : num  0.005 0.005 0.005 0.005 0.005 0.005 0.005 0.005 0.005 0.005 ...
$ Uncertainty        : num  NA NA NA NA NA NA NA NA NA NA ...
$ Qualifier          : chr  "" "" "" "" ...
$ Method.Type        : chr  "FEM" "FEM" "FEM" "FEM" ...
$ Method.Name        : chr  "INSTRUMENTAL - ULTRA VIOLET" "INSTRUMENTAL - ULTRA VIOLET" "INSTRUMENTAL - ULTRA VIOLET" "INSTRUMENTAL - ULTRA VIOLET" ...
$ State.Name         : chr  "Alabama" "Alabama" "Alabama" "Alabama" ...
$ County.Name        : chr  "Baldwin" "Baldwin" "Baldwin" "Baldwin" ...
$ Date.of.Last.Change: chr  "2014-06-30" "2014-06-30" "2014-06-30" "2014-06-30" ...

#4.5 Look at the top and the bottom of your data------------EXAMPLE------------------

#> head(ozone[, c(6:7, 10)])
#Latitude Longitude Date.Local
#1   30.498 -87.88141 2014-03-01
2   30.498 -87.88141 2014-03-01
3   30.498 -87.88141 2014-03-01
4   30.498 -87.88141 2014-03-01
5   30.498 -87.88141 2014-03-01
6   30.498 -87.88141 2014-03-01

> tail(ozone[, c(6:7, 10)])
Latitude Longitude Date.Local
7147879 18.17794 -65.91548 2014-09-30
7147880 18.17794 -65.91548 2014-09-30
7147881 18.17794 -65.91548 2014-09-30
7147882 18.17794 -65.91548 2014-09-30
7147883 18.17794 -65.91548 2014-09-30
7147884 18.17794 -65.91548 2014-09-30

4.6 Check your “n”s

> table(ozone$Time.Local)

00:00  00:01  01:00  01:02  02:00  02:03  03:00 
288698      2 290871      2 283709      2 282951 
03:04  04:00  04:05  05:00  05:06  06:00  06:07 
2 288963      2 302696      2 302356      2 
07:00  07:08  08:00  08:09  09:00  09:10  10:00 
300950      2 298566      2 297154      2 297132 
10:11  11:00  11:12  12:00  12:13  13:00  13:14 
2 298125      2 298297      2 299997      2 
14:00  14:15  15:00  15:16  16:00  16:17  17:00 
301410      2 302636      2 303387      2 303806 
17:18  18:00  18:19  19:00  19:20  20:00  20:21 
2 303795      2 304268      2 304268      2 
21:00  21:22  22:00  22:23  23:00  23:24 
303551      2 295701      2 294549      2 

> library(dplyr)
> filter(ozone, Time.Local == "13:14") %>% 
  +         select(State.Name, County.Name, Date.Local, 
                   +                Time.Local, Sample.Measurement)
# A tibble: 2 x 5
State.Name County.Name Date.Local Time.Local
<chr>      <chr>       <chr>      <chr>     
  1 New York   Franklin    2014-09-30 13:14     
2 New York   Franklin    2014-09-30 13:14     
# … with 1 more variable:
#   Sample.Measurement <dbl>

> filter(ozone, State.Code == "36" 
         +        & County.Code == "033" 
         +        & Date.Local == "2014-09-30") %>%
  +         select(Date.Local, Time.Local, 
                   +                Sample.Measurement) %>% 
  +         as.data.frame

Date.Local Time.Local Sample.Measurement
1  2014-09-30      00:01              0.011
2  2014-09-30      01:02              0.012
3  2014-09-30      02:03              0.012
4  2014-09-30      03:04              0.011
5  2014-09-30      04:05              0.011
6  2014-09-30      05:06              0.011
7  2014-09-30      06:07              0.010
8  2014-09-30      07:08              0.010
9  2014-09-30      08:09              0.010
10 2014-09-30      09:10              0.010
11 2014-09-30      10:11              0.010
12 2014-09-30      11:12              0.012
13 2014-09-30      12:13              0.011
14 2014-09-30      13:14              0.013
15 2014-09-30      14:15              0.016
16 2014-09-30      15:16              0.017
17 2014-09-30      16:17              0.017
18 2014-09-30      17:18              0.015
19 2014-09-30      18:19              0.017
20 2014-09-30      19:20              0.014
21 2014-09-30      20:21              0.014
22 2014-09-30      21:22              0.011
23 2014-09-30      22:23              0.010
24 2014-09-30      23:24              0.010
25 2014-09-30      00:01              0.010
26 2014-09-30      01:02              0.011
27 2014-09-30      02:03              0.011
28 2014-09-30      03:04              0.010
29 2014-09-30      04:05              0.010
30 2014-09-30      05:06              0.010
31 2014-09-30      06:07              0.009
32 2014-09-30      07:08              0.008
33 2014-09-30      08:09              0.009
34 2014-09-30      09:10              0.009
35 2014-09-30      10:11              0.009
36 2014-09-30      11:12              0.011
37 2014-09-30      12:13              0.010
38 2014-09-30      13:14              0.012
39 2014-09-30      14:15              0.015
40 2014-09-30      15:16              0.016
41 2014-09-30      16:17              0.016
42 2014-09-30      17:18              0.014
43 2014-09-30      18:19              0.016
44 2014-09-30      19:20              0.013
45 2014-09-30      20:21              0.013
46 2014-09-30      21:22              0.010
47 2014-09-30      22:23              0.009
48 2014-09-30      23:24              0.009

> select(ozone, State.Name) %>% unique %>% nrow
[1] 52

> unique(ozone$State.Name)

[1] "Alabama"              "Alaska"              
[3] "Arizona"              "Arkansas"            
[5] "California"           "Colorado"            
[7] "Connecticut"          "Delaware"            
[9] "District Of Columbia" "Florida"             
[11] "Georgia"              "Hawaii"              
[13] "Idaho"                "Illinois"            
[15] "Indiana"              "Iowa"                
[17] "Kansas"               "Kentucky"            
[19] "Louisiana"            "Maine"               
[21] "Maryland"             "Massachusetts"       
[23] "Michigan"             "Minnesota"           
[25] "Mississippi"          "Missouri"            
[27] "Montana"              "Nebraska"            
[29] "Nevada"               "New Hampshire"       
[31] "New Jersey"           "New Mexico"          
[33] "New York"             "North Carolina"      
[35] "North Dakota"         "Ohio"                
[37] "Oklahoma"             "Oregon"              
[39] "Pennsylvania"         "Rhode Island"        
[41] "South Carolina"       "South Dakota"        
[43] "Tennessee"            "Texas"               
[45] "Utah"                 "Vermont"             
[47] "Virginia"             "Washington"          
[49] "West Virginia"        "Wisconsin"           
[51] "Wyoming"              "Puerto Rico"         


4.7 Validate with at least one external data source-----------EXAMPLE------------

> summary(ozone$Sample.Measurement)

Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
0.00000 0.02000 0.03200 0.03123 0.04200 0.34900 

> quantile(ozone$Sample.Measurement, seq(0, 1, 0.1))

0%   10%   20%   30%   40%   50%   60%   70% 
  0.000 0.010 0.018 0.023 0.028 0.032 0.036 0.040 
80%   90%  100% 
0.044 0.051 0.349 


4.8 Try the easy solution first--------------------------EXAMPLE-------------------

> ranking <- group_by(ozone, State.Name, County.Name) %>%
  +         summarize(ozone = mean(Sample.Measurement)) %>%
  +         as.data.frame %>%
  +         arrange(desc(ozone))

> head(ranking, 10)

State.Name County.Name      ozone
1  California    Mariposa 0.04992485
2  California      Nevada 0.04866836
3     Wyoming      Albany 0.04834274
4     Arizona     Yavapai 0.04746346
5     Arizona        Gila 0.04722276
6  California        Inyo 0.04659648
7        Utah    San Juan 0.04654895
8     Arizona    Coconino 0.04605669
9  California   El Dorado 0.04595514
10     Nevada  White Pine 0.04465562

> tail(ranking, 10)
State.Name          County.Name       ozone
781      Alaska    Matanuska Susitna 0.020911008
782  Washington              Whatcom 0.020114267
783      Hawaii             Honolulu 0.019813165
784   Tennessee                 Knox 0.018579452
785  California               Merced 0.017200647
786      Alaska Fairbanks North Star 0.014993138
787    Oklahoma                Caddo 0.014677374
788 Puerto Rico               Juncos 0.013738328
789 Puerto Rico              Bayamon 0.010693529
790 Puerto Rico               Catano 0.004685369

> filter(ozone, State.Name == "California" & County.Name == "Mariposa") %>% nrow
[1] 9328

> ozone <- mutate(ozone, Date.Local = as.Date(Date.Local))

> filter(ozone, State.Name == "California" & County.Name == "Mariposa") %>%
  +         mutate(month = factor(months(Date.Local), levels = month.name)) %>%
  +         group_by(month) %>%
  +         summarize(ozone = mean(Sample.Measurement))
# A tibble: 10 x 2

month      ozone
* <fct>      <dbl>
  1 January   0.0408
2 February  0.0388
3 March     0.0455
4 April     0.0498
5 May       0.0505
6 June      0.0564
7 July      0.0522
8 August    0.0554
9 September 0.0512
10 October   0.0469

> filter(ozone, State.Name == "Oklahoma" & County.Name == "Caddo") %>% nrow
[1] 5666

> filter(ozone, State.Name == "Oklahoma" & County.Name == "Caddo") %>%
  +         mutate(month = factor(months(Date.Local), levels = month.name)) %>%
  +         group_by(month) %>%
  +         summarize(ozone = mean(Sample.Measurement))

# A tibble: 9 x 2
month       ozone
* <fct>       <dbl>
  1 January   0.0187 
2 February  0.00206
3 March     0.002  
4 April     0.0232 
5 May       0.0242 
6 June      0.0202 
7 July      0.0191 
8 August    0.0209 
9 September 0.002  


4.9 Challenge your solution---------------------------EXAMPLE----------------------

> set.seed(10234)
> N <- nrow(ozone)
> idx <- sample(N, N, replace = TRUE)
> ozone2 <- ozone[idx, ]

> ranking2 <- group_by(ozone2, State.Name, County.Name) %>%
  +         summarize(ozone = mean(Sample.Measurement)) %>%
  +         as.data.frame %>%
  +         arrange(desc(ozone))

> cbind(head(ranking, 10),
        +       head(ranking2, 10))

State.Name County.Name      ozone State.Name
1  California    Mariposa 0.04992485 California
2  California      Nevada 0.04866836 California
3     Wyoming      Albany 0.04834274    Wyoming
4     Arizona     Yavapai 0.04746346    Arizona
5     Arizona        Gila 0.04722276    Arizona
6  California        Inyo 0.04659648       Utah
7        Utah    San Juan 0.04654895 California
8     Arizona    Coconino 0.04605669    Arizona
9  California   El Dorado 0.04595514 California
10     Nevada  White Pine 0.04465562     Nevada
County.Name      ozone
1     Mariposa 0.04983094
2       Nevada 0.04869841
3       Albany 0.04830520
4      Yavapai 0.04748795
5         Gila 0.04728284
6     San Juan 0.04665711
7         Inyo 0.04652602
8     Coconino 0.04616988
9    El Dorado 0.04611164
10  White Pine 0.04466106

> cbind(tail(ranking, 10),
        +       tail(ranking2, 10))

State.Name          County.Name       ozone
781      Alaska    Matanuska Susitna 0.020911008
782  Washington              Whatcom 0.020114267
783      Hawaii             Honolulu 0.019813165
784   Tennessee                 Knox 0.018579452
785  California               Merced 0.017200647
786      Alaska Fairbanks North Star 0.014993138
787    Oklahoma                Caddo 0.014677374
788 Puerto Rico               Juncos 0.013738328
789 Puerto Rico              Bayamon 0.010693529
790 Puerto Rico               Catano 0.004685369
State.Name          County.Name       ozone
781      Alaska    Matanuska Susitna 0.020806642
782  Washington              Whatcom 0.020043750
783      Hawaii             Honolulu 0.019821603
784   Tennessee                 Knox 0.018814913
785  California               Merced 0.016917933
786      Alaska Fairbanks North Star 0.014933125
787    Oklahoma                Caddo 0.014662867
788 Puerto Rico               Juncos 0.013858010
789 Puerto Rico              Bayamon 0.010578880
790 Puerto Rico               Catano 0.004775807

4.10 Follow up questions-----------------------------------EXAMPLE---------------

chicago <- readRDS("chicago.rds")
dim(chicago)

----------------------------------------------------------HIOTT----------DRAFT
library(DigitalMethodsData)
data("statepopulations")
dim(statepopulations)

#[1] 84 28

str(statepopulations)
#Completed
'data.frame':	84 obs. of  28 variables:
  $ GISJOIN: chr  "G010" "G020" "G025" "G040" ...
$ STATE  : chr  "Alabama" "Alaska" "Alaska Territory" "Arizona" ...
$ STATEFP: int  1 2 NA 4 NA 5 NA 6 8 NA ...
$ STATENH: int  10 20 25 40 45 50 55 60 80 85 ...
$ X1790  : int  NA NA NA NA NA NA NA NA NA NA ...
$ X1800  : int  NA NA NA NA NA NA NA NA NA NA ...
$ X1810  : int  NA NA NA NA NA NA NA NA NA NA ...
$ X1820  : int  127901 NA NA NA NA NA 14273 NA NA NA ...
$ X1830  : int  309527 NA NA NA NA NA 30388 NA NA NA ...
$ X1840  : int  590756 NA NA NA NA 97574 NA NA NA NA ...
$ X1850  : int  771623 NA NA NA NA 209897 NA 92597 NA NA ...
$ X1860  : int  964201 NA NA NA NA 435450 NA 379994 NA 34277 ...
$ X1870  : int  996992 NA NA NA 9658 484471 NA 560247 NA 39864 ...
$ X1880  : int  1262505 NA 33426 NA 40440 802525 NA 864694 194327 NA ...
$ X1890  : int  1513017 NA 32052 NA 59620 1128179 NA 1208130 412198 NA ...
$ X1900  : int  1828697 NA 63592 NA 122931 1311564 NA 1485053 539700 NA ...
$ X1910  : int  2138093 NA 64356 NA 204354 1574449 NA 2377549 799024 NA ...
$ X1920  : int  2348174 NA 55036 334162 NA 1752204 NA 3426861 939629 NA ...
$ X1930  : int  2646248 NA 59278 435573 NA 1854482 NA 5677251 1035791 NA ...
$ X1940  : int  2832961 NA 72524 499261 NA 1949387 NA 6907387 1123296 NA ...
$ X1950  : int  3061743 NA 128643 749587 NA 1909511 NA 10586224 1325089 NA ...
$ X1960  : int  3266740 226167 NA 1302161 NA 1786272 NA 15717204 1753947 NA ...
$ X1970  : int  3444165 300382 NA 1770900 NA 1923295 NA 19953134 2207259 NA ...
$ X1980  : int  3893888 401851 NA 2718215 NA 2286435 NA 23667902 2889964 NA ...
$ X1990  : int  4040587 550043 NA 3665228 NA 2350725 NA 29760021 3294394 NA ...
$ X2000  : int  4447100 626932 NA 5130632 NA 2673400 NA 33871648 4301261 NA ...
$ X2010  : int  4779736 710231 NA 6392017 NA 2915918 NA 37253956 5029196 NA ...
$ X2020  : int  5024279 733391 NA 7151502 NA 3011524 NA 39538223 5773714 NA ...

names(statepopulations)

> names(statepopulations)
#Completed
[1] "GISJOIN" "STATE"   "STATEFP" "STATENH" "X1790"   "X1800"   "X1810"  
[8] "X1820"   "X1830"   "X1840"   "X1850"   "X1860"   "X1870"   "X1880"  
[15] "X1890"   "X1900"   "X1910"   "X1920"   "X1930"   "X1940"   "X1950"  
[22] "X1960"   "X1970"   "X1980"   "X1990"   "X2000"   "X2010"   "X2020"  

head(select(statepopulations, GISJOIN:STATENH))

GISJOIN             STATE STATEFP STATENH
1    G010           Alabama       1      10
2    G020            Alaska       2      20
3    G025  Alaska Territory      NA      25
4    G040           Arizona       4      40
5    G045 Arizona Territory      NA      45
6    G050          Arkansas       5      50

#Completed

head(select(statepopulations, -(GISJOIN:STATENH)))

X1790 X1800 X1810  X1820  X1830  X1840  X1850  X1860  X1870   X1880
1    NA    NA    NA 127901 309527 590756 771623 964201 996992 1262505
2    NA    NA    NA     NA     NA     NA     NA     NA     NA      NA
3    NA    NA    NA     NA     NA     NA     NA     NA     NA   33426
4    NA    NA    NA     NA     NA     NA     NA     NA     NA      NA
5    NA    NA    NA     NA     NA     NA     NA     NA   9658   40440
6    NA    NA    NA     NA     NA  97574 209897 435450 484471  802525
X1890   X1900   X1910   X1920   X1930   X1940   X1950   X1960   X1970
1 1513017 1828697 2138093 2348174 2646248 2832961 3061743 3266740 3444165
2      NA      NA      NA      NA      NA      NA      NA  226167  300382
3   32052   63592   64356   55036   59278   72524  128643      NA      NA
4      NA      NA      NA  334162  435573  499261  749587 1302161 1770900
5   59620  122931  204354      NA      NA      NA      NA      NA      NA
6 1128179 1311564 1574449 1752204 1854482 1949387 1909511 1786272 1923295
X1980   X1990   X2000   X2010   X2020
1 3893888 4040587 4447100 4779736 5024279
2  401851  550043  626932  710231  733391
3      NA      NA      NA      NA      NA
4 2718215 3665228 5130632 6392017 7151502
5      NA      NA      NA      NA      NA
6 2286435 2350725 2673400 2915918 3011524
#Complete

> library(readr)

#4.3 Check the packaging EXAMPLE STATE POPULATIONS--------------------------------------

nrow(statepopulations)
#[1] 84

ncol(statepopulations)
#[1] 28
#DONE

#4.4 Run str()------------------------------------------------------------------

str(statepopulations)

#DONE BELOW

'data.frame':	84 obs. of  28 variables:
  $ GISJOIN: chr  "G010" "G020" "G025" "G040" ...
$ STATE  : chr  "Alabama" "Alaska" "Alaska Territory" "Arizona" ...
$ STATEFP: int  1 2 NA 4 NA 5 NA 6 8 NA ...
$ STATENH: int  10 20 25 40 45 50 55 60 80 85 ...
$ X1790  : int  NA NA NA NA NA NA NA NA NA NA ...
$ X1800  : int  NA NA NA NA NA NA NA NA NA NA ...
$ X1810  : int  NA NA NA NA NA NA NA NA NA NA ...
$ X1820  : int  127901 NA NA NA NA NA 14273 NA NA NA ...
$ X1830  : int  309527 NA NA NA NA NA 30388 NA NA NA ...
$ X1840  : int  590756 NA NA NA NA 97574 NA NA NA NA ...
$ X1850  : int  771623 NA NA NA NA 209897 NA 92597 NA NA ...
$ X1860  : int  964201 NA NA NA NA 435450 NA 379994 NA 34277 ...
$ X1870  : int  996992 NA NA NA 9658 484471 NA 560247 NA 39864 ...
$ X1880  : int  1262505 NA 33426 NA 40440 802525 NA 864694 194327 NA ...
$ X1890  : int  1513017 NA 32052 NA 59620 1128179 NA 1208130 412198 NA ...
$ X1900  : int  1828697 NA 63592 NA 122931 1311564 NA 1485053 539700 NA ...
$ X1910  : int  2138093 NA 64356 NA 204354 1574449 NA 2377549 799024 NA ...
$ X1920  : int  2348174 NA 55036 334162 NA 1752204 NA 3426861 939629 NA ...
$ X1930  : int  2646248 NA 59278 435573 NA 1854482 NA 5677251 1035791 NA ...
$ X1940  : int  2832961 NA 72524 499261 NA 1949387 NA 6907387 1123296 NA ...
$ X1950  : int  3061743 NA 128643 749587 NA 1909511 NA 10586224 1325089 NA ...
$ X1960  : int  3266740 226167 NA 1302161 NA 1786272 NA 15717204 1753947 NA ...
$ X1970  : int  3444165 300382 NA 1770900 NA 1923295 NA 19953134 2207259 NA ...
$ X1980  : int  3893888 401851 NA 2718215 NA 2286435 NA 23667902 2889964 NA ...
$ X1990  : int  4040587 550043 NA 3665228 NA 2350725 NA 29760021 3294394 NA ...
$ X2000  : int  4447100 626932 NA 5130632 NA 2673400 NA 33871648 4301261 NA ...
$ X2010  : int  4779736 710231 NA 6392017 NA 2915918 NA 37253956 5029196 NA ...
$ X2020  : int  5024279 733391 NA 7151502 NA 3011524 NA 39538223 5773714 NA ...

#4.5 Look at the top and the bottom of your data-------------------------------------------

head(statepopulations[, c(6:7, 10)])

> head(statepopulations[, c(6:7, 10)])
X1800 X1810  X1840
1    NA    NA 590756
2    NA    NA     NA
3    NA    NA     NA
4    NA    NA     NA
5    NA    NA     NA
6    NA    NA  97574

DONE--------------------------------------------------------------------------------------
tail(statepopulations[, c(6:7, 10)])

> tail(statepopulations[, c(6:7, 10)])
X1800 X1810 X1840
79    NA    NA    NA
80    NA    NA 30945
81    NA    NA    NA
82    NA    NA    NA
83    NA    NA    NA
84    NA    NA    NA
#DONE----------------------------------------------------------------------------------

#4.6 Check your “n”s-------------------------------------------------------------------

table(statepopulations$GISJOIN.STATE)

filter(statepopulations, "STATE" & Territory) %>% nrow

territory <- group_by("STATE",year= X1790:X2020)

statepopulations.f <- filter(statepopulations, "X2020" > 100000)

statepopulations <- arrange(statepopulations, desc(date))

statepopulations <-mutate(statepopulations)

statepopulations %>% mutate(STATE)
#--------------------------------------------------------------------?

#4.7 Validate with at least one external data source

summary(statepopulations$Sample.Measurement)

#Length  Class   Mode 
#0   NULL   NULL 
#--------------------------------------------------------------------?

#4.8 Try the easy solution first-------------------------------------

> ranking <- group_by(ozone, State.Name, County.Name) %>%
  +         summarize(ozone = mean(Sample.Measurement)) %>%
  +         as.data.frame %>%
  +         arrange(desc(ozone))

#--------------------------------------------------------------------?
4.9 Challenge your solution

> set.seed(10234)
> N <- nrow(ozone)
> idx <- sample(N, N, replace = TRUE)
> ozone2 <- ozone[idx, ]

4.10 Follow up questions-----------------------------------------------------------------


> ozone <- read_csv("data/hourly_44201_2014.csv", 
                    +                   col_types = "ccccinnccccccncnncccccc")
Error in `select()`:
  ! Can't subset columns past the end.
ℹ Locations 250000, 249999, 249998, …, 30, and 29 don't exist.
ℹ There are only 28 columns.

NPS <- readRDS("NPS")
dim(NPS)
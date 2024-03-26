str <- "string"
class(str)

a <- 5
class (a)

b <- 4L
class(b)

c <- 1+6i
class(c)

d <- b < 5
class(d)

a <- TRUE
b <- FALSE
a && b

a || b

!a

g <- 5/0

h <- 0/0

runif(2,10,20)

set.seed(1234)
runif(3)

sample(12.5)

sample(letters,4)

x <- 1:5

x <- -3:3

seq(from=1, to=5)
seq(1,5,2)

str <- c("a", "b", "c")
class(str)

a <- c(4,5.6, 20)
class(a)

b <- c(TRUE,FALSE)
class(b)

x <- rep(3,5)
x

c(TRUE,FALSE)

as.numeric(a)

as.logical(a)

v <- c(TRUE, 6, 1/0, NA, NaN, -6/0)

is.infinite(v)

is.nan.v

a <-3:7
b <- 20:24
a

m <- matrix(0,nrow=3, ncol=4)
m

dim(m)

dim(m) <- c(4,3)
m

m1 <- matrix(1:9, 3,3)
m2 <- matrix(rep(10,9),3,3)
m1

m1+m2

m1*m2

t(mr)

str <-c("a","b","c","d")

str[2:4]

m <- matrix(1:112, 3, 4)
m

str <- "clemson"
a <- 5
b <- 4L
list1 <- list(str,a,b)
list1
            
df <-data.frame(data=sample(12),title=LETTERS[sample(12)])
dim(df)

nrow(df)
ncol(df)
df

data(iris)
force(iris)

dim(iris)
head(iris)

names(iris)

names(Iris) <- c("a","b","c", "d", "e")

data("mtcars")
head(mtcars)

mpg1 <- mtcar$mpg
mpg1

a <- 5
if (a>3 {}
    
if (a>3) {
  print("a is NOT bigger than3")

a<-2
if (a>3 {
  print("a is bigger than 3
        } else {")
  
  
})
}
    
  
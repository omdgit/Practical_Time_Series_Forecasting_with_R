library(tseries)

sep11travel <- read.csv('./Data/Sept11Travel.csv')
View(sep11travel)

air.ts <- ts(sep11travel$air, start=c(1990, 1), end=c(2004, 1), frequency=12)
plot(air.ts)

rail.ts <- ts(sep11travel$rail, start=c(1990, 1), end=c(2004, 1), frequency=12)
plot(rail.ts)

car.ts <- ts(sep11travel$car, start=c(1990, 1), end=c(2004, 1), frequency=12)
plot(car.ts)

plot(decompose(air.ts))
plot(decompose(rail.ts))
plot(decompose(car.ts))


##########################################################
# Problem 2:

library(readxl)
DepartmentStoreSales <- read_excel("Data/DepartmentStoreSales.xls", 
                                   col_types = c("numeric", "numeric"))
View(DepartmentStoreSales)

sales.ts <- ts(DepartmentStoreSales$Sales, start=c(2000, 1), 
               end=c(2005, 4), frequency=4)
sales.ts

plot(sales.ts, type='o')
abline(v=c(2000:2005), col='grey', lty=2)

plot(decompose(sales.ts), type='o')

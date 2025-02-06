#### In Class Coding Challenge 1 #

#### Question 4 ####

# Create a vector named 'z' with the values 1 to 200 
z <- c(1:200)

# Print the mean and standard deviation of z on the console
mean(z)
sd(z)

# Create a logical vector named zlog that is 'TRUE' for z values greater than 30 and 'FALSE' otherwise.
zlog <- z > 30

# Make a dataframe with z and zlog as columns. Name the dataframe zdf 
zdf <- data.frame(z, zlog)

# Change the column names in your new dataframe to equal “zvec” and “zlogic” 
colnames(zdf) <- c("zvec", "zlogic")

# Make a new column in your dataframe equal to zvec squared (i.e., z2). Call the new column zsquared.
zdf$zsquared <- zdf$zvec^2

# Subset the dataframe with and without the subset() function to only include values of zsquared greater than 10 and less than 100 
zdf_subset1 <- subset(zdf, zsquared > 10 & zsquared < 100)
zdf_subset2 <- zdf[zdf$zsquared > 10 & zdf$zsquared < 100, ]

# Subset the zdf dataframe to only include the values on row 26 
row_26 <- zdf[26, ]

# Subset the zdf dataframe to only include the values in the column zsquared in the 180th row.
zsquared_180 <- zdf[180, "zsquared"]

# Annotate your code, commit the changes and push it to your GitHub 
# I am done - everything works

#### Question 5 ####

# Download the Tips.csv file from Canvas. Use the read.csv() 
# function to read the data into R so that the missing values are properly coded. 
# **Note the missing values are reported in the data as a period (i.e., “.”). 
# How do you know the data were read correctly? 

TipsR <- read.csv("~/Desktop/TipsR.csv")
str(TipsR)
TipsR[TipsR == "."] <- NA

# The data were read correctly because I crosschecked to the orignal raw data


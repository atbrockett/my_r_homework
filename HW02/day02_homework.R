# Complete all of the items below
# Use comments where you're having trouble or questions

# 1. Read your data set into R

my.data <- read.csv("Brockett_HW_Dataset.csv", header = TRUE)

# 2. Peek at the top few rows

head(my.data)

# 3. Peek at the top few rows for only a few columns

head(my.data[ , 2:5])
head(my.data[ , c(trial_type, perc_cor, mt)])
my.data[1:5, 2:5]

# 4. How many rows does your data have?

 nrow(my.data)
      # - 1072 rows

# 5. Get a summary for every column

summary(my.data)

# 6. Get a summary for one column

summary(my.data$perc_cor)

# 7. Are any of the columns giving you unexpected values?

      # No, all columns have values that make sense

# 8. Select a few key columns, make a vector of the column names

colnames(my.data[,2:3])

# 9. Create a new data.frame with just that subset of columns

new.data <- my.data[,2:3]

# 10. Create a new data.frame that is just the first 10 rows
#     and the last 10 rows of the data from the previous step

newdata.firstandlast <- new.data[c(1:10, 1063:1072),]

newdata.firstandlast <- new.data[c(1:10,(nrow(new.data)-9)): nrow(new.data), ]

# 11. Create a new data.frame that is a random sample of half of the rows.
# HINT: ?sample

newdata.sample <-new.data[sample(1:nrow(new.data), 536, replace = FALSE),]

newdata.sample <- sample(x = nrow(new.data), size = nrow(my.data)/2, replace = FALSE)

# 12. Find a comparison in your data that is interesting to make
#     (comparing two sets of numbers)
#     - run a t.test for that comparison


# "Vector"
perc.cor.t.test.vector <- t.test(my.data[1:536, 3], my.data[537:1072, 3], paired = TRUE)
perc.cor.t.test.vector

# Formula

perc.cor.t.test.formula <- t.test(my.data$perc_cor ~ my.data$trial_type, paired = TRUE)
perc.cor.t.test.formula

#     - decide whether you need a non-default test
#       (e.g., Student's, paired)

# - Paired is needed, because the same animals experienced both GO and STOP trials


# 13. Repeat #12 for TWO more comparisons

# Comparison looking at differences in movement time on GO vs STOP trials where animals were correct

# "Vector"
mt.t.test.vector <- t.test(my.data[1:536, 4], my.data[537:1072, 4], paired = TRUE)
mt.t.test.vector

# Formula

mt.t.test.formula <- t.test(my.data$mt ~ my.data$trial_type, paired = TRUE)
mt.t.test.formula

# Comparison looking at differences in movement times on GO vs STOP trials where animals were incorrect

# "Vector"
ermt.t.test.vector <- t.test(my.data[1:536, 5], my.data[537:1072, 5], paired = TRUE)
ermt.t.test.vector

# Formula

ermt.t.test.formula <- t.test(my.data$er_mt ~ my.data$trial_type, paired = TRUE)
ermt.t.test.formula


#     - ALTERNATIVELY, if correlations are more interesting,
#       do those instead of t-tests (and try both Spearman and
#       Pearson correlations)
#     - Tip: it's okay if the comparisons are kind of nonsensical, this is 
#       just a programming exercise

# 14. Save all results from #12 and #13 in an .RData file

save(perc.cor.t.test.vector, perc.cor.t.test.formula, mt.t.test.vector, mt.t.test.formula, ermt.t.test.vector, ermt.t.test.formula, file = "Brockett_HW02_Results.RData")

# 15. Email me your version of this script, PLUS the .RData
#     file from #14
#     - ALTERNATIVELY, push your version of this script and your .RData results
#       to a repo on GitHub, and send me the link



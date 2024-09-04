View(popest2023)

summary(popest2023)


most_pop_county = popest2023[which(popest2023$POPESTIMATE2023 == max(popest2023$POPESTIMATE2023)),]

least_pop_county = popest2023[which(popest2023$POPESTIMATE2023 == min(popest2023$POPESTIMATE2023)),]

# Q1 ans: California cityname: California
most_pop_county

# Q2 ans: Texas cityname: Loving County
least_pop_county


# Q3 ans: Texas  
idx = which(popest2023$NPOPCHG2023 == max(popest2023$NPOPCHG2023))
popest2023[idx,]


# Q4 ans: New York   
idx = which(popest2023$NPOPCHG2023 == min(popest2023$NPOPCHG2023))
popest2023[idx,]

# Q5 ans: median 38 
med = median(popest2023$NPOPCHG2023)
med


# Q6 ans: 4 counties median pop change 
num_con_med_change = sum(popest2023$NPOPCHG2023 == med)
num_con_med_change


# Q7 ans: mean county birth rate:
mbr = mean(popest2023$RBIRTH2023)
mbr

# Q8:::
?hist

hist(popest2023$RBIRTH2023, breaks = 29, 
     ylab='Number of Counties',
     xlab = 'Percentage of Births',
     main = 'Birth Rate of counties in 2023')

# saving to pdf

# writing to a pdf
pdf("County-wise_birth_rate.pdf", width = 12, height = 10)

# add the plot
hist(popest2023$RBIRTH2023, breaks = 29, 
     ylab='Number of Counties',
     xlab = 'Percentage of Births',
     main = 'Birth Rate of counties in 2023')
dev.off()
# writing to pdf is complete


# Q9 ans: 3 counties had Birth Rate greater than 25 in 2023
sum(popest2023$RBIRTH2023 > 25)

# Q10 

plot(x = popest2023$RBIRTH2023, y = popest2023$RDEATH2023, 
     xlab = 'Birth Rates in 2023', 
     ylab = 'Death Rates in 2023', 
     main='Birth Rates VS Death Rates IN 2023', col='grey')
?plot


# writing to a pdf
pdf("BrateVSDrate.pdf", width = 12, height = 10)

# add the plot
plot(x = popest2023$RBIRTH2023, y = popest2023$RDEATH2023, 
     xlab = 'Birth Rates in 2023', 
     ylab = 'Death Rates in 2023', 
     main='Birth Rates VS Death Rates IN 2023', col='grey')
dev.off()
# writing to pdf is complete

library('ggplot2')

#ggplot(popest2023,aes(x=popest2023$RBIRTH2023,y=popest2023$RDEATH2023)) + 
 # geom_point(aes(xlab = 'df', ylab='df'))


# Q11 ans: South Carolina's mean 2023 population is larger than North Carolina's

nc_idx = popest2023[,'STNAME'] == 'North Carolina'
nc_df = popest2023[nc_idx, c('STNAME', 'CTYNAME', 'POPESTIMATE2023')][-1,]
nc_df
nc_mean = mean(nc_df$POPESTIMATE2023)
nc_mean

sc_idx = popest2023[,'STNAME'] == 'South Carolina'
sc_df = popest2023[sc_idx, c('STNAME', 'CTYNAME', 'POPESTIMATE2023')][-1,]
sc_df
sc_mean = mean(sc_df$POPESTIMATE2023)
sc_mean

nc_mean - sc_mean


# Q12 ans: NC has larger max county population in 2023
nc_max = max(nc_df$POPESTIMATE2023)
sc_max = max(sc_df$POPESTIMATE2023)
nc_max
sc_max
nc_max - sc_max


# Q13 Larger in the sense of population 
# i couldn't find area in square mile in the dataframe

#   STNAME         CTYNAME            POPESTIMATE2023
#   <chr>          <chr>                        <dbl>
# 1 North Carolina Mecklenburg County         1163701
# 2 North Carolina Wake County                1190275

nc_df[nc_df$POPESTIMATE2023 > sc_max,]



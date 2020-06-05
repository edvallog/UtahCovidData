Day <- c(1:97)

dailyCases <- c(1,1,2,1,5,2,4,3,7,9,24,13,30,40,44,38,66,80,82,89,77,77,60,73,111,82,111,97,97,95,77,104,108,134,102,112,92,77,126,78,110,101,94,82,72,179,118,132,137,139,139,77,170,131,167,145,160,104,106,158,138,152,202,199,99,102,156,131,159,165,158,135,120,165,173,160,159,196,126,105,159,168,170,158,189,150,130,167,253,226,206,225,157,95,199,153,20)

dailyDeath <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 2, 1, 2, 0, 0, 1, 0, 5, 0, 0, 0, 4, 1, 0, 0, 1, 1, 1, 2, 2, 2, 1, 4, 2, 1, 4, 2, 0, 0, 4, 0, 1, 0, 3, 1, 0, 6, 2, 3, 0, 5, 1, 1, 5, 2, 0, 2, 1, 2, 0, 8, 2, 2, 1, 4, 1, 0, 3, 4, 1, 3, 3, 1, 0, 0, 4, 0) 

dailyHosp <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 73, 18, 9, 6, 11, 7, 14, 10, 10, 10, 15, 7, 5, 6, 12, 8, 17, 6, 7, 8, 9, 9, 11, 13, 14, 14, 16, 4, 21, 13, 7, 13, 15, 18, 5, 15, 8, 12, 12, 10, 14, 5, 18, 18, 5, 8, 12, 8, 9, 24, 12, 16, 13, 16, 8, 8, 12, 12, 18, 14, 15, 12, 14, 12, 28, 21)


Recov <- dplyr::lag(cumsum(dailyCases), n = 21) #cumulative estimated recoveries
  Recov[is.na(Recov)] <- 0

dailyRecov <- Recov - dplyr::lag(Recov) #estimated number of recoveries by day
  dailyRecov[is.na(dailyRecov)] <- 0

covidData <- data.frame(Day, dailyCases, dailyDeath, dailyHosp, dailyRecov) #puts daily modified data into data.frame
  covidData[is.na(covidData)] <- 0

  
totalDeath <- cumsum(covidData$dailyDeath)

aveDeath <- cumsum(covidData$dailyDeath) / seq_along(covidData$dailyDeath) #average deaths per day since first death

deathRate <- totalDeath / (totalDeath + Recov) #number of deaths per case with an outcome 

totalCases <- cumsum(covidData$dailyCases)

actCases <- totalCases - Recov - totalDeath #estimated number of active cases

actCaseChange <- (dailyCases / actCases) * 100 #percent change in ACTIVE cases by day 

caseChange <- dailyCases / (lag(totalCases) - 1) * 100  #percent change in cases by day based on total cases
  caseChange[is.na(caseChange)] <- 0

  
aveHosp <- cumsum(covidData$dailyHosp) / seq_along(covidData$dailyHosp) #average hospitalizations per day

totalHosp <- cumsum(covidData$dailyHosp) #total hospitalizations

hospRecov <- dplyr::lag(cumsum(dailyHosp), n=21) #estimated total hospital discharges
  hospRecov[is.na(hospRecov)] <- 0

totActHosp <- totalHosp - totalDeath - hospRecov #total estimated active hospitalizations

hospRate <- (totalHosp / totalCases) * 100 #percent hospitalizations for total cases



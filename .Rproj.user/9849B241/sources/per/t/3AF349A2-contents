stacked <- plot_ly(covidData, x = ~Day, y = ~totalDeath, type = 'bar', name = 'Total Deaths', marker = list(color = 'red'))
  stacked <- stacked %>% add_trace(y = ~actCases, name = 'Total  Active Cases', marker = list(color = '#fc7703'))
  stacked <- stacked %>% add_trace(y = ~Recov, name = 'Total Estimated Recoveries', marker = list(color = 'green'))
  stacked <- stacked %>% layout(yaxis = list(title = 'Counts'), barmode = 'stack')  #stacked plot of total cases, deaths and recoveries

totalCasesPlot <- plot_ly(covidData, x = ~Day)
  totalCasesPlot <- totalCasesPlot %>% add_trace(y = ~totalCases, name = 'Total Cases', mode = 'lines', 
  line = list(color = '#000000')) #marker plot of cumulative cases per day

totalCasesLog <- layout(totalCasesPlot, yaxis = list(type = "log")) #cumulative cases on a y-log scale to 
                                                                    #demonstrate the power of the exponential growth over time
deathRatePlot <- plot_ly(covidData, x = ~Day, y = ~deathRate, name = 'Death Rate (UT)', type = 'scatter', 
  mode = 'lines', line = list(color = '#737373')) #line plot depicting death rate over time

hospStack <- plot_ly(covidData, x = ~Day, y = ~totalDeath, type = 'bar', name = 'Total Deaths', marker = list(color = 'red'))
  hospStack <- hospStack %>% add_trace(y = ~totActHosp, name = 'Total  Active Hospitalizations', marker = list(color = '#fc7703'))
  hospStack <- hospStack %>% add_trace(y = ~hospRecov, name = 'Total Discharges', marker = list(color = '#0373fc'))
  hospStack <- hospStack %>% layout(yaxis = list(title = 'Counts'), barmode = 'stack')

outcomeStack <- plot_ly(covidData, x = ~Day, y = ~totalDeath, type = 'bar', name = 'Total Deaths', marker = list(color = 'red'))
  outcomeStack <- outcomeStack %>% add_trace(y = ~Recov, name = 'Total Recoveries', marker = list(color = 'green'))
  outcomeStack <- outcomeStack %>% layout(yaxis = list(title = 'Counts'), barmode = 'stack')
  
truRateChange <- plot_ly(covidData, x = ~Day, y = ~actCaseChange, name = 'True Case Change by Day (UT)', type = "bar",
                         marker = list(line = list (width = 1, color = '#000000')))

recVnew <- plot_ly(covidData, x = ~Day, y = ~dailyCases, name = 'Daily Cases (UT)', type = 'scatter', mode = 'lines')
  recVnew <- recVnew %>% add_trace(y = ~covidData$dailyRecov, name = 'Daily Recoveries (UT)')

netCaseChange <- plot_ly(covidData, x = ~Day, y = ~dailyCases - dailyRecov, name = 'Net Change in Cases (UT)', type = "bar",
                         marker = list(color = 'green'))

actcasesVrecov <- plot_ly(covidData, x = ~Day, y = ~actCases + totalDeath - Recov, name = "Net Cases Total (UT)", type = 'bar', 
                         marker = list(color = 'green'))
  


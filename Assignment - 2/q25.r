time <- 1:60 
 
temperature <- 
c(28,29,30,31,32,33,34,33,32,31,30,29,28,27,26,27,28,29,30,31, 
                 32,33,34,35,36,35,34,33,32,31,30,29,28,27,26,27,28,29,30,31, 
                 32,33,34,35,36,37,36,35,34,33,32,31,30,29,34,33,32,31,30,29) 
 
humidity <- 
c(45,44,43,42,41,40,39,38,37,38,39,40,41,42,43,44,45,44,43,42, 
              41,40,39,38,37,36,37,38,39,40,41,42,43,44,45,44,43,42,41,40, 
              39,38,37,36,35,36,37,38,39,40,41,42,43,44,39,40,41,42,43,44) 
 
pressure <- c(1012,1013,1014,1015,1016,1017,1016,1015,1014,1013, 
              1012,1011,1010,1009,1008,1009,1010,1011,1012,1013, 
              1014,1015,1016,1017,1018,1017,1016,1015,1014,1013, 
              1012,1011,1010,1009,1008,1009,1010,1011,1012,1013, 
              1014,1015,1016,1017,1018,1019,1018,1017,1016,1015, 
              1014,1013,1012,1011,1010,1009,1008,1009,1008,1009) 
 
avg_temp <- mean(temperature) 
avg_humidity <- mean(humidity) 
avg_pressure <- mean(pressure) 
 
cat("Average Temperature:", avg_temp, "\n") 
cat("Average Humidity:", avg_humidity, "\n") 
cat("Average Pressure:", avg_pressure, "\n\n") 
 
critical_intervals <- which(temperature > 30 & humidity < 40) 
cat("Time intervals where Temperature > 30°C and Humidity < 40%:\n") 
cat(critical_intervals, "\n") 
 
plot(time, temperature, type="l", col="red", ylim=c(25,40), 
     xlab="Time (minutes)", ylab="Sensor Readings", 
     main="Sensor Readings Over Time") 
lines(time, humidity, col="blue") 
lines(time, pressure/30, col="green") 
 
legend("topright", 
       legend=c("Temperature","Humidity","Pressure"),
       col=c("red","blue","green"), 
       lty=1)

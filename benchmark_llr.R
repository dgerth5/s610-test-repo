source("llr_functions.R")

library(reshape2)
library(microbenchmark)  
data(french_fries)

# Prepare data
french_fries = french_fries[complete.cases(french_fries),]
z = seq(0, 15, length.out = 100)

# Define omega values to test
omega_values = 1:10

library(microbenchmark)

for (omega in omega_values) {
  timing = microbenchmark(
    llr(z = z, x = french_fries$potato, y = french_fries$buttery, omega = omega),
    times = 10  
  )

  cat("Omega =", omega, "\n")
  print(timing)
}
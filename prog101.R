##########################################################################
## Driver: (Name) (GitHub Handle)                                       ##
## Navigator: (Name) (GitHub Handle)                                    ##
## Date: (YYYY-MM-DD)                                                   ##
##########################################################################

library(marinecs100b)

# Guiding questions -------------------------------------------------------

# What does KEFJ stand for? Kenai Fjords

# How was temperature monitored? using HOBO loggers, temperature loggers were places at each site
# and recorded temp every 20, 30, or 60min.

# What's the difference between absolute temperature and temperature anomaly?
# Anomalies: the difference from a long term mean
# absolute temperature is as recorded by the sensor


# Begin exploring ---------------------------------------------------------

# How many kefj_* vectors are there? there are six vectors

# How long are they? 1295038

# What do they represent? temperature, site names, datetime, tidelevel, exposure, season

# Link to sketch


Harris_datetime <- kefj_datetime[kefj_site == "Harris"]

Harris_interval <- Harris_datetime[2:(length(Harris_datetime))] - Harris_datetime[1:(length(Harris_datetime)-1)]
table(Harris_interval)

#The most common interval was 30min

# Problem decomposition ---------------------------------------------------

# When and where did the hottest and coldest air temperature readings happen?

# Link to sketch

# Plot the hottest day

hottest_idx <- which.max(kefj_temperature)
hottest_time <- kefj_datetime[hottest_idx]
hottest_site <- kefj_site[hottest_idx]
hotday_start <- as.POSIXct("2018-07-03 00:00", tz = "Etc/GMT+8")
hotday_end <- as.POSIXct("2018-07-04 00:00", tz = "Etc/GMT+8")
hotday_idx <- kefj_site == hottest_site &
  kefj_datetime >= hotday_start &
  kefj_datetime <= hotday_end
hotday_datetime <- kefj_datetime[hotday_idx]
hotday_temperature <- kefj_temperature[hotday_idx]
hotday_exposure <- kefj_exposure[hotday_idx]
plot_kefj(hotday_datetime, hotday_temperature, hotday_exposure)

# Repeat for the coldest day

coldest_idx <- which.max(kefj_temperature)
coldest_time <- kefj_datetime[coldest_idx]
coldest_site <- kefj_site[coldest_idx]
coldday_start <- as.POSIXct("2018-07-03 00:00", tz = "Etc/GMT+8")
coldday_end <- as.POSIXct("2018-07-04 00:00", tz = "Etc/GMT+8")
coldday_idx <- kefj_site == coldest_site &
  kefj_datetime >= coldday_start &
  kefj_datetime <= coldday_end
coldday_datetime <- kefj_datetime[coldday_idx]
coldday_temperature <- kefj_temperature[coldday_idx]
coldday_exposure <- kefj_exposure[coldday_idx]
plot_kefj(coldday_datetime, coldday_temperature, coldday_exposure)

# What patterns do you notice in time, temperature, and exposure? Do those
# patterns match your intuition, or do they differ?
#hottest and coldest in air as well as air/transition, not opposite in water,
#which is odd

# How did Traiger et al. define extreme temperature exposure?
#extreme warm >= 25 degrees C, etreme cold <=4 degrees C

# Translate their written description to code and calculate the extreme heat
# exposure for the hottest day.

kefj_exposure[kefj_temperature >= 25]
kefj_exposure[hottest_idx]
#says "air/transition"


# Compare your answer to the visualization you made. Does it look right to you?
#this seems correct because the peak of the graph is in the air/transition
#section

# Repeat this process for extreme cold exposure on the coldest day.

kefj_exposure[coldest_idx]
#says "air/transition"

# Putting it together -----------------------------------------------------

# Link to sketch

# Pick one site and one season. What were the extreme heat and cold exposure at
# that site in that season?

# Repeat for a different site and a different season.

# Optional extension: Traiger et al. (2022) also calculated water temperature
# anomalies. Consider how you could do that. Make a sketch showing which vectors
# you would need and how you would use them. Write code to get the temperature
# anomalies for one site in one season in one year.

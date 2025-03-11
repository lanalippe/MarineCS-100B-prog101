# What do the following expressions do?
temp_F <- temp_C * 9/5 - 32
#converting Celsius to Fahrenheit
rect_area <- rect_length * rect_width
#finding the area of a rectangle

# Fill in the question marks to complete these expressions
rect_area <- 1/2 * base * height
cylinder_volume <- pi * cylinder_radius^2 * cylinder_height

# What are the errors in these expressions?
  speed_m_s <- distance_m * time_s
# it should be distance / time
acceleration m s2 <- speed_m_s / time_s
#should be _ between m and s2
force_N < mass + acceleration_m_s2
# it should be <-, and mass * acceleration

# The energy density of market squid is 4850 joules per gram[1]. If a 225 kg
# Risso's dolphin needs 5 million joules of energy per day[2] and a typical
# market squid is 35 g[1], then how many squid does a Risso's dolphin need to
# eat each day? Solve the above word problem in R. Consider how many variables
# you need to create, what to name them to make the code readable, and how to
# combine them into expressions. answer is 29.45
squid_mass_g <- 35
squid_energy_density_Jg <- 4850
dolphin_energy_J <- 5000000
dolphin_energy/(squid_mass_g * squid_energy_density_Jg )

# [1] Price et al. 2024 https://doi.org/10.3389/fmars.2023.1345525
# [2] Barlow et al. 2008 https://doi.org/10.3354/meps07695


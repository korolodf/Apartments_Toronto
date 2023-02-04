#Simulating columns of the table we seek (first 5 cols)

#Simulation of possible total scores
score_s <- sample(x = 1:100, size = 5, replace = TRUE) 

#Simulation of possible numbers of storeys assuming that buildings do not exceed 50
storey_s <- sample(x = 1:50, size = 5, replace = TRUE) 

#Simulation of possible numbers of units assuming no more than 600
units_s <- sample(x = 1:600, size = 5, replace = TRUE)

#Simulation of possible scores for graffiti, walkways, cladding, and grounds which are out of 5 and are part of the sum which makes up the score value simulated above  
graffiti_s <- sample(x = 1:5, size = 5, replace = TRUE)
walkways_s <- sample(x = 1:5, size = 5, replace = TRUE)
cladding_s <- sample(x = 1:5, size = 5, replace = TRUE)
grounds_s <- sample(x = 1:5, size = 5, replace = TRUE)

#simulation of years built (assuming none earlier than 1800) and registered (assuming none earlier than 2017)
age_s <- sample(x = 1:250, size = 5, replace = TRUE)
registered_s <- sample(x = 2017:2023, size = 5, replace = TRUE)

#simulation of longitude and latitude assume that they should be +- 0.5'
longitude_s = runif(5, -79.8,-78.8)
latitude_s = runif(5, 43.1,44.1)

#making a data frame of the simulated columns yields what the first 5 rows of our df will look like after cleaning
df_s = data.frame(
  age = age_s,
  registered = registered_s,
  score = score_s,
  storeys = storey_s,
  graffiti = graffiti_s,
  walkways = walkways_s,
  cladding = cladding_s,
  grounds = grounds_s,
  longitude = longitude_s,
  latitude = latitude_s
)
df_s

#tests to ensure the data includes only includes appropriate data (e.g. not out of bounds)
#our score value should include no values greater than 100 or lesser than 0
max(df_s$score) > 100
min(df_s$score) < 0
#scores are inputted as whole numbers, so using the modulus to check that all elements divide by 1
any(df_s$score%%1!=0)

#we can simultaneously check that our exterior quality scores are within the correct bounds
max(df_s$graffiti, df_s$walkways, df_s$cladding, df_s$grounds) > 5
min(df_s$graffiti, df_s$walkways, df_s$cladding, df_s$grounds) < 0
#and that all are whole numbers
any((df_s$graffiti | df_s$cladding | df_s$walkways | df_s$grounds)%%1!=0)
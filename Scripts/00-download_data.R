library(opendatatoronto)
library(dplyr)
library(readr)

# get package
package <- show_package("4ef82789-e038-44ef-a478-a8f3590c3eb1")
package

# get all resources for this package
resources <- list_package_resources("4ef82789-e038-44ef-a478-a8f3590c3eb1")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
df <- filter(datastore_resources, row_number()==1) %>% get_resource()

write_csv(df, here::here("Inputs/data/raw_df.csv"))
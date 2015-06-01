library('RPostgreSQL')

pword <- read.csv('~/DSSG/project-inspector-gadget/password.txt', header = F, stringsAsFactors= F)

drv <- dbDriver('PostgreSQL')
con <- dbConnect(drv, 
                 host = "dssgsummer2014postgres.c5faqozfo86k.us-west-2.rds.amazonaws.com",
                 dbname = "training_2015",
                 user = "westerlund",
                 password = pword)

full_data <- dbGetQuery(con, 'SELECT * FROM masha.building_violations')

data <- dbGetQuery(con, 'SELECT * FROM masha."Building_Violations_sample_50000"')

dbDisconnect(con)

View(head(data))
tail(data)

dim(data)

sapply(data,class)

data <- data[,!names(data) %in% 'SSA']

names(data) <- gsub(" ", "_", names(data))

summary(data)
sapply(data, is.na)


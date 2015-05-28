library('RPostgreSQL')

pword <- read.csv('~/DSSG/project-inspector-gadget/password.txt', header = F, stringsAsFactors= F)

drv <- dbDriver('PostgreSQL')
con <- dbConnect(drv, 
                 host = "dssgsummer2014postgres.c5faqozfo86k.us-west-2.rds.amazonaws.com",
                 dbname = "training_2015",
                 user = "westerlund",
                 password = pword)

data <- dbGetQuery(con, 'SELECT * FROM masha.building_violations')

dbDisconnect(con)

View(head(data))
tail(data)

dim(data)

sapply(data,class)

data <- data[,!names(data) %in% 'SSA']

df$ID

data$VIOLATION.DATE <- as.character(data$VIOLATION.DATE)

data$VIOLATION.DATE <- as.Date(data$VIOLATION.DATE, format = '%m/%d/%Y')

head(data$VIOLATION.DATE)
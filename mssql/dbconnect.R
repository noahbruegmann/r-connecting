# Sets up a connection between R and MSSQL database
# Creates some convenience functions for pulling data
## Usage:
 # Create a CSV file with database login info (sample in this folder)
 # Declare environment variable at top of R script to point to CSV
 # Source this script to set up your connection. I.e. source("~/PathToFile/dbconnect.R)

library("RJDBC")
library("data.table")
drv <- JDBC("com.microsoft.sqlserver.jdbc.SQLServerDriver",
            "/etc/jdbc/sqljdbc_4.2/enu/sqljdbc4.jar") # Replace this filepath with wherever you've saved your .jar file
creds <- read.csv(Sys.getenv("DB_FILE"))
conn <- dbConnect(drv, as.character(creds$URL[1]), as.character(creds$User[1]), as.character(creds$Password[1]))

sqlFromFile <- function(fileName) {
  sqlText <- readChar(fileName, file.info(fileName)$size)
  data <- dbGetQuery(conn, sqlText)
  data <- data.table(data)
  return(data)
}

sqlFromText <- function(textString) {
  data <- dbGetQuery(conn, textString)
  data <- data.table(data)
  return(data)
}

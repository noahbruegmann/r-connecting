# Example of how to use the dbconnect.R script

# First, set the environment variable that tells the connect script where to go for your credentials
Sys.setenv(DB_FILE="~/PathToYourCredentials/.dbcreds")

# Run the connect script so you're connected and have helper functions
source("./dbconnect.R")

# Use it!
example <- sqlFromText("
SELECT TOP 100 *
FROM Users;
                       ")

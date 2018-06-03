# Sets up a connection between R and MySQL database.
# Originally tested against a MAMP (Mac rather than Linux running LAMP stack) setup, 
# will need to adjust to use against an external database.

# Mysql
library('RMySQL')
drv <- dbDriver("MySQL")
conn <- mysqlNewConnection(drv=drv,host='localhost',port=8889,user='root',password='root',unix.socket='/Applications/MAMP/tmp/mysql/mysql.sock')
str_sql <- paste("select * from trade.stock")
stock <- dbGetQuery(conn,str_sql) # stock will be a data.frame object that looks just like the output of your query

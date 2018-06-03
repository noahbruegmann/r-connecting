# Sets up a connection between R and Elasticsearch.
# Originally tested against an AWS cluster on VPN.
# The process of 

library(elastic)

# The way the elastic package handles connections is a bit odd. You just set the connection and it
# holds onto it. There are comments on the package github that says they're going to change this
#soon to the more usual pattern of defining the connection as a variable and passing it as an
# argument to Search. That way, you can maintain multiple connections. This script will probably
# break at some point soon when they make that change.
# Setting the path = "" is suggested for all AWS connections because the region gets interpreted
# as the path otherwise. Setting port = "" was less obvious, but if you use Kibana, you'll see that
# the post isn't specified in the browser (or if it is, you'll want to use that port here.)
# If you get the connection wrong, it can run without error, only to give you a 404 no such index
# error when you try to use Search.
connect(es_host = 'something-something-something.us-west-1.es.amazonaws.com/', 
        es_transport_schema = 'https',
        es_port = "",
        es_path = "")

# To use the Search function, you need to define your index. To figure out what indicies are available, you can use:
# curl -X GET "https://something-something-something.us-west-1.es.amazonaws.com/_cat/indices?v"
Search(index="my-index-2017", size=1)
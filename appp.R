library(shiny)
install.packages("rsconnect")
library(rsconnect)
source("my_uii.R")
source("my_serverr.R")

# Add a dynamic title to the hot dog plot
# Publish your Shiny App to the web


shinyApp(ui = ui, server = server)

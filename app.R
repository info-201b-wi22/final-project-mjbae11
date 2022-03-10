library("shiny")
library("rsconnect")
library("bslib")
ui <- source("my_ui.R")
server <- source("my_server.R")



shinyApp(ui = ui$value, server = server$value)

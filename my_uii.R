library(ggplot2)
library(plotly)

intro_tab <- tabPanel(
  "Introduction",
  fluidPage(
    p("This is a demo web app!")
  )
)

plot_sidebar <- sidebarPanel(
  selectInput(
    inputId = "user_category",
    label = "Color By",
    choices = list("Year" = "year",
                   "Names" = "name",
                   "Gender" = "gender"),
    selected = "year"
  )
)

plot_main <- mainPanel(
  plotlyOutput(outputId = "hotdogPlot")
)

plot_tab <- tabPanel(
  "Plot",
  sidebarLayout(
    plot_sidebar,
    plot_main
  )
)



ui <- navbarPage(
  "Hot Dog Contests 🌭",
  intro_tab,
  plot_tab
)
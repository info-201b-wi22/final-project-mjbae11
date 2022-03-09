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

plot2_tab <- tabPanel(
  "Plot 2",
  sidebarLayout(
    plot_sidebar,
    plot_main
  )
)

plot3_tab <- tabPanel(
  "Plot 3",
  sidebarLayout(
    plot_sidebar,
    plot_main
  )
)

conclusion_tab <- tabPanel(
  "Conclusion",
  fluidPage(
    p("This is the conclusion page.")
  )
)



ui <- navbarPage (
  "Final Project",
  intro_tab,
  plot_tab,
  plot2_tab,
  plot3_tab,
  conclusion_tab
)


library(ggplot2)
library(plotly)

# Data source: https://apreshill.github.io/data-vis-labs-2018/01-eda_hot_dogs.html

hotdog_df <- read.csv("https://raw.githubusercontent.com/apreshill/data-vis-labs-2018/master/data/hot_dog_contest.csv")

custom_legend_titles <- reactiveValues("year" = "Year of Contest", "gender" = "Gender of Athlete", "name" = "Name of Athlete")

# custom_titles <- create custom titles

server <- function(input, output) {

  output$hotdogPlot <- renderPlotly({
    # Make a scatter plot of the number of hot dogs eaten over time
    # Allow the user to select the color category
    my_plot <- ggplot(data = hotdog_df) +
      geom_point(mapping = aes(x = year, y = num_eaten, color= get(input$user_category))) +

      labs(title = "Title", color = custom_legend_titles[[input$user_category]])

    # Make interactive plot
    # Remove mode bar
    my_plotly_plot <- ggplotly(my_plot) %>%
      config(displayModeBar = FALSE)

    return(my_plotly_plot)
  })

}


library(ggplot2)
library(plotly)
library(shiny)
library(bslib)



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



library(ggplot2)
library(plotly)
library(shiny)
library(bslib)
library(dplyr)

# Data source: https://apreshill.github.io/data-vis-labs-2018/01-eda_hot_dogs.html

death_data <- read.csv('all_deaths.csv')

custom_legend_titles <- reactiveValues("year" = "Year of Contest", "gender" = "Gender of Athlete", "name" = "Name of Athlete")

# custom_titles <- create custom titles

# server <- function(input, output) {
# 
#   output$hotdogPlot <- renderPlotly({
#     # Make a scatter plot of the number of hot dogs eaten over time
#     # Allow the user to select the color category
#     my_plot <- ggplot(data = hotdog_df) +
#       geom_point(mapping = aes(x = year, y = num_eaten, color= get(input$user_category))) +
# 
#       labs(title = "Title", color = custom_legend_titles[[input$user_category]])
# 
#     # Make interactive plot
#     # Remove mode bar
#     my_plotly_plot <- ggplotly(my_plot) %>%
#       config(displayModeBar = FALSE)
# 
#     return(my_plotly_plot)
#   })
# 
# }

all_deaths <- all_deaths %>%
  mutate(race_full = case_when(race == "B" ~ 'Black',
                               race == "W" ~ 'white',
                               race == "H" ~ 'Hispanic',
                               race == "A" ~ 'Asian',
                               race == "AI" ~ 'Native American/Indigenous',
                               race == "O" ~ 'Other',
                               race == "NA" ~ 'Not Stated'))


all_deaths <- all_deaths %>%
  mutate(cause_death_full = case_when(cause_short == "M" | cause_short == "m" ~ 'Medical',
                                      cause_short == "S" ~ 'Suicide',
                                      cause_short == "DA" ~ 'Drug Abuse',
                                      cause_short == "H" ~ 'Homicide',
                                      cause_short == "O" ~ 'Other',
                                      cause_short == "A" | cause_short == "AC" ~ 'Accident',
                                      cause_short == "U" ~ 'Undetermined'))



race_bar_chart <- function() {all_deaths %>%
    ggplot(mapping = aes(x = race, fill = race)) +
    labs(title = "Breakdown of Incarcerated Races", subtitle = "Who Have Died in Prison") +
    geom_bar() 
  
}

Plot <- ggplotly(race_bar_chart)




#Based on the printed bar chart, the majority of people who have died in prison 
#are white. However, the population of white people in the US is and the incarcerated population is ___.
#The population of 


server <- function(input, output) 
  output$Plot <- renderPlotly ({race_bar_chart <- all_deaths %>%
    ggplot(mapping = aes(x = race, fill = race)) +
    labs(title = "Breakdown of Incarcerated Races", subtitle = "Who Have Died in Prison") +
    geom_bar() 
  Plot <- ggplotly(race_bar_chart) %>%
    config(displayModeBar = FALSE)
  return(Plot)})





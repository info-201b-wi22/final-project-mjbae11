library(ggplot2)
library(plotly)
library(shiny)
library(bslib)


intro_tab <- tabPanel(
  "Introduction",
  fluidPage(theme = bs_theme(bootswatch = "darkly", primary = "#35512A"),
    h1("Questions We Are Seeking To Answer", align = "center"), 
    p("How many people who have died while being incarcerated who were not convicted?"), 
    p("What correlations are there between cause of death and race, if any?"), 
    p("What is the main cause of death?"), 
    h1("Data We Are Using To Answer Our Questions"), 
    p("We are using the dataset from Reuters Investigates. Reuters has filed over 1,500 public record requests to get data related to people dying while being incarcerated from 2008 to 2020. As Reuter notes, the U.S. Justice Department does not have this information publicly available, which necessitated Reuter finding the data on their own accord and having it available for public use"),
    img(src='jail_cell.png', align = "center"),
    #theme = bs_theme(
                  #bootswatch = "darkly"),
    h1("Issues That May Occur With The Data"),
    p("Some issues with the dataset is that it has limited data points as not only a few public record requests were fulfilled and the data is not representative of all deaths that have occurred in prison, just the data that could be accessed and made public. Furthermore, there are a lot of NA values, as a result, leaves a few holes in the data and issues with how to get around it when we analyze the data and questions whether or not to include the NA values. We chose to keep the NA values when we could because the NA values show how inaccessible some parts and details of the topic are, and excluding those values can skew the data.
"))
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
    plot_main, sliderInput(inputId = "slider_year", label = "Years Selected", value = c(2008, 2020), min = 2008, max = 2020)

    
  ))


plot2_tab <- tabPanel(
  "Plot 2",
  sidebarLayout(
    plot_sidebar,
    plot_main,
    (radioButtons(inputId = "unconvicted/convicted_button",
                  label = "Conviction Status", 
                  choices = list(custody_status$C = "Convicted", custody_status$U = "Unconvicted")
                  ))
    
  ))




plot3_tab <- tabPanel(
  "Plot 3",
  sidebarLayout(
    plot_sidebar,
    plot_main,
    (checkboxGroupInput(inputId = "causes_of_death",
                        label = "Cause of Death", 
                        choices = list("Medical" = Medical, "Suicide" = Suicide, "Drug_Abuse" = DrugAbuse, "Homicide" = Homicide, "Other" = Other, "Accident" = Accident,
                                       "Undetermined" = Undetermined))
    )))



##^^might need to fix the code for the widget above later

conclusion_tab <- tabPanel(
  "Conclusion",
  fluidPage(
    h1("Conclusion"), p("INSERT TEXT DESCRIBING OUR FINDINGS AND WHAT WE CONCLUDE")
  ))



ui <- navbarPage (
  "Final Project",
  intro_tab,
  plot_tab,
  plot2_tab,
  plot3_tab,
  conclusion_tab
)



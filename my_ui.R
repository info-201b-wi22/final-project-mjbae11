library(ggplot2)
library(plotly)
library(shiny)
library(bslib)


ui <- fluidPage(
  
  intro_tab <- tabPanel(
  "Introduction",
  fluidPage(theme = bs_theme(bootswatch = "darkly", primary = "#35512A"),
    h1("Questions We Are Seeking To Answer", align = "center"), 
    p("How many people who have died while being incarcerated who were not convicted?"), 
    p("What correlations are there between cause of death and race, if any?"), 
    p("What is the main cause of death?"), 
    h1("Data We Are Using To Answer Our Questions"), 
    p("We are using the dataset from Reuters Investigates. Reuters has filed over 1,500 public record requests to get data related to people dying while being incarcerated from 2008 to 2020. As Reuter notes, the U.S. Justice Department does not have this information publicly available, which necessitated Reuter finding the data on their own accord and having it available for public use. The link is provided below."),
    a("Reuters Investigates", href = "https://www.reuters.com/investigates/special-report/usa-jails-graphic/"),
    img(src='jail_cell.png', align = "center"),
    h1("Issues That May Occur With The Data"),
    p("Some issues with the dataset is that it has limited data points as not only a few public record requests were fulfilled and the data is not representative of all deaths that have occurred in prison, just the data that could be accessed and made public. Furthermore, there are a lot of NA values, as a result, leaves a few holes in the data and issues with how to get around it when we analyze the data and questions whether or not to include the NA values. We chose to keep the NA values when we could because the NA values show how inaccessible some parts and details of the topic are, and excluding those values can skew the data.
"))
    ),
  
plot_sidebar <- sidebarPanel(
  selectInput(
    inputId = "user_category",
    label = "Color By",
    choices = list("Year" = "year",
                   "Names" = "name",
                   "Gender" = "gender"),
    selected = "year"
  )
),

plot_main <- mainPanel(
  plotlyOutput(outputId = "hotdogPlot")
),

plot_tab <- tabPanel(
  "Plot",
  sidebarLayout(
    plot_sidebar,
    plot_main, sliderInput(inputId = "slider_year", label = "Years Selected", value = c(2008, 2020), min = 2008, max = 2020)

    
  )),


plot2_tab <- tabPanel(
  "Plot 2",
  sidebarLayout(
    plot_sidebar,
    plot_main,
    (radioButtons(inputId = "unconvicted/convicted_button",
                  label = "Conviction Status", 
                  choices = list("Convicted" = "C", "Unconvicted" = "U")
                  ))
    
  )),




plot3_tab <- tabPanel(
  "Plot 3",
  sidebarLayout(
    plot_sidebar,
    plot_main,
    (checkboxGroupInput(inputId = "causes_of_death",
                        label = "Cause of Death", 
                        choices = list("Medical" = "Medical", "Suicide" = "Suicide", "Drug_Abuse" = "Drug Abuse", "Homicide" = "Homicide", "Other" = "Other", "Accident" = "Accident",
                                       "Undetermined" = "Undetermined"))
    ))),



##^^might need to fix the code for the widget above later

conclusion_tab <- tabPanel(
  "Conclusion",
  fluidPage(
    h1("Conclusion"), p("Our findings reveal harrowing conclusions about the already corrupt and unjust prison system in the United States. It is much worse than the average person knows or imagines. As an early disclaimer, analyzing this data set cannot reveal all the issues with this data set with the prison system in the United States, and we are limited to what the dataset was able to provide. 
We can see how significantly higher unconvicted prisoners die compared to convicted prisoners based on the interactive plot. When the percentages of unconvicted prisoners and convicted prisoners is calculated, it’s 66.03% for unconvicted prisoners to 33.97% for convicted prisoners. The majority of people incarcerated were not given a conviction and never saw their date in court as they should have, and receive a trial.
Additionally, when looking at the boxplot for ages and race, we can see that the youngest person who was convicted was Black and died at the age of fifteen, and there is no data available for the date of incarceration. Black youth incarceration is significantly higher than white youth incarceration. Black youth are five times more likely to be incarcerated compared to their white counterparts. Even though it’s just one data point in the boxplot, it is reflective of the real world and how Black children are treated as adults and punished and incarcerated at higher rates than white children. 
Observing the cause of death with another interactive plot, we can see that a little over 25% of people commit suicide in prison. That is about one and four people, and says a lot about the conditions incarcerated people have to endure for them to commit suicide. Incarcerated people are placed in vulnerable positions where people in power in prisons can be abusive and violent towards them with little fear of repercussions, have virtually no access to mental health resources, and are put in overcrowded and insufficiently resourced facilities. 
Looking at our findings collectively and individually, it is clear that the prison system needs to be changed, and is reflective of so many different systems of oppression at hand and complexes. The prison system shows symptoms of a racist and capitalist society and the workings of the prison industrial complex. Those are not the only systems of oppression that are present in prison, but the ones we can observe based on this dataset. The United States has had issues with mass incarceration for decades with it only getting worse as time goes on that the public must be educated on and made aware of, and demand change for."),
    
   
  ))



)


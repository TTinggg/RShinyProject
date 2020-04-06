
library(shiny)
library(shinyWidgets)



shinyUI(tagList(
    tags$head(tags$script(type="text/javascript", src ="code.js")),
    navbarPage(
       title="James Bond Performance",
           
        tabPanel("Movie Comparsion ",
                 
                 # Sidebar with a slider input for number of bins
                 sidebarLayout(
                     sidebarPanel(
                         h4("Filter"),
                         
                         sliderInput("year", "Year released", 1940, 2014, value = c(1970, 2014),
                                     sep = ""),
                         sliderInput("budget", "Budget (millions)", 0, 800, c(0, 800), step = 1),
                         sliderInput("boxoffice", "Dollars at Box Office (millions)",
                                     0, 800, c(0, 800), step = 1),
                         awesomeCheckbox(
                             inputId = "aw",
                             label = "Award?", 
                             value = TRUE
                         )
                        ),
                     
                     mainPanel(
                         fluidPage(fluidRow(
                             column(6,
                                    plotOutput(
                                        "plot", width = "700px", height = "600px"
                                    )),
                             column(6,
                                    DT::dataTableOutput("dataSet"),
                                    fluidRow(
                                        column(3, offset = 3,
                                               br(),
                                        ),
                                        column(3, offset = 3,
                                               img(src="007Logo.png",
                                                 height=50,width=100 )
                                        )))
                             
                         ))
                         
                     )
                 )
        ),
        tabPanel("The Bonds", 
                 sidebarLayout(
                     sidebarPanel(
                         h4("Actors"),
                         
                         checkboxGroupInput(
                             inputId = "checkbox",
                             h4("Which Era of 007?"),
                             choices = list(
                                 'Daniel Craig'='Daniel.Craig',
                                 'George Lazenby'= 'George.Lazenby',
                                 'Pierce Brosnan'='Pierce.Brosnan',
                                 'Roger Moore'='Roger.Moore',
                                 'Sean Connery'='Sean.Connery',
                                 'Timothy Dalton'='Timothy.Dalton'
                                 
                                 
                             ),
                             selected = c('Daniel.Craig',
                                          'George.Lazenby',
                                          'Pierce.Brosnan',
                                          'Roger.Moore',
                                          'Sean.Connery',
                                          'Timothy.Dalton')
                         )
                     ),
                     
                     mainPanel(
                         
                         plotOutput("radarplot"),
                         textOutput("selected_num")
                     )
                         
                     )
                 ),
       navbarMenu("007 Elements",
                  tabPanel("Car",
                           fluidPage(fluidRow(
            column(6,
                   plotOutput(
                       "car", width = "700px", height = "600px"
                   )),
            column(6,
                   p("This is text for cars"
                       
                 ))
            
        ))
    ),tabPanel("Kill",
               fluidPage(fluidRow(
                   column(6,
                          plotOutput(
                              "kill", width = "700px", height = "600px"
                          )),
                   column(6,
                          p("This is text for kill"
                            
                          ))
    )
)
))
)
))







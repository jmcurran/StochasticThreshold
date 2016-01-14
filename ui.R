library(markdown)

shinyUI(navbarPage("Stochastic Threshold Calculator",
         tabPanel("Load Data",
                  sidebarLayout(
                    sidebarPanel(
                      fileInput('file1', 'Choose CSV File',
                                accept=c('text/csv', 
                                         'text/comma-separated-values,text/plain', 
                                         '.csv')),
                      tags$hr(),
                      checkboxInput('header', 'Header', TRUE),
                      radioButtons('sep', 'Separator',
                                   c(Comma=',',
                                     Semicolon=';',
                                     Tab='\t'),
                                   ','),
                      radioButtons('quote', 'Quote',
                                   c(None='',
                                     'Double Quote'='"',
                                     'Single Quote'="'"),
                                   '"')
                    ),
                    mainPanel(
                      tableOutput('contents')
                    )
                  )
         ),
         tabPanel("Logistic Regression",
                  sidebarLayout(
                    sidebarPanel(
                      selectInput('aphColName', 'Average Peak Height Variable', NULL),
                      numericInput('dropThresh', 'Dropout Threshold', 25,
                                   min = 1, max = 150),
                      selectInput('missVal', 'Missing value code', c('0',NA)),
                      checkboxInput('weightReg', 'Weight regression', value = TRUE),
                      sliderInput('alphaVal', HTML("&alpha;:"), 0.001, 0.1, 0.001, step = 0.001)
                    ),
                    mainPanel(
                      plotOutput('plot1')
                    )
                  )
         ),
         tabPanel("About",
                      fluidRow(
                               column(6,
                                      includeMarkdown("about.md")
                               ),
                               column(3,
                                      img(class="img-polaroid",
                                          src=paste0("https://www.stat.auckland.ac.nz/images/people/jamescurran.jpg"))
                               )
                             )
                    )
         )
)

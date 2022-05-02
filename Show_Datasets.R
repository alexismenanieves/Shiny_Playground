library(shiny)
library(dslabs)

ui <- fluidPage(
  selectInput("dataset", label="Dataset", choices=ls("package:dslabs")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)

server <- function(input, output, session){
  
}

shinyApp(ui, server)
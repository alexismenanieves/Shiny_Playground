library(shiny)

ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices=ls("package:dslabs")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)

server <- function(input, output, session){
  
}
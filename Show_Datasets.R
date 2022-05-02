library(shiny)
library(dslabs)

ui <- fluidPage(
  selectInput("dataset", label="Dataset", choices=ls("package:dslabs")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)

server <- function(input, output, session){
  output$summary <- renderPrint({
    dataset <- get(input$dataset, "package:dslabs") 
    summary(dataset)
  })
  output$table <- renderTable({
    dataset <-get(input$dataset, "package:dslabs")
    dataset
  }) 
}

shinyApp(ui, server)
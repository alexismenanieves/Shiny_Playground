library(shiny)
library(dslabs)

ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices = ls("package:dslabs")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)

server <- function(input, output, server)({
  dataset <- reactive(
    # Use a reactive expression by calling it like a function
    # This means, a reactive expression is called like a function
    get(input$dataset, "package:dslabs")
  )
  
  output$summary <- renderPrint(summary(dataset()))
  
  output$table <- renderTable(dataset())
})

shinyApp(ui, server)

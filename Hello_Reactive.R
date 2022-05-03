library(shiny)
library(dslabs)

ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices = ls("package:dslabs")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)

server <- function(input, output, server)({
  dataset <- reactive(
    get(input$dataset, "package:dslabs")
  )
  
  output$summary <- renderPrint(summary(dataset()))
  
  output$table <- renderTable(dataset())
})

shinyApp(ui, server)

library(shiny)
library(ggplot2)

datasets <- c("economics", "faithfuld", "seals")

ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices = datasets),
  verbatimTextOutput("summary"),
  # The error was tableOutput
  plotOutput("plot")
)

server <- function(input, output, session) {
  dataset <- reactive({
    get(input$dataset, "package:ggplot2")
  })
  output$summary <- renderPrint({
    # Error was summry
    summary(dataset())
  })
  output$plot <- renderPlot({
    # Error was dataset, wasn't called as a function
    plot(dataset())
  }, res = 96)
}

shinyApp(ui, server)
library(shiny)
library(dslabs)

ui <- fluidPage(
  # There's an input
  selectInput("numbers","Select a number", choices = c(1,2,3,4,5)),
  shiny::textInput("text", "Type a text"),
  # There must be an output
  textOutput("numbers"),
  textOutput("text"),
  verbatimTextOutput("summary")
)

server <- function(input, output, session){
  output$numbers <- renderText(input$numbers)
  output$text <- renderText(toupper(input$text))
  output$summary <- renderPrint(summary(1:10))
}

shinyApp(ui, server)
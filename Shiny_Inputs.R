library(shiny)
library(dslabs)

ui <- fluidPage(
  selectInput("numbers","Select a number", choices = c(1,2,3,4,5)),
  shiny::textInput("text", "Type a text"),
  textOutput("numbers"),
  textOutput("text")
)

server <- function(input, output, session){
  output$numbers <- renderText(input$numbers)
  output$text <- renderText(toupper(input$text))
}

shinyApp(ui, server)
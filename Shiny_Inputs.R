library(shiny)
library(dslabs)

ui <- fluidPage(
  # There's an input
  selectInput("numbers","Select a number", choices = c(1,2,3,4,5)),
  textAreaInput("text", "Type a text", rows = 3), 
  numericInput("numberinput", "Select other numbers", 
               min = 9, max = 20, value = 10),
  sliderInput("sliderinput", "Select on the sliders", 
              min = 5, max = 10, value = 7),
  # There must be an output
  textOutput("numbers"),
  textOutput("text"),
  verbatimTextOutput("summary"),
  textOutput("sliderinput")
)

server <- function(input, output, session){
  output$numbers <- renderText(input$numbers)
  output$text <- renderText(toupper(input$text))
  output$summary <- renderPrint(summary(1:10))
  output$sliderinput <- renderText(paste0("Twice: ", input$sliderinput * 2 ))
}

shinyApp(ui, server)
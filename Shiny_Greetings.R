# Create an app that greets the user by name. You don’t know all the 
# functions you need to do this yet, so I’ve included some lines of code 
# below. Think about which lines you’ll use and then copy and paste them 
# into the right place in a Shiny app.

library(shiny)

ui <- fluidPage(
  numericInput("age", "How old are you?", value = NA),
  textInput("name", "What's your name?"),
  # Whenever you are stuck, call the namespace shiny:: 
  textOutput("greeting"),
  plotOutput("histogram")
)

server <- function(input, output, server)({
  output$greeting <- renderText({
    paste0("Hello ", input$name)
  })
  
  output$histogram <- renderPlot({
    hist(rnorm(1000))
  }, res = 96)
  
})

shinyApp(ui, server)




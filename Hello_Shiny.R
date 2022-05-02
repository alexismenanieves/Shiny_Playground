library(shiny)
ui <- fluidPage(
  "Hello Shiny"
)

server <- function(input, output, session){
}
shinyApp(ui, server)

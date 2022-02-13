library(shiny)
library(fpp3) 
data("tourism")


ui <- fluidPage(
  
)

server <- function(input, output, session) {
  
}
selectInput(inputId = "Selected_Region", label = "Region", choices =unique(tourism$Region))
plotOutput("ts_plot")

server <- function(input, output) {
  output$ts_plot <- renderPlot ({
      Region1 <- subset(tourism, Region==input$Selected_Region)
      autoplot(Region1)
    }
  )
}



shinyApp(ui, server)